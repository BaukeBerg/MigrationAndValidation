module PreProcessor

import EcbHandler;
import ParseTree;
import PC20Syntax;

import utility::Debugging;
import utility::InstructionUtility;
import utility::StringUtility;

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
    compareValue = composeCompareValue(statements);
    insert (CodeBlock)`<CompiledInstruction* pre><CompareValue compareValue><CompiledInstruction *post>`;
  }  
  
  /// Compare
  case (CodeBlock)`<CompiledInstruction* pre> <ReadValue read> <CompareValue compare> <CompiledInstruction *post>`:
  {
    compareValue = composeCompareValue(read, compare);
    insert (CodeBlock)`<CompiledInstruction* pre><CompareValue compareValue><CompiledInstruction *post>`;
  }
  
  /// Assign
  case (CodeBlock)`<CompiledInstruction *pre> <ReadValue read> <WriteValue write> <CompiledInstruction *post>`:
  {
    assignValue = composeAssign(read, write);
    insert((CodeBlock)`<CompiledInstruction* pre><AssignValue assignValue> <CompiledInstruction *post>`);  
  }
};

// (partial) model representations
ReadValue composeReadValue(list[str] statements) = parse(#ReadValue, "<composeEcbPrefix("Chocolate", statements)>ReadValue <addressRange(statements)>");
WriteValue composeWriteValue(list[str] statements) = parse(#WriteValue, "<composeEcbPrefix("Lime", statements)>WriteValue <addressRange(statements)>");
CompareValue composeCompareValue(list[str] statements) = parse(#CompareValue, "<composeEcbPrefix("LightSeaGreen", statements)>CompareValue <addressRange(statements)>");
CompareValue composeCompareValue(ReadValue readValue, CompareValue compareValue)
{
  inputAddress = addressRange(readValue);
  outputAddress = addressRange(compareValue);  
  return parse(#CompareValue, "<composeEcbPrefix("LightSeaGreen", firstInteger(inputAddress), lastInteger(outputAddress))>CompareValue <inputAddress> to <outputAddress>");
}

AssignValue composeAssign(ReadValue readValue, WriteValue writeValue) 
{
  inputAddress = addressRange(readValue);
  outputAddress = addressRange(writeValue);  
  return parse(#AssignValue, "<composeEcbPrefix("Lime", firstInteger(inputAddress), lastInteger(outputAddress))>AssignValue <inputAddress> to <outputAddress>");
}



 

















