module PreProcessor

import EcbHandler;
import ParseTree;
import PC20Syntax;

import utility::InstructionUtility;

Tree preprocess(Tree tree) = innermost visit(tree)
{
  /// Fetch
  case (CodeBlock)`<CompiledInstruction* pre> <FetchInstruction fetch> <CompiledInstruction *post>`:
  {
    statements = ["<fetch>"];
    while((CodeBlock)`<FetchInstruction fetch><CompiledInstruction *newPost>`
      := (CodeBlock)`<CompiledInstruction *post>`)
    {
      post = newPost;
      statements += ["<fetch>"];
    }      
    readValue = composeReadValue(statements);
    insert (CodeBlock)`<CompiledInstruction* pre><ReadValue readValue><CompiledInstruction *post>`;
  }
  
  /// Store
  case (CodeBlock)`<CompiledInstruction* pre> <StoreValue store> <CompiledInstruction *post>`:
  {
    statements = ["<store>"];
    while((CodeBlock)`<StoreValue store><CompiledInstruction *newPost>`
      := (CodeBlock)`<CompiledInstruction *post>`)
    {
      post = newPost;
      statements += ["<store>"];
    }      
    writeValue = composeWriteValue(statements);
    insert (CodeBlock)`<CompiledInstruction* pre><WriteValue writeValue><CompiledInstruction *post>`;
  }
  
  /// Compare
  case (CodeBlock)`<CompiledInstruction* pre> <CompareInstruction compare> <CompiledInstruction *post>`:
  {
    statements = ["<compare>"];
    while((CodeBlock)`<CompareInstruction compare><CompiledInstruction *newPost>`
      := (CodeBlock)`<CompiledInstruction *post>`)
    {
      post = newPost;
      statements += ["<compare>"];
    }      
    comapreValue = composeCompareValue(statements);
    insert (CodeBlock)`<CompiledInstruction* pre><CompareValue comapreValue><CompiledInstruction *post>`;
  }  
};

// (partial) model representations
ReadValue composeReadValue(list[str] statements) = parse(#ReadValue, "<composeEcbPrefix("Chocolate", statements)>ReadValue <addressRange(statements)>");
WriteValue composeWriteValue(list[str] statements) = parse(#WriteValue, "<composeEcbPrefix("Lime", statements)>WriteValue <addressRange(statements)>");
CompareValue composeCompareValue(list[str] statements) = parse(#CompareValue, "<composeEcbPrefix("LightSeaGreen", statements)>CompareValue <addressRange(statements)>");