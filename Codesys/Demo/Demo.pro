CoDeSys+�   �                   @        @   2.3.9.50r   @   ConfigExtensionZ         CommConfigEx7             CommConfigExEnd   ME�                  IB                    % QB                    %   ME_End   CM�      CM_End   CT�   ��������   CT_End   MEE            +   ETHERNET TCP/IP 100MBit Controller (FW12-?) IB                    % QB                    %   ME_End   CMY     CM_End   CTu  ��������   CT_End   ME�                 IB                    % QB                    %   ME_End   CM�     CM_End   CT�  ��������   CT_End   P         P_End   CT,  ��������   CT_End   PC         P_End   CT^  ��������   CT_End�   IX                   %   CC�     CC_End   CT�  ��������   CT_End�   IX                  %   CC�     CC_End   CT�  ��������   CT_End   IX                  %   CC)     CC_End   CTE  ��������   CT_Endl   IX                  %   CCv     CC_End   CT�  ��������   CT_End   ME�                 IB                    % QB                    %   ME_End   CM�     CM_End   CT  ��������   CT_End   P.         P_End   CTI  ��������   CT_End   P`         P_End   CT{  ��������   CT_End�   IX                  %   CC�     CC_End   CT�  ��������   CT_End�   IX                  %   CC�     CC_End   CT  ��������   CT_End<   IX                  %   CCF     CC_End   CTb  ��������   CT_End�   IX                  %   CC�     CC_End   CT�  ��������   CT_End   ME                 IB                    % QB                    %   ME_End   CM     CM_End   CT4  ��������   CT_End   PK         P_End   CTf  ��������   CT_End   P}         P_End   CT�  ��������   CT_End�   IX                  %   CC�     CC_End   CT�  ��������   CT_End   IX   	               %   CC     CC_End   CT2  ��������   CT_EndY   IX   
               %   CCc     CC_End   CT  ��������   CT_End�   IX                  %   CC�     CC_End   CT�  ��������   CT_End   ME!                 IB                    % QB                    %   ME_End   CM5     CM_End   CTQ  ��������   CT_End   Ph         P_End   CT�  ��������   CT_End   P�         P_End   CT�  ��������   CT_End�   IX                  %   CC�     CC_End   CT	  ��������   CT_End)	   IX                  %   CC3	     CC_End   CTO	  ��������   CT_Endv	   IX                  %   CC�	     CC_End   CT�	  ��������   CT_End�	   IX                  %   CC�	     CC_End   CT�	  ��������   CT_End   ME>
                 IB                    % QB                    %   ME_End   CMR
     CM_End   CTn
  ��������   CT_End   P�
         P_End   CT�
  ��������   CT_End   P�
         P_End   CT�
  ��������   CT_End�
   QX                    %   CC     CC_End   CT  ��������   CT_EndF   QX                   %   CCP     CC_End   CTl  ��������   CT_End�   QX                   %   CC�     CC_End   CT�  ��������   CT_End�   QX                   %   CC�     CC_End   CT  ��������   CT_End   ME[                 IB                    % QB                    %   ME_End   CMo     CM_End   CT�  ��������   CT_End   P�         P_End   CT�  ��������   CT_End   P�         P_End   CT�  ��������   CT_End   QX                   %   CC      CC_End   CT<  ��������   CT_Endc   QX                   %   CCm     CC_End   CT�  ��������   CT_End�   QX                   %   CC�     CC_End   CT�  ��������   CT_End�   QX                   %   CC     CC_End   CT#  ��������   CT_End   MEx                 IB                    % QB                    %   ME_End   CM�     CM_End   CT�  ��������   CT_End   P�         P_End   CT�  ��������   CT_End   P�         P_End   CT  ��������   CT_End3   QX                   %   CC=     CC_End   CTY  ��������   CT_End�   QX    	               %   CC�     CC_End   CT�  ��������   CT_End�   QX    
               %   CC�     CC_End   CT�  ��������   CT_End   QX                   %   CC$     CC_End   CT@  ��������   CT_End   ME�                 IB                    % QB                    %   ME_End   CM�     CM_End   CT�  ��������   CT_End   P�         P_End   CT�  ��������   CT_End   P         P_End   CT)  ��������   CT_EndP   IW                    %   CCZ     CC_End   CTv  ��������   CT_End�   IW                   %   CC�     CC_End   CT�  ��������   CT_End   ME                 IB                    % QB                    %   ME_End   CM,     CM_End   CTH  ��������   CT_End   P_         P_End   CTz  ��������   CT_End   P�         P_End   CT�  ��������   CT_End�   IW                   %   CC�     CC_End   CT�  ��������   CT_End    IW                   %   CC*     CC_End   CTF  ��������   CT_End   ME�                 IB                    % QB                    %   ME_End   CM�     CM_End   CT�  ��������   CT_End   ME                  IB                    % QB                    %   ME_End   CM4     CM_End   CTP  ��������   CT_End   ConfigExtensionEnd?    @                                     ,x[ +    @      ��������             t�Z        v�  @   ]   C:\PROGRAM FILES (X86)\IFM ELECTRONIC\CODESYS V2.3\TARGETS\WAGO\LIBRARIES\32_BIT\STANDARD.LIB          ASCIIBYTE_TO_STRING               byt           ��                 ASCIIBYTE_TO_STRING                                         ���L  �   ����           CONCAT               STR1               ��              STR2               ��                 CONCAT                                         ���L  �   ����           CTD           M             ��           Variable for CD Edge Detection      CD            ��           Count Down on rising edge    LOAD            ��	           Load Start Value    PV           ��
           Start Value       Q            ��           Counter reached 0    CV           ��           Current Counter Value             ���L  �   ����           CTU           M             ��            Variable for CU Edge Detection       CU            ��       
    Count Up    RESET            ��	           Reset Counter to 0    PV           ��
           Counter Limit       Q            ��           Counter reached the Limit    CV           ��           Current Counter Value             ���L  �   ����           CTUD           MU             ��            Variable for CU Edge Detection    MD             ��            Variable for CD Edge Detection       CU            ��
       
    Count Up    CD            ��           Count Down    RESET            ��           Reset Counter to Null    LOAD            ��           Load Start Value    PV           ��           Start Value / Counter Limit       QU            ��           Counter reached Limit    QD            ��           Counter reached Null    CV           ��           Current Counter Value             ���L  �   ����           DELETE               STR               ��              LEN           ��	              POS           ��
                 DELETE                                         ���L  �   ����           F_TRIG           M             ��                 CLK            ��           Signal to detect       Q            ��	           Edge detected             ���L  �   ����           FIND               STR1               ��	              STR2               ��
                 FIND                                     ���L  �   ����           INSERT               STR1               ��	              STR2               ��
              POS           ��                 INSERT                                         ���L  �   ����           LEFT               STR               ��              SIZE           ��                 LEFT                                         ���L  �   ����           LEN               STR               ��                 LEN                                     ���L  �   ����           MID               STR               ��              LEN           ��	              POS           ��
                 MID                                         ���L  �   ����           R_TRIG           M             ��                 CLK            ��           Signal to detect       Q            ��	           Edge detected             ���L  �   ����        
   REAL_STATE               RESET            ��           Reset the variable       ERROR           ��           Error detected             ���L  �   ����           REPLACE               STR1               ��	              STR2               ��
              L           ��              P           ��                 REPLACE                                         ���L  �   ����           RIGHT               STR               ��              SIZE           ��                 RIGHT                                         ���L  �   ����           RS               SET            ��              RESET1            ��	                 Q1            ��                       ���L  �   ����           RTC           M             ��              DiffTime            ��                 EN            ��              PDT           ��                 Q            ��              CDT           ��                       ���L  �   ����           SEMA           X             ��                 CLAIM            ��
              RELEASE            ��                 BUSY            ��                       ���L  �   ����           SR               SET1            ��              RESET            ��                 Q1            ��                       ���L  �   ����           STANDARD_VERSION               EN            ��                 STANDARD_VERSION                                     ���L  �   ����           STRING_COMPARE               STR1               ��              STR2               ��                 STRING_COMPARE                                      ���L  �   ����           STRING_TO_ASCIIBYTE               str               ��                 STRING_TO_ASCIIBYTE                                     ���L  �   ����           TOF           M             ��           internal variable 	   StartTime            ��           internal variable       IN            ��       ?    starts timer with falling edge, resets timer with rising edge    PT           ��           time to pass, before Q is set       Q            ��       2    is FALSE, PT seconds after IN had a falling edge    ET           ��           elapsed time             ���L  �   ����           TON           M             ��           internal variable 	   StartTime            ��           internal variable       IN            ��       ?    starts timer with rising edge, resets timer with falling edge    PT           ��           time to pass, before Q is set       Q            ��       0    is TRUE, PT seconds after IN had a rising edge    ET           ��           elapsed time             ���L  �   ����           TP        	   StartTime            ��           internal variable       IN            ��       !    Trigger for Start of the Signal    PT           ��       '    The length of the High-Signal in 10ms       Q            ��           The pulse    ET           ��       &    The current phase of the High-Signal             ���L  �   ����    c   C:\PROGRAM FILES (X86)\IFM ELECTRONIC\CODESYS V2.3\TARGETS\WAGO\LIBRARIES\32_BIT\SYSLIBCALLBACK.LIB          SYSCALLBACKREGISTER            	   iPOUIndex           ��       !    POU Index of callback function.    Event            	   RTS_EVENT   ��           Event to register       SysCallbackRegister                                      ���L  �   ����           SYSCALLBACKUNREGISTER            	   iPOUIndex           ��       !    POU Index of callback function.    Event            	   RTS_EVENT   ��           Event to register       SysCallbackUnregister                                      ���L  �   ����    c   C:\PROGRAM FILES (X86)\IFM ELECTRONIC\CODESYS V2.3\TARGETS\WAGO\LIBRARIES\32_BIT\WAGOLIBSOCKETS.LIB%       
   SOCK_ABORT               socketd           ��            Specifies a socket descriptor.    
   SOCK_ABORT               SOCK_RET                             հO  �   ����           SOCK_ACCEPT               socketd           ��       +    Specifies the server's socket descriptor.    myaddr                	   SOCK_ADDR        ��       ^    On return, this is a pointer to the protocol-specific address and family type of the client.    addrlen                 ��       L    This parameter is reserved for future use. A value of zero should be used.       SOCK_ACCEPT                                     հO  �   ����        	   SOCK_BIND               socketd           ��            Specifies a socket descriptor.    myaddr                	   SOCK_ADDR        ��       4    Pointer to the server's protocol-specific address.    addrlen           ��       L    This parameter is reserved for future use. A value of zero should be used.    	   SOCK_BIND                                     հO  �   ����           SOCK_CLOSE_SOCKET               socketd           ��            Specifies a socket descriptor.       SOCK_CLOSE_SOCKET               SOCK_RET                             հO  �   ����           SOCK_CONNECT               socketd           ��)            Specifies a socket descriptor.    servaddr                	   SOCK_ADDR        ��*       D    Pointer to the server's protocol-specific address and family type.    addrlen           ��+       L    This parameter is reserved for future use. A value of zero should be used.       SOCK_CONNECT                                     հO  �   ����           SOCK_DEVICE_UP               if_name               SOCK_DEVICE   ��            Specifies the device to check.       SOCK_DEVICE_UP                                     հO  �   ����        
   SOCK_FCNTL               socketd           ��            Specifies a socket descriptor.    command               SOCK_FCNTL_COMMAND   ��           Specifies a command.    argument               SOCK_FCNTL_ARGUMENT   ��           Specifies the command option.    
   SOCK_FCNTL               SOCK_RET                             հO  �   ����           SOCK_FD_CHECK               socket           ��       (    Specifies the index of the bit to set.    pFd                SOCK_FD_SET_TYPE        ��	       .    Pointer to the bitmap which will be checked.       SOCK_FD_CHECK                                      հO  �   ����           SOCK_FD_INIT               pFd                SOCK_FD_SET_TYPE        ��       E    This parameter is a pointer to the bitmap that will be initialized.       SOCK_FD_INIT                                      հO  �   ����           SOCK_FD_RESET               socket           ��       -    Specifies the index to the bit to be reset.    pFd                SOCK_FD_SET_TYPE        ��	       7    Pointer to the bitmap in which the bit will be reset.       SOCK_FD_RESET                                      հO  �   ����           SOCK_FD_SET               socket           ��       (    Specifies the index the bit to be set.    pFd                SOCK_FD_SET_TYPE        ��	       5    Pointer to the bitmap in which the bit will be set.       SOCK_FD_SET                                      հO  �   ����           SOCK_GET_DOMAIN_NAME               name     Q       Q         ��       I    This is a pointer to the location where the domain name will be copied.    name_length           ��       -    Size of memory location pointed to by name.       SOCK_GET_DOMAIN_NAME               SOCK_RET                             հO  �   ����           SOCK_GET_HOST_BY_ADDR               addr    	                             ��       �    Specifies the IP address of the host to be searched for.
																									    E.g. '192.168.1.3' => addr := { 16#C0, 16#A8, 16#01, 16#03 }    len           ��       �    This is the length of addr, the first parameter.
																									    A value of 4 should always be used for an IPv4 address.
																									    A value of 16 should always be used for an IPv6 address.    family               SOCK_FAMILY   ��       1    Specifies the type of address in parameter one. 
   host_entry                  SOCK_HOSTENT        ��       �    This parameter is a pointer to a host structure.
																									    Upon successful completion, this structure will be filled in with the host information.       SOCK_GET_HOST_BY_ADDR               SOCK_RET                             հO  �   ����           SOCK_GET_HOST_BY_NAME               name     Q       Q         ��       I    This parameter is a pointer to the name of the host to be searched for. 
   host_entry                  SOCK_HOSTENT        ��       �    This parameter is a pointer to a host structure. Upon successful completion, this structure
																     will be filled in with the host information.       SOCK_GET_HOST_BY_NAME               SOCK_RET                             հO  �   ����           SOCK_GET_HOST_NAME               name     Q       Q         ��       F    This is a pointer to the location where the hostname will be copied.    name_length           ��       -    Size of memory location pointed to by name.       SOCK_GET_HOST_NAME               SOCK_RET                             հO  �   ����           SOCK_GET_PEER_NAME               socketd           ��            Specifies a socket descriptor.    peer                 SOCK_SOCKADDR        ��       B    A pointer to a structure containing the remote client's address.       SOCK_GET_PEER_NAME               SOCK_RET                             հO  �   ����           SOCK_GET_SOCK_NAME               socketd           ��            Specifies a socket descriptor. 	   localaddr                 SOCK_SOCKADDR        ��       :    A pointer to a structure containing the local addresses.       SOCK_GET_SOCK_NAME               SOCK_RET                             հO  �   ����           SOCK_GETSOCKOPT               socketd           ��            Specifies a socket descriptor.    level            
   SOCK_LEVEL   ��           Specifies the protocol level.    optname               SOCK_OPTNAME   ��           Specifies an option.    pOptval           ��       A    Pointer to the location where the option status can be written.    optlen                 ��       �    Upon calling the function, optlen is set to the size of the buffer pointed to by pOptval and modified on return
												     to contain the size of the value returned.       SOCK_GETSOCKOPT               SOCK_RET                             հO  �   ����        
   SOCK_HTONL               host           ��              
   SOCK_HTONL                                     հO  �   ����        
   SOCK_HTONS               host           ��              
   SOCK_HTONS                                     հO  �   ����        
   SOCK_IOCTL               command               SOCK_IOCTL_COMMAND   ��           Specifies a command.    option                 SOCK_IOCTL_OPTION        ��       #    Return pointer for option status.    
   SOCK_IOCTL               SOCK_RET                             հO  �   ����           SOCK_IS_CONNECTED               socketd           ��            Specifies a socket descriptor.       SOCK_IS_CONNECTED               SOCK_RET                             հO  �   ����           SOCK_LISTEN               socketd           ��       +    Specifies the server's socket descriptor.    backlog           ��       G    Specifies the number of requests which can be queued for this server.       SOCK_LISTEN               SOCK_RET                             հO  �   ����        
   SOCK_NTOHL               net           ��              
   SOCK_NTOHL                                     հO  �   ����        
   SOCK_NTOHS               net           ��              
   SOCK_NTOHS                                     հO  �   ����        	   SOCK_PING               address           ��       ;    IP address. E.g. '192.168.1.3' => address := 16#C0A80103.    timeout           ��       M    If a value of zero is supplied a default timeout of 5 seconds will be used.    	   SOCK_PING               SOCK_RET                             հO  �   ����        	   SOCK_RECV               socketd           ��&            Specifies a socket descriptor.    pBuff           ��'           Pointer to the data buffer.    nbytes           ��(       ,    Specifies the max number of bytes of data.    flags           ��)       K    Used for socket compatibility. We are currently not making any use of it.    	   SOCK_RECV                                     հO  �   ����           SOCK_RECV_FROM               socketd           ��&            Specifies a socket descriptor.    pBuff           ��'           Pointer to the data buffer.    nbytes           ��(       �    Specifies the total number of bytes of data that can be received in the buffer provided.
														    If more than nbytes of data are received in a datagram, the data will be truncated after nbytes have been copied from the datagram.    flags           ��*       K    Used for socket compatibility. We are currently not making any use of it.    from                	   SOCK_ADDR        ��+       <    Pointer to the source protocol-specific address structure.    addrlen                 ��,       L    This parameter is reserved for future use. A value of zero should be used.       SOCK_RECV_FROM                                     հO  �   ����           SOCK_RECV_FROM_RAW               socketd           ��            Specifies a socket descriptor.    pBuff           ��          Pointer to the data buffer. Because the nbytes parameter is not currently used, the buffer must be large
														    enough to hold the largest datagram that the host expects to receive. In the case of Ethernet, this can
														    never be larger than 1500 bytes.    nbytes           ��       �    Specifies the number of bytes of data.
														    This parameter is not currently used. Instead the last datagram received is copied as a whole into the
														     location pointed to by the pBuff parameter.    flags           ��       `    This parameter is used for socket compatibility but we are currently not making any use of it.    from                	   SOCK_ADDR        ��       <    Pointer to the source protocol-specific address structure.    addrlen                 ��       L    This parameter is reserved for future use. A value of zero should be used.       SOCK_RECV_FROM_RAW                                     հO  �   ����           SOCK_SELECT               max_sockets           ��&       �    Specifies the value of the largest socket descriptor that should be checked plus one.
																	    For example, if a select on socket descriptors 1, 6, and 8 is desired, then the value of
																	    max_sockets should be 9 (8 + 1).    pReadfs                SOCK_FD_SET_TYPE        ��)       �    Pointer to the bitmap of sockets on which the caller wants to check for data.
																	    This value can be set to NULL if the caller does not want to check any sockets for data.    pWritefs                SOCK_FD_SET_TYPE        ��+          Pointer to the bitmap of sockets which the caller wants to check for writability.
																	    This value can be set to NULL if the caller does not want to check any sockets for writability.
																	    A socket is writable if the TCP socket is connected and there is room in the window to write
																	    more data, buffers are available to write to the UDP or RAW IP socket, there is an ICMP error
																	    waiting on the socket or the write-half of the connection has been closed.    timeout           ��0            Timeout in ms or SOCK_SUSPEND.       SOCK_SELECT               SOCK_RET                             հO  �   ����        	   SOCK_SEND               socketd           ��'            Specifies a socket descriptor.    pBuff           ��(           Pointer to the data buffer.    nbytes           ��)       �    Specifies the max number of bytes of data. Valid values for this parameter are in the range of 0 - SOCK_IP_MAX_DATA_SIZE (65,495).    flags           ��*       K    Used for socket compatibility. We are currently not making any use of it.    	   SOCK_SEND                                     հO  �   ����           SOCK_SEND_TO               socketd           ��'            Specifies a socket descriptor.    pBuff           ��(           Pointer to the data buffer.    nbytes           ��)       .    Specifies the total number of bytes of data.    flags           ��*       X    This parameter is for socket compatibility. We are currently not making any use of it.    dest                	   SOCK_ADDR        ��+       C    Pointer to the destination's protocol-specific address structure.    addrlen           ��,       L    This parameter is reserved for future use. A value of zero should be used.       SOCK_SEND_TO                                     հO  �   ����           SOCK_SEND_TO_RAW               socketd           ��            Specifies a socket descriptor.    pBuff           ��           Pointer to the data buffer.    nbytes           ��       (    Specifies the number of bytes of data.    flags           ��       X    This parameter is for socket compatibility. We are currently not making any use of it.    dest                	   SOCK_ADDR        ��       C    Pointer to the destination's protocol-specific address structure.    addrlen           ��       L    This parameter is reserved for future use. A value of zero should be used.       SOCK_SEND_TO_RAW                                     հO  �   ����           SOCK_SET_DOMAIN_NAME               name     @       @         ��       +    This is a pointer to the new domain name.       SOCK_SET_DOMAIN_NAME               SOCK_RET                             հO  �   ����           SOCK_SET_HOST_NAME               name     @       @         ��       )    This is a pointer to the new host name.       SOCK_SET_HOST_NAME               SOCK_RET                             հO  �   ����           SOCK_SETSOCKOPT               socketd           ��            Specifies a socket descriptor.    level            
   SOCK_LEVEL   ��           Specifies the protocol level.    optname               SOCK_OPTNAME   ��           Specifies an option.    pOptval           ��       *    Pointer to the new value for the option.    optlen           ��       D    Specifies the size in bytes of the location pointed to by pOptval.       SOCK_SETSOCKOPT               SOCK_RET                             հO  �   ����           SOCK_SOCKET               family               SOCK_FAMILY   ��       >    The type of communication that can be invoked on the socket.    type_            	   SOCK_TYPE   ��           Specifies the protocol.    protocol               SOCK_PROTOCOL   ��       Z    If the type_ parameter is unequal SOCK_TYPE_RAW set the protocol parameter to SOCK_NONE.       SOCK_SOCKET                                     հO  �   ����    b   C:\PROGRAM FILES (X86)\IFM ELECTRONIC\CODESYS V2.3\TARGETS\WAGO\LIBRARIES\32_BIT\SYSLIBSOCKETS.LIB          SYSSOCKACCEPT               diSocket           ��           	   pSockAddr           ��       (    Address of SocketAddress (SOCKADDRESS)    piSockAddrSize           ��       &    Address of socket address size (DINT)      SysSockAccept                                     ֑SM  �   ����           SYSSOCKBIND               diSocket           ��           	   pSockAddr           ��       (    Address of SocketAddress (SOCKADDRESS)    diSockAddrSize           ��           Size of socket address       SysSockBind                                      ֑SM  �   ����           SYSSOCKCLOSE               diSocket           ��                 SysSockClose                                      ֑SM  �   ����           SYSSOCKCONNECT               diSocket           ��           	   pSockAddr           ��       (    Address of SocketAddress (SOCKADDRESS)    diSockAddrSize           ��           Size of socket address       SysSockConnect                                      ֑SM  �   ����           SYSSOCKCREATE               diAddressFamily           ��              diType           ��           
   diProtocol           ��                 SysSockCreate                                     ֑SM  �   ����           SYSSOCKGETHOSTBYNAME            
   stHostName     Q       Q         ��                 SysSockGetHostByName                                     ֑SM  �   ����           SYSSOCKGETHOSTNAME            
   stHostName     Q       Q         ��              diNameLength           ��                 SysSockGetHostName                                      ֑SM  �   ����           SYSSOCKGETOPTION               diSocket           ��              diLevel           ��              diOption           ��              pOptionValue           ��           Address of option    piOptionLength           ��           Address of option size (DINT)       SysSockGetOption                                      ֑SM  �   ����           SYSSOCKHTONL               dwHost           ��                 SysSockHtonl                                     ֑SM  �   ����           SYSSOCKHTONS               wHost           ��                 SysSockHtons                                     ֑SM  �   ����           SYSSOCKINETADDR               stIPAddr    Q       Q    ��                 SysSockInetAddr                                     ֑SM  �   ����           SYSSOCKINETNTOA               InAddr               INADDR   ��              stIPAddr    Q       Q    ��              diIPAddrSize           ��                 SysSockInetNtoa                                      ֑SM  �   ����           SYSSOCKIOCTL               diSocket           ��           	   diCommand           ��              piParameter           ��           Address of parameter (DINT)       SysSockIoctl                                     ֑SM  �   ����           SYSSOCKLISTEN               diSocket           ��              diMaxConnections           ��                 SysSockListen                                      ֑SM  �   ����           SYSSOCKNTOHL               dwNet           ��                 SysSockNtohl                                     ֑SM  �   ����           SYSSOCKNTOHS               wNet           ��                 SysSockNtohs                                     ֑SM  �   ����           SYSSOCKRECV               diSocket           ��           	   pbyBuffer           ��           Address of buffer to receive    diBufferSize           ��              diFlags           ��                 SysSockRecv                                     ֑SM  �   ����           SYSSOCKRECVFROM               diSocket           ��           	   pbyBuffer           ��           Address of buffer to receive    diBufferSize           ��              diFlags           ��           	   pSockAddr           ��       &    Address of socket address SOCKADDRESS   diSockAddrSize           ��           Size of socket address       SysSockRecvFrom                                     ֑SM  �   ����           SYSSOCKSELECT               diWidth           ��           Typically SOCKET_FD_SETSIZE    fdRead           ��           Address of  SOCKET_FD_SET    fdWrite           ��           Address of  SOCKET_FD_SET    fdExcept           ��           Address of  SOCKET_FD_SET 
   ptvTimeout           ��           Address of SOCKET_TIMEVAL       SysSockSelect                                     ֑SM  �   ����           SYSSOCKSEND               diSocket           ��           	   pbyBuffer           ��           Address of buffer to receive    diBufferSize           ��              diFlags           ��                 SysSockSend                                     ֑SM  �   ����           SYSSOCKSENDTO               diSocket           ��           	   pbyBuffer           ��           Address of buffer to receive    diBufferSize           ��              diFlags           ��           	   pSockAddr           ��       '    Address of socket address SOCKADDRESS    diSockAddrSize           ��           Size of socket address       SysSockSendTo                                     ֑SM  �   ����           SYSSOCKSETIPADDRESS            
   stCardName    Q       Q    ��              stIPAddress    Q       Q    ��                 SysSockSetIPAddress                                      ֑SM  �   ����           SYSSOCKSETOPTION               diSocket           ��              diLevel           ��              diOption           ��              pOptionValue           ��           Address of option    diOptionLength           ��           Length of option       SysSockSetOption                                      ֑SM  �   ����           SYSSOCKSHUTDOWN               diSocket           ��              diHow           ��                 SysSockShutdown                                      ֑SM  �   ����    f   C:\PROGRAM FILES (X86)\IFM ELECTRONIC\CODESYS V2.3\TARGETS\WAGO\LIBRARIES\32_BIT\NETVARUDP_LIB_V23.LIB          CALLBACKNETVAR               dwEvent           ��              dwFilter           ��              dwOwner           ��                 CallbackNetVar                                     ���L  �    ����           CALLBACKTASKCODENC               dwEvent           ��              dwFilter           ��              dwOwner           ��                 CallbackTaskCodeNC                                     ���L  �    ����           GETIPADDRESS           diIPAddress            ��                 stIPAddress    Q       Q    ��           IP-address or computer name       GetIPAddress                                     ���L  �    ����           NETVARGETCONNECTSTATUS_UDP           n            ��                 nBasisId           ��                 bConnectNewData            ��              bConnectError            ��              dwErrorCode           ��                       ���L  �    ����           NETVARMANAGER_UDP_FB        	   diSoketRx    ����    ��           	   diSoketTx    ����    ��              diRxLen            ��              diOffset            ��              diCallCounter            ��              diMsgCounter            ��              dwOneIPAddress            ��	           	   ppUserSdo   	                                           NetVarSDO_Udp                 ��
              Sem                  SEMA    ��              pszHostName    Q       Q     ��              Read                 CLIENT_REPLY    ��              Tlg                NetVarTelegramm_Udp    ��              nStatus            ��              n            ��              bIsActiv             ��           	   bReadNext             ��           	   bTlgReady             ��              iTlgPerCycle            ��           	   iTlgCount            ��              tInhibit           (pt := t#1500ms)       �       TON    ��              multi                SOCK_IP_MREQ    ��           WAGO    ip_addr            ��           WAGO    	   bByteSwap            ��              iPort    �     ��           Port number, to send data    iNewTlgPerCycle           ��       <   Maximum number of telegramms processed within one IEC-cycle.                ���L  �   ����           NETVARPDO_RX_UDP           pPtrToPDO_TxData    	                               ��           
   pPtrToData    	                               ��              DataItem                NetVarDataItem_UDP    ��              i            ��              n            ��              nLen            ��              nDestIx            ��           
   nDestOrder            ��              iDataIx            ��               nLastRxCounter            ��!              bInit            ��"              nInitStatus            ��#              bChecksumValid            ��$                 sNetTelegramm                NetVarTelegramm_UDP   ��              TimeOut           (PT := t#500ms)       �       TON   ��              bNewMessage            ��              nIndex    ����   ��              diBytesSend           ��           	   bReceived            ��           
   pDataItems    	  '                   NetVarDataItem_UDP                ��              wDrvNr           ��           
   nDataItems    ����   ��              bySignature           ��              bRequestAtBootup            ��              stIPAddressTransmitter               ��              stIPAddressBroadcast               ��                 nStatus           ��              bDataNew            ��              ip_addr           ��           WAGO             ���L  �    ����           NETVARPDO_TX_UDP           diBytesSend            ��              DataItem                NetVarDataItem_UDP    ��              i            ��              n            ��              nLen            ��              nDestIx            ��           
   nDestOrder            ��               iDataIx            ��!           
   nLenToSend            ��"              bSend            ��#           	   bSendHard             ��$              bInit            ��%              bAcknExpected             ��&              sTlgBootupReq                NetVarTelegramm_UDP    ��'                 InhibitTimer           (PT := t#100ms)       d        TON   ��              RepeatTimer           (PT := t#500ms)       �       TON   ��           
   pDataItems    	  '                   NetVarDataItem_Udp                ��              wDrvNr           ��           
   nDataItems    ����   ��              bWithChecksum            ��              bySignature           ��              bWithAcknowledge            ��              bExpression            ��              bAnswerBootupRequest            ��              bBootupRequestReceived            ��              stIPAddressBootupRequest               ��              nIndex    ����   ��              stIPAddressBroadcast               ��              sNetTelegramm                NetVarTelegramm_UDP   ��                 nStatus           ��              ip_addr           ��           WAGO             ���L  �    ����           NETVARSDO_UDP           byAttrib            ��              byAccess           ODReadWrite       NetVarOD_Access_Udp    ��       _    For initializing swapping mechanisms. Is initialzed by CoDeSys for instances, only called on     nElementSize            ��       8    Interne Variablen, die zur Laufzeit bearbeitet werden     bInit            ��           	   bMsgMatch             ��              bMR             ��              bMW             ��              n            ��           	   nTabIndex            ��              nCounter            ��              Timer                    TON    ��               pPtr                  ��!              bAccept             ��"           	   	   bReadData            ��           
   bWriteData            ��              nIndex           ��           	   nSubIndex           ��              pData    	  �                            ��              nLen           ��              nItems           ��	              stIPAddressClient               ��
              TimeOut    �     ��                 nStatus               NetVarOD_Service_Udp   ��                       ���L  �    ����           SWAP           pw                  ��              PD                  ��              pb                  ��	              pbo                  ��	              hdw            ��
              dpb            ��
              dpbo            ��
              hw            ��              v1           ��              pbo1                  ��              pbo2                  ��              pbo3                  ��              pb1                  ��              pb2                  ��              pb3                  ��                 pi           ��              nSize           ��                 Swap                                      ���L  �    ����           UDPGETRECEIVEDATASIZE           diParameter            ��
                 diSocket           ��           Socket Id       UdpGetReceiveDataSize                                     ���L  �    ����           UDPOPENRECEIVESOCKET           diSocket            ��              bOption             ��              bResult             ��              sa                  SOCKADDRESS    ��	                 iPort           ��                 UdpOpenReceiveSocket                                     ���L  �    ����           UDPOPENSENDSOCKET           diSocket            ��              diOption            ��                 iPort           ��                 UdpOpenSendSocket                                     ���L  �    ����           UDPRECEIVEDATA           sa                  SOCKADDRESS    ��              ia               INADDR    ��                 diSocket           ��           Socket Id    iPort           ��           Port number, to send data    pbyData           ��	           Address of data buffer 
   diDataSize           ��
           Size of data to send       UdpReceiveData                 CLIENT_REPLY                             ���L  �    ����           UDPSENDDATA           sa                  SOCKADDRESS    ��                 diSocket           ��           Socket Id    iPort           ��           Port number, to send data    stIPAddress    Q       Q    ��           IP-address or name    pbyData           ��	           Address of data buffer 
   diDataSize           ��
           Size of data to send       UdpSendData                                     ���L  �    ����        
   UDPSENDTLG           sa                  SOCKADDRESS    ��              length            ��                 stIPAddress    Q       Q    ��           IP-address or name 
   sTelegramm                NetVarTelegramm_UDP   ��                 bReady            ��
              dwResult           ��                       ���L  �    ����        
       
   BITTRIGGER        
   EventCount            � 
          *< Amount of events processed       CLK            �        "   *< Trigger condition of the Event       CLK_OUT            �        !   *< Internal state of the trigger    Q            �        )   *< Single cycle high bit for the trigger             �*x[  @    ����           CLOCKCYCLES           trigger_50ms                    TON    /               Counter            /                                ��Z  @    ����        
   COMPOSEINT               Ones           �               Tens           �               Hundreds           �            	   Thousands           �               
   ComposeInt                                     �+q[  @    ����        
   IO_MAPPING           bSecondPulse             ,     QX                   %       *< 50% Duty cycle second pulse    TriggerState             ,     QX                  %       *< Trigger Condition    TimerResult             ,     QX                  %       *< Timer Expiration    ActualCount            ,     QW                 %    #   *< Actual count sent by modbus TCP    Cycles            ,     QW                 %       *< CycleCount    bEnableCount             ,     IX                   %    +   *< Enable input received by the modbus TCP    bMinutePulse             , 	    QX                  %       *< 50% Duty cycle minute pulse    Trigger                 R_TRIG    , 
                               ��t[  @    ����           OPTIMIZEDTIMER                             ��q[  @    ����        
   PC20_CYCLE     *     RESULT1             �        
    3.0 !F=C    RESULT             �        
    3.1 !F=C    ENTER             �            3.3 !triggerpuls enterdrukkn.    DUMP_1             �            4.1     DUMP_2             �            4.2     DUMP_3             �            4.3     DUMP_4             � 	           5.0     DUMP_5             � 
           5.1     DUMP_6             �            5.2     DUMP_7             �            5.3     DUMP_8             �            6.0     DUMP_9             �            6.1     DUMP_10             �            6.2     DUMP_11             �            6.3     DUMP_12             �            7.0     DUMP_13             �            7.1     DUMP_14             �            7.2     DUMP_15             �            7.3     DUMP_16             �            8.0     DUMP_17             �            8.1     DUMP_18             �            8.2     DUMP_19             �            8.3     DUMP_20             �            9.0     DUMP_21             �            9.1     DUMP_22             �            9.2     DUMP_23             �            9.3     DUMP_24             �            10.0     DUMP_25             �            10.1     DUMP_26             �            10.2     DUMP_27             �             10.3     DUMP_28             � !           11.0     DUMP_29             � "           11.1     DUMP_30             � #           11.2     DUMP             � $           11.3     DUMP_31             � %           12.0     DUMP_32             � &           12.1     DUMP_33             � '           12.2     DUMP_34             � (           12.3     DUMP_35             � )           13.0     DUMP_36             � *           13.1     DUMP_37             � +           13.2     DUMP_38             � ,           13.3     DUMP_39             � -           14.0     DUMP_40             � .           14.1     DUMP_41             � /           14.2     DUMP_42             � 0           14.3     PLCC1             � 1       &    15.0 !eerste PLC_cyclus hoog_signaal    TIMER_01             � 2           20.0     TIMER_02             � 3           20.1     TIMER_03             � 4           20.2     TIMER_04             � 5           20.3     TIMER_05             � 6           21.0     TIMER_06             � 7           21.1     TIMER_07             � 8           21.2     TIMER_08             � 9           21.3     TIMER_09             � :           22.0     TIMER_10             � ;           22.1     TIMER_11             � <           22.2     TIMER_12             � =           22.3     TIMER_13             � >           23.0     TIMER_14             � ?           23.1     TIMER_15             � @           23.2     TIMER_16             � A           23.3     TIMER_17             � B           24.0     TIMER_18             � C           24.1     TIMER_19             � D           24.2     TIMER_20             � E           24.3     TIMER_21             � F           25.0     TIMER_22             � G           25.1     TIMER_23             � H           25.2     TIMER_24             � I           25.3     TIMER_25             � J           26.0     TIMER_26             � K           26.1     TIMER_27             � L           26.2     TIMER_28             � M           26.3     TIMER_29             � N           27.0     TIMER_30             � O           27.1     TIMER_31             � P           27.2     TIMER_32             � Q           27.3     TIMER_33             � R           28.0     TIMER_34             � S           28.1     TIMER_35             � T           28.2     TIMER_36             � U           28.3     TIMER_37             � V           29.0     TIMER_38             � W           29.1     TIMER_39             � X           29.2     TIMER_40             � Y           29.3     TIMER_41             � Z           30.0     TIMER_42             � [           30.1     TIMER_43             � \           30.2     TIMER_44             � ]           30.3     TIMER_45             � ^           31.0     TIMER_46             � _           31.1     TIMER_47             � `           31.2     TIMER_48             � a           31.3     TIMER_49             � b           32.0     TIMER_50             � c           32.1     TIMER_51             � d           32.2     TIMER_52             � e           32.3     TIMER_53             � f           33.0     TIMER_54             � g           33.1     TIMER_55             � h           33.2     TIMER_56             � i           33.3     TIMER_57             � j           34.0     TIMER_58             � k           34.1     TIMER_59             � l           34.2     TIMER_60             � m           34.3     R_VOORW             � n           35.0 !regeneratievoorw. OK    BDR0B11             � o           35.1 !bedrijfsvoorwaarden    unnamed_035_2             � p           35.2     unnamed_035_3             � q           35.3     BDR0B01             � r           36.0 !bedrijfsfase 1    BDR0B02             � s           36.1 !bedrijfsfase 2    BDR0B03             � t           36.2 !bedrijfsfase 3    BDR0B04             � u           36.3 !bedrijfsfase 4    BDR0B05             � v           37.0 !bedrijfsfase 5    BDR0B06             � w           37.1 !bedrijfsfase 6    FASE_7             � x           37.2 !fase 7    REG0B08             � y           37.3 !regeneratiefase 8    REG0B09             � z           38.0 !regeneratiefase 9    REG0B10             � {           38.1 !regeneratiefase 10    REG0B11             � |           38.2 !regeneratiefase 11    REG0B12             � }           38.3 !regeneratiefase 12    REG0B13             � ~           39.0 !regeneratiefase 13    REG0B14             �            39.1 !regeneratiefase 14    REG0B15             � �           39.2 !regeneratiefase 15    REG0B16             � �           39.3 !regeneratiefase 16    REG0B17             � �           40.0 !regeneratiefase 17    REG0B18             � �           40.1 !regeneratiefase 18    REG0B19             � �           40.2 !regeneratiefase 19    REG0B20             � �           40.3 !regeneratiefase 20    REG0B21             � �           41.0 !regeneratiefase 21    REG0B22             � �           41.1 !regeneratiefase 22    REG0B23             � �           41.2 !regeneratiefase 23    REG0B24             � �           41.3 !regeneratiefase 24    REG0B25             � �           42.0 !regeneratiefase 25    REG0B26             � �           42.1 !regeneratiefase 26    REG0B27             � �           42.2 !regeneratiefase 27    REG0B28             � �           42.3 !regeneratiefase 28    REG0B29             � �           43.0 !regeneratiefase 29    REG0B30             � �           43.1 !regeneratiefase 30    REG0B31             � �           43.2 !regeneratiefase 31    REG0B32             � �           43.3 !regeneratiefase 32    REG0B33             � �           44.0 !regeneratiefase 33    REG0B34             � �           44.1 !regeneratiefase 33.1    REG0B00             � �       %    44.2 !start regen. fasen 8 t/m 33.1    REG0B88             � �           44.3 !aanloopfase 88    ALARM29             � �           45.0 !V 1.1 niet geopend    ALARM30             � �           45.1 !V 1.1 niet gesloten    ALARM31             � �           45.2 !V 3.1 niet geopend    ALARM32             � �           45.3 !V 3.1 niet gesloten    ALARM33             � �           46.0 !V 5.1 niet geopend    ALARM34             � �           46.1 !V 5.1 niet gesloten    ALARM35             � �           46.2 !V 7.1 niet geopend    ALARM36             � �           46.3 !V 7.1 niet gesloten    ALARM13             � �           47.0 !V10.1 niet geopend    ALARM14             � �           47.1 !V10.1 niet gesloten    ALARM15             � �           47.2 !V10.2 niet geopend    ALARM16             � �           47.3 !V10.2 niet gesloten    ALARM17             � �           48.0 !V10.3 niet geopend    ALARM18             � �           48.1 !V10.3 niet gesloten    ALARM19             � �           48.2 !V10.4 niet geopend    ALARM20             � �           48.3 !V10.4 niet gesloten    ALARM21             � �           49.0 !V11.1 niet geopend    ALARM22             � �           49.1 !V11.1 niet gesloten    ALARM23             � �           49.2 !V11.2 niet geopend    ALARM24             � �           49.3 !V11.2 niet gesloten    ALARM25             � �           50.0 !V11.3 niet geopend    ALARM26             � �           50.1 !V11.3 niet gesloten    ALARM27             � �           50.2 !V12.1 niet geopend    ALARM28             � �           50.3 !V12.1 niet gesloten    BDR0B00             � �       #    51.0 !start bedrijf fasen 1 t/m 6    BDR0B07             � �           51.1 !einde fasetimer    BDR0B08             � �       &    51.2 !startpuls bedrijf fase 1 t/m 6    BDR0B09             � �       #    51.3 !hand doorstap (triggerpuls)    BDR0T00             � �           52.0 !doorstap triggerpuls    BDR0T01             � �       &    52.1 !triggerpuls laden timer fase 1    BDR0T02             � �       &    52.2 !triggerpuls laden timer fase 2    BDR0T03             � �       &    52.3 !triggerpuls laden timer fase 3    BDR0T04             � �       &    53.0 !triggerpuls laden timer fase 4    BDR0T05             � �       &    53.1 !triggerpuls laden timer fase 5    BDR0T06             � �       &    53.2 !triggerpuls laden timer fase 6    STAP_2             � �           53.3 !stappen faseregister    BDR0B10             � �           54.0 !bedrijfsmelding    BDR0T07             � �           54.1 !triggerpuls reset fasen    TRGAAN88             � �       "    54.2 !triggerpuls aanloopfase 88    TMRAAN88             � �           54.3 !timer aanloopfase 88    FASE78             � �           55.0     FASE77             � �           55.1     FASE76             � �           55.2     FASE75             � �           55.3     FASE74             � �           56.0     FASE73             � �           56.1     FASE72             � �           56.2     FASE71             � �           56.3     FASE70             � �           57.0     FASE69             � �           57.1     FASE68             � �           57.2     FASE67             � �           57.3     FASE66             � �           58.0     FASE65             � �           58.1     FASE64             � �           58.2     FASE63             � �           58.3     FASE62             � �           59.0     FASE61             � �           59.1     FASE60             � �           59.2     FASE59             � �           59.3     FASE58             � �           60.0     FASE57             � �           60.1     FASE56             � �           60.2     FASE55             � �           60.3     FASE54             � �           61.0     FASE53             � �           61.1     FASE52             � �           61.2     FASE51             � �           61.3     FASE50             � �           62.0     FASE49             � �           62.1     FASE48             � �           62.2     FASE47             � �           62.3     FASE46             � �           63.0     FASE45             � �           63.1     FASE44             � �           63.2     FASE43             � �           63.3     FASE42             � �           64.0     FASE41             � �           64.1     FASE40             � �           64.2     FASE39             � �           64.3     FASE38             � �           65.0     FASE37             � �           65.1     FASE36             � �           65.2     FASE35             � �           65.3     FASE34             � �           66.0     FASE33             � �           66.1     FASE32             � �           66.2     FASE31             � �           66.3     FASE30             � �           67.0     FASE29             � �           67.1     FASE28             � �           67.2     FASE27             � �           67.3     FASE26             � �           68.0     FASE25             � �           68.1     FASE24             � �           68.2     FASE23             � �           68.3     FASE22             � �           69.0     FASE21             � �           69.1     FASE20             � �           69.2     FASE19             � �           69.3     FASE18             � �           70.0     FASE17             � �           70.1     FASE16             � �           70.2     FASE15             � �           70.3     FASE14             � �           71.0     FASE13             � �           71.1     FASE12             �            71.2     FASE11             �           71.3     FASE10             �           72.0     FASE09             �           72.1     FASE08             �           72.2     FASE07             �           72.3     FASE06             �           73.0     FASE05             �           73.1     FASE04             �           73.2     FASE03             � 	          73.3     FASE02             � 
          74.0     FASE01             �           74.1     unnamed_074_2             �           74.2     unnamed_074_3             �           74.3     TIMER01             �           75.0     STAP             �           75.1 !triggerpuls    DOORSTAP             �       &    75.2 !fasedoorstappuls door drukknop    STAP_1             �           75.3 !fasedoorstappuls    START             �       +    76.0 !start storingcode's naar lichtkrant    ST_AANW             �           76.1 !storing aanwezig ?    TRIGTIM             �           76.2 !triggerpuls timer01    RONDSTAP             �       %    76.3 !stap van fase 78 naar fase 01    STAPPULS             �           77.0 !triggerpuls rondstap    STARTP             �           77.1 !triggerpuls start    FASESPRG             �           77.2 !fase overspringen    PULS78             �       !    77.3 !triggerpuls einde fase 78    STAP01             �       )    78.0 !doorstappuls fase 78 naar fase 01    VRIJG01             �           80.0 !vrijgave fase    VRIJG02             �           80.1 !vrijgave fase    VRIJG03             �           80.2 !vrijgave fase    VRIJG04             �           80.3 !vrijgave fase    VRIJG05             �           81.0 !vrijgave fase    VRIJG06             �            81.1 !vrijgave fase    VRIJG07             � !          81.2 !vrijgave fase    VRIJG08             � "          81.3 !vrijgave fase    VRIJG09             � #          82.0 !vrijgave fase    VRIJG10             � $          82.1 !vrijgave fase    VRIJG11             � %          82.2 !vrijgave fase    VRIJG12             � &          82.3 !vrijgave fase    VRIJG13             � '          83.0 !vrijgave fase    VRIJG14             � (          83.1 !vrijgave fase    VRIJG15             � )          83.2 !vrijgave fase    VRIJG16             � *          83.3 !vrijgave fase    VRIJG17             � +          84.0 !vrijgave fase    VRIJG18             � ,          84.1 !vrijgave fase    VRIJG19             � -          84.2 !vrijgave fase    VRIJG20             � .          84.3 !vrijgave fase    VRIJG21             � /          85.0 !vrijgave fase    VRIJG22             � 0          85.1 !vrijgave fase    VRIJG23             � 1          85.2 !vrijgave fase    VRIJG24             � 2          85.3 !vrijgave fase    VRIJG25             � 3          86.0 !vrijgave fase    VRIJG26             � 4          86.1 !vrijgave fase    VRIJG27             � 5          86.2 !vrijgave fase    VRIJG28             � 6          86.3 !vrijgave fase    VRIJG29             � 7          87.0 !vrijgave fase    VRIJG30             � 8          87.1 !vrijgave fase    VRIJG31             � 9          87.2 !vrijgave fase    VRIJG32             � :          87.3 !vrijgave fase    VRIJG33             � ;          88.0 !vrijgave fase    VRIJG34             � <          88.1 !vrijgave fase    VRIJG35             � =          88.2 !vrijgave fase    VRIJG36             � >          88.3 !vrijgave fase    VRIJG37             � ?          89.0 !vrijgave fase    VRIJG38             � @          89.1 !vrijgave fase    VRIJG39             � A          89.2 !vrijgave fase    VRIJG40             � B          89.3 !vrijgave fase    VRIJG41             � C          90.0 !vrijgave fase    VRIJG42             � D          90.1 !vrijgave fase    VRIJG43             � E          90.2 !vrijgave fase    VRIJG44             � F          90.3 !vrijgave fase    VRIJG45             � G          91.0 !vrijgave fase    VRIJG46             � H          91.1 !vrijgave fase    VRIJG47             � I          91.2 !vrijgave fase    VRIJG48             � J          91.3 !vrijgave fase    VRIJG49             � K          92.0 !vrijgave fase    VRIJG50             � L          92.1 !vrijgave fase    VRIJG51             � M          92.2 !vrijgave fase    VRIJG52             � N          92.3 !vrijgave fase    VRIJG53             � O          93.0 !vrijgave fase    VRIJG54             � P          93.1 !vrijgave fase    VRIJG55             � Q          93.2 !vrijgave fase    VRIJG56             � R          93.3 !vrijgave fase    VRIJG57             � S          94.0 !vrijgave fase    VRIJG58             � T          94.1 !vrijgave fase    VRIJG59             � U          94.2 !vrijgave fase    VRIJG60             � V          94.3 !vrijgave fase    VRIJG61             � W          95.0 !vrijgave fase    VRIJG62             � X          95.1 !vrijgave fase    VRIJG63             � Y          95.2 !vrijgave fase    VRIJG64             � Z          95.3 !vrijgave fase    VRIJG65             � [          96.0 !vrijgave fase    VRIJG66             � \          96.1 !vrijgave fase    VRIJG67             � ]          96.2 !vrijgave fase    VRIJG68             � ^          96.3 !vrijgave fase    VRIJG69             � _          97.0 !vrijgave fase    VRIJG70             � `          97.1 !vrijgave fase    VRIJG71             � a          97.2 !vrijgave fase    VRIJG72             � b          97.3 !vrijgave fase    VRIJG73             � c          98.0 !vrijgave fase    VRIJG74             � d          98.1 !vrijgave fase    VRIJG75             � e          98.2 !vrijgave fase    VRIJG76             � f          98.3 !vrijgave fase    VRIJG77             � g          99.0 !vrijgave fase    VRIJG78             � h          99.1 !vrijgave fase    ALM0I02             � i          112.0 !stuurlucht te laag    BDR0I00             � j      +    112.1 !bedrijfskeuze schak. "REGENERATIE"    BDR0I01             � k      (    112.2 !bedrijfskeuze schak. "STAND_BY"    BDR0I02             � l      '    112.3 !bedrijfskeuze schak. "NORMAAL"    BDR0I03             � m      '    113.0 !bedrijfskeuze schak. "MCS_400"    AKTIEF             � n           113.1 !aktiveren bedrijfskeuze    STAPDRKN             � o          113.2 !doorstappen lichtkrant    REG0I04             � p      &    113.3 !keuzeschak.regen. automatisch    REG0I05             � q      '    114.0 !drukkn.doorstappen regeneratie    REG0I06             � r      &    114.1 !drukkn.aktiveren gekozen fase    ENTER_drukknop             � s          114.2 !ENTER_drukknop    REG0I10             � t      &    114.3 !detectieschakelaar CMF gevuld    REG0I11             � u      (    115.0 !detectieschakelaar CMF geledigd    LOOGNIET             � v      -    115.1 !schakelaar loog fasen (1=) overslaan    ALM0I39             � w          115.2 !P10 therm. gestoord    unnamed_115_3             � x          115.3     BDR0I07             � y          116.0 !P10 automatisch    REG0I07             � z          116.1 !P11 paraat    REG0I08             � {      -    116.2 !keuzeschakelaar CMF handmatig vullen    REG0I09             � |      .    116.3 !keuzeschakelaar CMF handmatig ledigen    ALM0I44             � }      %    117.0 !slechte geleidb.h. reinwater    ALM0I06             � ~      (    117.1 !slechte geleidb.h. spoelfase 32    ALM0I43             �       %    117.2 !druk vuilproceswater correct    ALM0I37             � �          117.3 !rondpompdruk correct    ALM0I01             � �          118.0 !spoeldruk correct    unnamed_118_1             � �          118.1     ALM0I09             � �          118.2 !nivo warme loog    ALM0I10             � �          118.3 !nivo zoutzuur    ALM0I04             � �      #    119.0 !LN_vooralarm vuilwatertank    ALM0I05             � �          119.1 !LN_alarm vuilwatertank    ALM0I12             � �          119.2 !nivo neuttank    TMP0I00             � �          119.3 !termostaat warme loog    ALM0I03             � �          120.0 !stuursp. gestoord    ALM0I42             � �          120.1 !nivo proceswater    unnamed_120_2             � �          120.2     unnamed_120_3             � �          120.3     unnamed_121_0             � �          121.0     RESET             � �          121.1     LAMPTEST             � �          121.2 !lampentest "8"    unnamed_121_3             � �          121.3     V1_1_O             � �      *    122.0 !eindschak.afsluiter V 1.1 geopend    V1_1_C             � �      +    122.1 !eindschak.afsluiter V 1.1 gesloten    V3_1_O             � �      *    122.2 !eindschak.afsluiter V 3.1 geopend    V3_1_C             � �      +    122.3 !eindschak.afsluiter V 3.1 gesloten    V5_1_O             � �      *    123.0 !eindschak.afsluiter V 5.1 geopend    V5_1_C             � �      +    123.1 !eindschak.afsluiter V 5.1 gesloten    V7_1_O             � �      *    123.2 !eindschak.afsluiter V 7.1 geopend    V7_1_C             � �      +    123.3 !eindschak.afsluiter V 7.1 gesloten    V10_1_O             � �      *    124.0 !eindschak.afsluiter V10.1 geopend    V10_1_C             � �      +    124.1 !eindschak.afsluiter V10.1 gesloten    V10_2_O             � �      *    124.2 !eindschak.afsluiter V10.2 geopend    V10_2_C             � �      +    124.3 !eindschak.afsluiter V10.2 gesloten    V10_3_O             � �      *    125.0 !eindschak.afsluiter V10.3 geopend    V10_3_C             � �      +    125.1 !eindschak.afsluiter V10.3 gesloten    V10_4_O             � �      *    125.2 !eindschak.afsluiter V10.4 geopend    V10_4_C             � �      +    125.3 !eindschak.afsluiter V10.4 gesloten    V11_1_O             � �      *    126.0 !eindschak.afsluiter V11.1 geopend    V11_1_C             � �      +    126.1 !eindschak.afsluiter V11.1 gesloten    V11_2_O             � �      *    126.2 !eindschak.afsluiter V11.2 geopend    V11_2_C             � �      +    126.3 !eindschak.afsluiter V11.2 gesloten    V11_3_O             � �      *    127.0 !eindschak.afsluiter V11.3 geopend    V11_3_C             � �      +    127.1 !eindschak.afsluiter V11.3 gesloten    V12_1_O             � �      *    127.2 !eindschak.afsluiter V12.1 geopend    V12_1_C             � �      +    127.3 !eindschak.afsluiter V12.1 gesloten    POMP_P10             � �          140.1     POMP_P11             � �          140.2     CMF_IN             � �      0    140.3 !inbedrijfmelding CMF naar kast algemeen    V1_1             � �          141.0     V1_2             � �          141.1     V1_3             � �          141.2     V3_1             � �          141.3     V3_2             � �          142.0     V3_3             � �          142.1     V5_1             � �          142.2     V5_2             � �          142.3     V5_3             � �          143.0     V7_1             � �          143.1     V7_2             � �          143.2     V9_1             � �          143.3     V9_2             � �          144.0     V9_3             � �          144.1     V10_1             � �          144.2     V10_2             � �          144.3     V10_3             � �          145.0     V10_4             � �          145.1     V11_1             � �          145.2     V11_2             � �          145.3     V11_3             � �          146.0     V12_1             � �          146.1     V12_2             � �          146.2     V12_3             � �          146.3     V13_1_2             � �          147.0     unnamed_147_1             � �          147.1     unnamed_147_2             � �          147.2     CLAXON             � �          147.3     DISPL01             � �           164.0 !aansturing display "01"    DISPL02             � �           164.1 !aansturing display "02"    DISPL04             � �           164.2 !aansturing display "04"    DISPL08             � �           164.3 !aansturing display "08"    DISPL10             � �           165.0 !aansturing display "10"    DISPL20             � �           165.1 !aansturing display "20"    DISPL40             � �           165.2 !aansturing display "40"    DISPL80             � �           165.3 !aansturing display "80"    CA01             � �          200.0     CA02             � �          200.1     CA03             � �          200.2     CA04             � �          200.3     CA05             � �          201.0     CA06             � �          201.1     CA07             � �          201.2     CA08             � �          201.3     CA09             � �          202.0     CA10             � �          202.1     CA11             � �          202.2     CA12             � �          202.3     CA13             � �          203.0     CA14             � �          203.1     CA15             � �          203.2     CA16             � �          203.3     CA17             � �          204.0     CA18             � �          204.1     CA19             � �          204.2     CA20             � �          204.3     CA21             � �          205.0     CA22             � �          205.1     CA23             � �          205.2     CA24             � �          205.3     CA25             � �          206.0     CA26             � �          206.1     CA27             � �          206.2     CA28             � �          206.3     CA29             � �          207.0     CA30             � �          207.1     CA31             � �          207.2     CA32             � �          207.3     CA33             � �          208.0     CA34             � �          208.1     CA35             � �          208.2     CA36             � �          208.3     CA37             � �          209.0     CA38             � �          209.1     CA39             � �          209.2     CA40             � �          209.3     CA41             � �          210.0     CA42             � �          210.1     CA43             � �          210.2     CA44             � �          210.3     CA45             � �      (    211.0 !lage flow alarm vuilproceswater    CA46             � �      ,    211.1 !regeneratie cmf niet op tijd gevuld    CA47             � �      .    211.2 !regeneratie cmf niet op tijd geledigd    CA48             � �          211.3     CA49             �            212.0     CA50             �           212.1     CA51             �           212.2     CA52             �           212.3     CA53             �           213.0     CA54             �           213.1     CA55             �           213.2     CA56             �           213.3     CA57             �           214.0     CA58             � 	          214.1     CA59             � 
          214.2     CA60             �           214.3     CA61             �           215.0     CA62             �           215.1     CA63             �           215.2     CA64             �           215.3     CA65             �           216.0     CA66             �           216.1     CA67             �           216.2     CA68             �           216.3     CA69             �           217.0     CA70             �           217.1     CA71             �           217.2     CA72             �           217.3     CA73             �           218.0     CA74             �           218.1     CA75             �           218.2     CA76             �           218.3     CA77             �           219.0     CA78             �           219.1     unnamed_219_2             �           219.2     unnamed_219_3             �           219.3     VERGR01             �            220.0     VERGR02             � !          220.1 !stuurlucht gestoord    VERGR03             � "          220.2 !stuurspanning gestoord    VERGR04             � #          220.3     VERGR05             � $          221.0 !vuilwater tank leeg    VERGR06             � %          221.1     VERGR07             � &          221.2     VERGR08             � '          221.3     VERGR09             � (          222.0     VERGR10             � )          222.1     VERGR11             � *          222.2     VERGR12             � +          222.3     VERGR13             � ,          223.0     VERGR14             � -          223.1     VERGR15             � .          223.2     VERGR16             � /          223.3     VERGR17             � 0          224.0     VERGR18             � 1          224.1     VERGR19             � 2          224.2     VERGR20             � 3          224.3     VERGR21             � 4          225.0     VERGR22             � 5          225.1     VERGR23             � 6          225.2     VERGR24             � 7          225.3     VERGR25             � 8          226.0     VERGR26             � 9          226.1     VERGR27             � :          226.2     VERGR28             � ;          226.3     VERGR29             � <          227.0     VERGR30             � =          227.1     VERGR31             � >          227.2     VERGR32             � ?          227.3     VERGR33             � @          228.0     VERGR34             � A          228.1     VERGR35             � B          228.2     VERGR36             � C          228.3     VERGR37             � D          229.0 !hoge druk alarm P10    VERGR38             � E          229.1     VERGR39             � F          229.2     VERGR40             � G          229.3     VERGR41             � H          230.0     VERGR42             � I          230.1     VERGR43             � J          230.2 !druk vuilproceswater    VERGR44             � K          230.3 !rho proceswater    VERGR45             � L      (    231.0 !lage flow alarm vuilproceswater    VERGR46             � M      ,    231.1 !regeneratie cmf niet op tijd gevuld    VERGR47             � N      .    231.2 !regeneratie cmf niet op tijd geledigd    VERGR48             � O          231.3     VERGR49             � P          232.0     VERGR50             � Q          232.1     VERGR51             � R          232.2     VERGR52             � S          232.3     VERGR53             � T          233.0     VERGR54             � U          233.1     VERGR55             � V          233.2     VERGR56             � W          233.3     VERGR57             � X          234.0     VERGR58             � Y          234.1     VERGR59             � Z          234.2     VERGR60             � [          234.3     VERGR61             � \          235.0     VERGR62             � ]          235.1     VERGR63             � ^          235.2     VERGR64             � _          235.3     VERGR65             � `          236.0     VERGR66             � a          236.1     VERGR67             � b          236.2     VERGR68             � c          236.3     VERGR69             � d          237.0     VERGR70             � e          237.1     VERGR71             � f          237.2     VERGR72             � g          237.3     VERGR73             � h          238.0     VERGR74             � i          238.1     VERGR75             � j          238.2     VERGR76             � k          238.3     VERGR77             � l          239.0     VERGR78             � m          239.1     unnamed_239_2             � n          239.2     unnamed_239_3             � o          239.3     MELD01             � p          240.0     MELD02             � q          240.1     MELD03             � r          240.2     MELD04             � s          240.3     MELD05             � t          241.0     MELD06             � u          241.1     MELD07             � v          241.2     MELD08             � w          241.3     MELD09             � x          242.0     MELD10             � y          242.1     MELD11             � z          242.2     MELD12             � {          242.3     MELD13             � |          243.0     MELD14             � }          243.1     MELD15             � ~          243.2     MELD16             �           243.3     MELD17             � �          244.0     MELD18             � �          244.1     MELD19             � �          244.2     MELD20             � �          244.3     MELD21             � �          245.0     MELD22             � �          245.1     MELD23             � �          245.2     MELD24             � �          245.3     MELD25             � �          246.0     MELD26             � �          246.1     MELD27             � �          246.2     MELD28             � �          246.3     MELD29             � �          247.0     MELD30             � �          247.1     MELD31             � �          247.2     MELD32             � �          247.3     MELD33             � �          248.0     MELD34             � �          248.1     MELD35             � �          248.2     MELD36             � �          248.3     MELD37             � �          249.0     MELD38             � �          249.1     MELD39             � �          249.2     MELD40             � �          249.3     MELD41             � �          250.0     MELD42             � �          250.1     MELD43             � �          250.2     MELD44             � �          250.3     MELD45             � �      (    251.0 !lage flow alarm vuilproceswater    MELD46             � �      ,    251.1 !regeneratie cmf niet op tijd gevuld    MELD47             � �      .    251.2 !regeneratie cmf niet op tijd geledigd    MELD48             � �          251.3     MELD49             � �          252.0     MELD50             � �          252.1     MELD51             � �          252.2     MELD52             � �          252.3     MELD53             � �          253.0     MELD54             � �          253.1     MELD55             � �          253.2     MELD56             � �          253.3     MELD57             � �          254.0     MELD58             � �          254.1     MELD59             � �          254.2     MELD60             � �          254.3     MELD61             � �          255.0     MELD62             � �          255.1     MELD63             � �          255.2     MELD64             � �          255.3     MELD65             � �          256.0     MELD66             � �          256.1     MELD67             � �          256.2     MELD68             � �          256.3     MELD69             � �          257.0     MELD70             � �          257.1     MELD71             � �          257.2     MELD72             � �          257.3     MELD73             � �          258.0     MELD74             � �          258.1     MELD75             � �          258.2     MELD76             � �          258.3     MELD77             � �          259.0     MELD78             � �          259.1     unnamed_259_2             � �          259.2     unnamed_259_3             � �          259.3     ALM1B01             � �          260.0     ALM1B02             � �          260.1     ALM1B03             � �          260.2     ALM1B04             � �          260.3     ALM1B05             � �          261.0     ALM1B06             � �          261.1     ALM1B07             � �          261.2     ALM1B08             � �          261.3     ALM1B09             � �          262.0     ALM1B10             � �          262.1     ALM1B11             � �          262.2     ALM1B12             � �          262.3     ALM1B13             � �          263.0     ALM1B14             � �          263.1     ALM1B15             � �          263.2     ALM1B16             � �          263.3     ALM1B17             � �          264.0     ALM1B18             � �          264.1     ALM1B19             � �          264.2     ALM1B20             � �          264.3     ALM1B21             � �          265.0     ALM1B22             � �          265.1     ALM1B23             � �          265.2     ALM1B24             � �          265.3     ALM1B25             � �          266.0     ALM1B26             � �          266.1     ALM1B27             � �          266.2     ALM1B28             � �          266.3     ALM1B29             � �          267.0     ALM1B30             � �          267.1     ALM1B31             � �          267.2     ALM1B32             � �          267.3     ALM1B33             � �          268.0     ALM1B34             � �          268.1     ALM1B35             � �          268.2     ALM1B36             � �          268.3     ALM1B37             � �          269.0     ALM1B38             � �          269.1     ALM1B39             � �          269.2     ALM1B40             � �          269.3     ALM1B41             � �          270.0     ALM1B42             � �          270.1     ALM1B43             � �          270.2     ALM1B44             � �          270.3     ALM1B45             � �          271.0     ALM1B46             � �          271.1     ALM1B47             � �          271.2     ALM1B48             � �          271.3     ALM1B49             � �          272.0     ALM1B50             � �          272.1     ALM1B51             � �          272.2     ALM1B52             � �          272.3     ALM1B53             � �          273.0     ALM1B54             � �          273.1     ALM1B55             � �          273.2     ALM1B56             � �          273.3     ALM1B57             � �          274.0     ALM1B58             � �          274.1     ALM1B59             � �          274.2     ALM1B60             � �          274.3     ALM1B61             � �          275.0     ALM1B62             � �          275.1     ALM1B63             � �          275.2     ALM1B64             � �          275.3     ALM1B65             �            276.0     ALM1B66             �           276.1     ALM1B67             �           276.2     ALM1B68             �           276.3     ALM1B69             �           277.0     ALM1B70             �           277.1     ALM1B71             �           277.2     ALM1B72             �           277.3     ALM1B73             �           278.0     ALM1B74             � 	          278.1     ALM1B75             � 
          278.2     ALM1B76             �           278.3     ALM1B77             �           279.0     ALM1B78             �           279.1     unnamed_279_2             �           279.2     unnamed_279_3             �           279.3     ALM2B01             �           280.0     ALM2B02             �           280.1     ALM2B03             �           280.2     ALM2B04             �           280.3     ALM2B05             �           281.0     ALM2B06             �           281.1     ALM2B07             �           281.2     ALM2B08             �           281.3     ALM2B09             �           282.0     ALM2B10             �           282.1     ALM2B11             �           282.2     ALM2B12             �           282.3     ALM2B13             �           283.0     ALM2B14             �           283.1     ALM2B15             �           283.2     ALM2B16             �           283.3     ALM2B17             �            284.0     ALM2B18             � !          284.1     ALM2B19             � "          284.2     ALM2B20             � #          284.3     ALM2B21             � $          285.0     ALM2B22             � %          285.1     ALM2B23             � &          285.2     ALM2B24             � '          285.3     ALM2B25             � (          286.0     ALM2B26             � )          286.1     ALM2B27             � *          286.2     ALM2B28             � +          286.3     ALM2B29             � ,          287.0     ALM2B30             � -          287.1     ALM2B31             � .          287.2     ALM2B32             � /          287.3     ALM2B33             � 0          288.0     ALM2B34             � 1          288.1     ALM2B35             � 2          288.2     ALM2B36             � 3          288.3     ALM2B37             � 4          289.0     ALM2B38             � 5          289.1     ALM2B39             � 6          289.2     ALM2B40             � 7          289.3     ALM2B41             � 8          290.0     ALM2B42             � 9          290.1     ALM2B43             � :          290.2     ALM2B44             � ;          290.3     ALM2B45             � <          291.0     ALM2B46             � =          291.1     ALM2B47             � >          291.2     ALM2B48             � ?          291.3     ALM2B49             � @          292.0     ALM2B50             � A          292.1     ALM2B51             � B          292.2     ALM2B52             � C          292.3     ALM2B53             � D          293.0     ALM2B54             � E          293.1     ALM2B55             � F          293.2     ALM2B56             � G          293.3     ALM2B57             � H          294.0     ALM2B58             � I          294.1     ALM2B59             � J          294.2     ALM2B60             � K          294.3     ALM2B61             � L          295.0     ALM2B62             � M          295.1     ALM2B63             � N          295.2     ALM2B64             � O          295.3     ALM2B65             � P          296.0     ALM2B66             � Q          296.1     ALM2B67             � R          296.2     ALM2B68             � S          296.3     ALM2B69             � T          297.0     ALM2B70             � U          297.1     ALM2B71             � V          297.2     ALM2B72             � W          297.3     ALM2B73             � X          298.0     ALM2B74             � Y          298.1     ALM2B75             � Z          298.2     ALM2B76             � [          298.3     ALM2B77             � \          299.0     ALM2B78             � ]          299.1     unnamed_299_2             � ^          299.2     unnamed_299_3             � _          299.3     ALM3B01             � `          300.0     ALM3B02             � a          300.1     ALM3B03             � b          300.2     ALM3B04             � c          300.3     ALM3B05             � d          301.0     ALM3B06             � e          301.1     ALM3B07             � f          301.2     ALM3B08             � g          301.3     ALM3B09             � h          302.0     ALM3B10             � i          302.1     ALM3B11             � j          302.2     ALM3B12             � k          302.3     ALM3B13             � l          303.0     ALM3B14             � m          303.1     ALM3B15             � n          303.2     ALM3B16             � o          303.3     ALM3B17             � p          304.0     ALM3B18             � q          304.1     ALM3B19             � r          304.2     ALM3B20             � s          304.3     ALM3B21             � t          305.0     ALM3B22             � u          305.1     ALM3B23             � v          305.2     ALM3B24             � w          305.3     ALM3B25             � x          306.0     ALM3B26             � y          306.1     ALM3B27             � z          306.2     ALM3B28             � {          306.3     ALM3B29             � |          307.0     ALM3B30             � }          307.1     ALM3B31             � ~          307.2     ALM3B32             �           307.3     ALM3B33             � �          308.0     ALM3B34             � �          308.1     ALM3B35             � �          308.2     ALM3B36             � �          308.3     ALM3B37             � �          309.0     ALM3B38             � �          309.1     ALM3B39             � �          309.2     ALM3B40             � �          309.3     ALM3B41             � �          310.0     ALM3B42             � �          310.1     ALM3B43             � �          310.2     ALM3B44             � �          310.3     ALM3B45             � �          311.0     ALM3B46             � �          311.1     ALM3B47             � �          311.2     ALM3B48             � �          311.3     ALM3B49             � �          312.0     ALM3B50             � �          312.1     ALM3B51             � �          312.2     ALM3B52             � �          312.3     ALM3B53             � �          313.0     ALM3B54             � �          313.1     ALM3B55             � �          313.2     ALM3B56             � �          313.3     ALM3B57             � �          314.0     ALM3B58             � �          314.1     ALM3B59             � �          314.2     ALM3B60             � �          314.3     ALM3B61             � �          315.0     ALM3B62             � �          315.1     ALM3B63             � �          315.2     ALM3B64             � �          315.3     ALM3B65             � �          316.0     ALM3B66             � �          316.1     ALM3B67             � �          316.2     ALM3B68             � �          316.3     ALM3B69             � �          317.0     ALM3B70             � �          317.1     ALM3B71             � �          317.2     ALM3B72             � �          317.3     ALM3B73             � �          318.0     ALM3B74             � �          318.1     ALM3B75             � �          318.2     ALM3B76             � �          318.3     ALM3B77             � �          319.0     ALM3B78             � �          319.1     unnamed_319_2             � �          319.2     unnamed_319_3             � �          319.3     ALARM01             � �          320.0 !spoeldruk te hoog    ALARM02             � �          320.1 !stuurlucht gestoord    ALARM03             � �          320.2 !stuurspanning gestoord    ALARM04             � �      !    320.3 !vuilwatertank bijna leeg    ALARM05             � �          321.0 !vuilwatertank leeg    ALARM06             � �      "    321.1 !geleidbaarheid na spoelen    ALARM07             � �      !    321.2 !filtercapaciteit te laag    ALARM08             � �      $    321.3 !concentraat afvoer gestoord    ALARM09             � �          322.0 !nivo warme loog    ALARM10             � �          322.1 !nivo zoutzuur    ALARM11             � �          322.2 !temperatuur loog    ALARM12             � �          322.3 !nivo neutralisatie    ALARM37             � �      !    323.0 !P10 rondpompdruk te hoog    ALARM38             � �          323.1     ALARM39             � �          323.2 !P10 niet paraat    ALARM40             � �          323.3 !P11 niet paraat    ALARM41             � �      "    324.0 !concentraatafvoer te hoog    ALARM42             � �          324.1 !nivo proceswater    ALARM43             � �          324.2 !druk vuilproceswater    ALARM44             � �          324.3 !rho proceswater    ALARM45             � �      (    325.0 !lage flow alarm vuilproceswater    ALARM46             � �      ,    325.1 !regeneratie cmf niet op tijd gevuld    ALARM47             � �      .    325.2 !regeneratie cmf niet op tijd geledigd    ALARM48             � �          325.3     ALARM49             � �          326.0     ALARM50             � �          326.1     ALARM51             � �          326.2     ALARM52             � �          326.3     ALARM53             � �          327.0     ALARM54             � �          327.1     ALARM55             � �          327.2     ALARM56             � �          327.3     ALARM57             � �          328.0     ALARM58             � �          328.1     ALARM59             � �          328.2     ALARM60             � �          328.3     ALARM61             � �          329.0     ALARM62             � �          329.1     ALARM63             � �          329.2     ALARM64             � �          329.3     ALARM65             � �          330.0     ALARM66             � �          330.1     ALARM67             � �          330.2     ALARM68             � �          330.3     ALARM69             � �          331.0     ALARM70             � �          331.1     ALARM71             � �          331.2     ALARM72             � �          331.3     ALARM73             � �          332.0     ALARM74             � �          332.1     ALARM75             � �          332.2     ALARM76             � �          332.3     ALARM77             � �          333.0     ALARM78             � �          333.1     unnamed_333_2             � �          333.2     unnamed_333_3             � �          333.3     unnamed_334_0             � �          334.0     unnamed_334_1             � �          334.1     unnamed_334_2             � �          334.2     unnamed_334_3             � �          334.3     ALM0B00             � �          335.0 !laadpuls timer    ALM0B01             � �           335.1 !timer spoeldrukbewaking    ALM0B02             � �          335.2 !triggerpuls fase 33.1    ALM0B03             � �          335.3     ALM0B04             � �      )    336.0 !tijdvertr. rho alarm proceswater    ALM0B05             � �          336.1     ALM0B06             � �      +    336.2 !tijdvertr.alarm geleidb.h. bedrijf    ALM0B07             � �      !    336.3 !temperatuur loog korrekt    ALM0B08             � �      &    337.0 !een of meerdere afsl.gestoord    ALM0B09             � �          337.1 !alarmmelding P10    ALM0B10             � �          337.2 !alarmmelding P10    ALM0B11             � �          337.3 !dump    ALM0B12             � �          338.0 !dump    ALM0B13             � �          338.1     ALM0B14             � �          338.2     ALM0B15             � �          338.3     ALM0B16             � �          339.0     ALM0B17             � �          339.1     ALM0B18             � �          339.2     ALM0B19             � �          339.3     ALM0B20             �            340.0     ALM0B21             �           340.1     ALM0B22             �           340.2     ALM0B23             �           340.3     ALM0B24             �       (    341.0 !aansturing V1.2,of V3.2,of V5.2    ALM0T01             �           341.1 !triggerpuls    ALM0T02             �           341.2 !triggerpuls    ALM0T03             �           341.3 !triggerpuls    ALM0T04             �           342.0 !triggerpuls    ALM0T05             � 	          342.1 !triggerpuls    ALM0T06             � 
          342.2 !triggerpuls    unnamed_342_3             �           342.3     ALM0B25             �       %    343.0 !regeneratieaanvraag (claxon)    ALM0B26             �       (    343.1 !trigger keuzeschak. REGENERATIE    REG0T00             �           345.0 !doorstap triggerpuls    REG0T08             �       '    345.1 !triggerpuls laden timer fase 8    REG0T09             �       '    345.2 !triggerpuls laden timer fase 9    REG0T10             �       (    345.3 !triggerpuls laden timer fase 10    REG0T11             �       (    346.0 !triggerpuls laden timer fase 11    REG0T12             �       (    346.1 !triggerpuls laden timer fase 12    REG0T13             �       (    346.2 !triggerpuls laden timer fase 13    REG0T14             �       (    346.3 !triggerpuls laden timer fase 14    REG0T15             �       (    347.0 !triggerpuls laden timer fase 15    REG0T16             �       (    347.1 !triggerpuls laden timer fase 16    REG0T17             �       (    347.2 !triggerpuls laden timer fase 17    REG0T18             �       (    347.3 !triggerpuls laden timer fase 18    REG0T19             �       (    348.0 !triggerpuls laden timer fase 19    REG0T20             �       (    348.1 !triggerpuls laden timer fase 20    REG0T21             �       (    348.2 !triggerpuls laden timer fase 21    REG0T22             �       (    348.3 !triggerpuls laden timer fase 22    REG0T23             �       (    349.0 !triggerpuls laden timer fase 23    REG0T24             �       (    349.1 !triggerpuls laden timer fase 24    REG0T25             �        (    349.2 !triggerpuls laden timer fase 25    REG0T26             � !      (    349.3 !triggerpuls laden timer fase 26    REG0T27             � "      (    350.0 !triggerpuls laden timer fase 27    REG0T28             � #      (    350.1 !triggerpuls laden timer fase 28    REG0T29             � $      (    350.2 !triggerpuls laden timer fase 29    REG0T30             � %      (    350.3 !triggerpuls laden timer fase 30    REG0T31             � &      (    351.0 !triggerpuls laden timer fase 31    REG0T32             � '      (    351.1 !triggerpuls laden timer fase 32    REG0T33             � (      (    351.2 !triggerpuls laden timer fase 33    REG0T34             � )      *    351.3 !triggerpuls laden timer fase 33.1    REG0T35             � *          352.0 !triggerpuls    STAP_3             � +          352.1 !stappen fase register    REG0T36             � ,          352.2 !triggerpuls    unnamed_352_3             � -          352.3     REG0B35             � .          353.0 !einde fasetimer    REG0B36             � /      *    353.1 !startpuls regen. fasen 8 t/m 33.1    REG0B37             � 0      $    353.2 !hand doorstap (triggerpuls)    unnamed_353_3             � 1          353.3     REG0B39             � 2          354.0 !uurpuls    REG0B40             � 3          354.1 !einde regeneratie    REG0B41             � 4           354.2 !reg.aanvr. op tijdbasis    REG0B42             � 5          354.3 !regeneratieaanvraag    REG0B43             � 6          355.0 !start spuien    REG0B44             � 7          355.1 !laadpuls spui_timer    REG0B45             � 8          355.2 !einde spuitijd    REG0B46             � 9          355.3 !openen commando V10.4    REG0B47             � :          356.0 !startvoorw.regen.fout    REG0B48             � ;          356.1 !regen.startvoorwaarden    REG0B49             � <          356.2 !geleidb.h. QIA1 ok    REG0B50             � =          356.3 !geleidb.h. QIA2 ok    DUMP1             � >          357.0     DUMP2             � ?          357.1     DUMP3             � @          357.2     unnamed_357_3             � A          357.3     REG0B51             � B      +    358.0 !vertr. controle spoelwater fase 32    REG0B52             � C      ,    358.1 !vertr. controle proceswater fase 33    REG0B53             � D          358.2 !handmatig vullen CMF    REG0B54             � E          358.3 !handmatig ledigen CMF    REG0B55             � F      $    359.0 !regeneratiefasen CMF vullen    REG0B56             � G      %    359.1 !regeneratiefasen CMF ledigen    REG0B57             � H      %    359.2 !doorstap reg.fase CMF gevuld    REG0B58             � I      1    359.3 !tijdvertr. detectieschakelaar CMF gevuld    BDR0B12             � J      #    360.0 !startpuls wachttijd fase 7    BDR0B13             � K          360.1 !min. puls    BDR0B14             � L      '    360.2 !einde 8 uur (wachttijd) fase 7    BDR0B15             � M          360.3 !fase 2,4,6    BDR0B16             � N      #    361.0 !puls fasebegin fasen 2,4,6    BDR0B17             � O          361.1 !fase 7    BDR0B18             � P      $    361.2 !puls laden fasetimer fase 7    BDR0B19             � Q      (    361.3 !fasetimer fase 7 (einde fase 7)    BDR0B20             � R           362.0 !puls drukknop aktiveren    BDR0B21             � S      '    362.1 !vrijgave uitgangen (aktiveren)    BDR0B22             � T          362.2 !puls handbedrijf    BDR0B23             � U           362.3 !triggerpuls doorstappen    BDR0T08             � V          363.0 !triggerpuls    BDR0T09             � W      '    363.1 !tr.puls laden wachttijd fase 7    BDR0T10             � X      "    363.2 !tr.puls begin fasen 2,4,6    BDR0T11             � Y          363.3     BDR0T12             � Z          364.0 !triggerpuls    BDR0T13             � [          364.1 !triggerpuls    BDR0T14             � \          364.2 !triggerpuls    BDR0T15             � ]          364.3 !triggerpuls    TIMER_61             � ^      )    365.0 !pauzetijd aansturing afsl. V12.1    TIMER_62             � _      (    365.1 !pulstijd aansturing afsl. V12.1    EIND_88             � `          365.2 !einde aanloopfase 88    TMRGEL88             � a      .    365.3 !timer 1 min. geleidb. goed in fase 88    TRGBEG88             � b      "    366.0 !triggerpuls begin fase 88    FLW0B00             � c          370.0 !F=C    FLW0B01             � d          370.1 !F<C    FLW0B02             � e          370.2 !F>C    FLW0B03             � f          370.3 !F niet gelijk aan C    FLW1B00             � g          371.0 !F=C    FLW1B01             � h          371.1 !F<C    FLW1B02             � i          371.2 !F>C    FLW1B03             � j          371.3 !F niet gelijk aan C    FLW2B00             � k          372.0 !F=C    FLW2B01             � l          372.1 !F<C    FLW2B02             � m          372.2 !F>C    FLW2B03             � n          372.3 !F niet gelijk aan C    FLW3B00             � o          373.0 !F=C    FLW3B01             � p          373.1 !F<C    FLW3B02             � q          373.2 !F>C    FLW3B03             � r          373.3 !F niet gelijk aan C    FLW0B04             � s          374.0 !tijdvertr. flowalarm    FLW1B04             � t          374.1 !tijdvertr. flowalarm    FLW2B04             � u          374.2 !tijdvertr. flowalarm    FLW3B04             � v          374.3 !tijdvertr. flowalarm    GEL0B00             � w          375.0 !F=C    GEL0B01             � x          375.1 !F<C    GEL0B02             � y          375.2 !F>C    GEL0B03             � z          375.3 !F niet gelijk aan C    GEL1B00             � {          376.0 !F=C    GEL1B01             � |          376.1 !F<C    GEL1B02             � }          376.2 !F>C    GEL1B03             � ~          376.3 !F niet gelijk aan C    GEL2B00             �           377.0 !F=C    GEL2B01             � �          377.1 !F<C    GEL2B02             � �          377.2 !F>C    GEL2B03             � �          377.3 !F niet gelijk aan C    GEL3B00             � �          378.0 !F=C    GEL3B01             � �          378.1 !F<C    GEL3B02             � �          378.2 !F>C    GEL3B03             � �          378.3 !F niet gelijk aan C    GEL0B04             � �          379.0 !tijdvertr. flowalarm    GEL1B04             � �          379.1 !tijdvertr. flowalarm    GEL2B04             � �          379.2 !tijdvertr. flowalarm    GEL3B04             � �          379.3 !tijdvertr. flowalarm    DSP0L01             � �      %    380.0 !hulp aansturing display "01"    DSP0L02             � �      %    380.1 !hulp aansturing display "02"    DSP0L04             � �      %    380.2 !hulp aansturing display "04"    DSP0L08             � �      %    380.3 !hulp aansturing display "08"    DSP0L10             � �      %    381.0 !hulp aansturing display "10"    DSP0L20             � �      %    381.1 !hulp aansturing display "20"    DSP0L40             � �      %    381.2 !hulp aansturing display "40"    DSP0L80             � �      %    381.3 !hulp aansturing display "80"    WZC0B04             � �      '    386.0 !commando BEDRIJF vanuit wizcon    WZC0B06             � �      +    386.2 !commando REGENERATIE vanuit wizcon    WZC0B07             � �      &    386.3 !commando SPUIEN vanuit wizcon    WZC0B08             � �          387.0 !wizconcommando BEDRIJF    WZC0B09             � �           387.1 !wizconcommando STAND_BY    WZC0B10             � �      #    387.2 !wizconcommando REGENERATIE    WZC0B11             � �          387.3 !wizconcommando SPUIEN    WZC0B12             � �      8    388.0 !wizconcommando BEDRIJF + KEUZESCHAK.=SUPERVISOR    WZC0B13             � �      9    388.1 !wizconcommando STAND_BY + KEUZESCHAK.=SUPERVISOR    WZC0B14             � �      ;    388.2 !wizconcommando REGENRATIE + KEUZESCHAK.=SUPERVISOR    WZC0B15             � �      7    388.3 !wizconcommando SPUIEN + KEUZESCHAK.=SUPERVISOR    WZC0T00             � �      +    389.0 !triggerpuls wizconcommando BEDRIJF    WZC0T02             � �      .    389.2 !triggerpuls wizconcommando REGENRATIE    WZC0T03             � �      *    389.3 !triggerpuls wizconcommando SPUIEN    WZC0B16             � �      #    390.0 !bedrijfsvoering via WIZCON    WZC0T04             � �      -    390.1 !triggerpuls einde bedrijf via WIZCON    WZC0B17             � �      &    390.2 !puls einde bedrijf via WIZCON    WZC0B18             � �      *    390.3 !puls einde bedrijf via schakelaar    REG0B60             � �          400.0 !regeneratie fase 60    REG0B61             � �          400.1 !regeneratie fase 61    REG0B62             � �          400.2 !regeneratie fase 62    REG0B63             � �          400.3 !regeneratie fase 63    REG0B64             � �          401.0 !regeneratie fase 64    REG0B65             � �          401.1 !regeneratie fase 65    TRGSTART             � �      )    401.2 !triggerpuls start fasen 8 t/m 32    ZUURLOOG             � �      %    401.3 !regeneratie met zuur en loog    REG0T60             � �      (    402.0 !triggerpuls laden timer fase 60    REG0T61             � �      (    402.1 !triggerpuls laden timer fase 61    REG0T62             � �      (    402.2 !triggerpuls laden timer fase 62    REG0T63             � �      (    402.3 !triggerpuls laden timer fase 63    REG0T64             � �      (    403.0 !triggerpuls laden timer fase 64    REG0T65             � �      (    403.1 !triggerpuls laden timer fase 65    S_0_1SEC             � �          511.0 !triggerpuls 0,1 sec.    S_1SEC             � �          511.1 !triggerpuls 1,0 sec.    S_10SEC             � �          511.2 !triggerpuls 10 sec.    S_1MIN             � �          511.3 !triggerpuls 1 min.    DWS1_1            � �          104 !eenheid DWS    DWS1_2            � �          105 !tiental DWS    SETP_0            � �      #    106 !ingevoerde setpoint eenheden    SETP_1            � �      %    107 !ingevoerde setpoint tientallen    SETP_2            � �      (    108 !ingevoerde setpoint honderdtallen    SETP_3            � �      (    109 !ingevoerde setpoint duizendtallen    DWS2_1            � �          110 !eenheid DWS    DWS2_2            � �          111 !tiental DWS    DISPL_0            � �          160 !display aansturing eenh.    DISPL_1            � �      "    161 !display aansturing tiental.    DISPL_2            � �      #    162 !display aansturing honderdt.    DISPL_3            � �      #    163 !display aansturing duizendt.    DSP1            � �      $    164 !aansturing display "eenheden"    DSP2            � �      &    165 !aansturing display "tientallen"    unnamed_0166            � �          166     unnamed_0167            � �          167     ST1BUF1            � �          168 !+    ST2BUF1            � �          169 !storingscode lichtkrant    ST3BUF1            � �          170 !+    FLW0D00            � �          370 !vergelijkingsresult.    FLW1D00            � �          371 !vergelijkingsresult.    FLW2D00            � �          372 !vergelijkingsresult.    FLW3D00            � �          373 !vergelijkingsresult.    unnamed_0374            � �          374     GEL0D00            � �          375 !vergelijkingsresult.    GEL1D00            � �          376 !vergelijkingsresult.    GEL2D00            � �          377 !vergelijkingsresult.    GEL3D00            � �          378 !vergelijkingsresult.    FLW00_2            � �          1001 !MSB +    FLW00_1            � �          1002 !| flow reinwater    FLW00_0            � �          1003 !LSB +    unnamed_1004            � �          1004     FLW01_2            � �          1005 !MSB +    FLW01_1            � �          1006 !| flow ruwwater    FLW01_0            � �          1007 !LSB +    unnamed_1008            � �          1008     FLW02_2            � �          1009 !MSB +    FLW02_1            � �          1010 !| flow concentraat    FLW02_0            � �          1011 !LSB +    unnamed_1012            � �          1012     FLW03_2            � �          1013 !MSB +    FLW03_1            � �          1014 !| reserve    FLW03_0            � �          1015 !LSB +    unnamed_1016            � �          1016     GEL00_2            � �          1017 !MSB +    GEL00_1            � �      "    1018 !| geleidbaarheid reinwater    GEL00_0            � �          1019 !LSB +    unnamed_1020            � �          1020     GEL01_2            � �          1021 !MSB +    GEL01_1            � �      %    1022 !| geleidbaarheid spoelleiding    GEL01_0            � �          1023 !LSB +    unnamed_1024            � �          1024     GEL02_2            � �          1025 !MSB +    GEL02_1            � �          1026 !| reserve    GEL02_0            � �          1027 !LSB +    unnamed_1028            � �          1028     GEL03_2            � �          1029 !MSB +    GEL03_1            � �          1030 !| reserve    GEL03_0            � �          1031 !LSB +    DSP00_0            � �          1100 !display 00 eenheden    DSP00_1            � �          1101 !display 00 tientallen    DSP00_2            � �           1102 !display 00 honderdtallen    DSP00_3            � �           1103 !display 00 duizendtallen    DSP01_0            � �          1104 !display 01 eenheden    DSP01_1            � �          1105 !display 01 tientallen    DSP01_2            � �           1106 !display 01 honderdtallen    DSP01_3            � �           1107 !display 01 duizendtallen    DSP02_0            � �          1108 !display 02 eenheden    DSP02_1            � �          1109 !display 02 tientallen    DSP02_2            � �           1110 !display 02 honderdtallen    DSP02_3            � �           1111 !display 02 duizendtallen    DSP03_0            � �          1112 !display 03 eenheden    DSP03_1            � �          1113 !display 03 tientallen    DSP03_2            �             1114 !display 03 honderdtallen    DSP03_3            �            1115 !display 03 duizendtallen    DSP04_0            �           1116 !display 04 eenheden    DSP04_1            �           1117 !display 04 tientallen    DSP04_2            �            1118 !display 04 honderdtallen    DSP04_3            �            1119 !display 04 duizendtallen    DSP05_0            �           1120 !display 05 eenheden    DSP05_1            �           1121 !display 05 tientallen    DSP05_2            �            1122 !display 05 honderdtallen    DSP05_3            � 	           1123 !display 05 duizendtallen    DSP06_0            � 
          1124 !display 06 eenheden    DSP06_1            �           1125 !display 06 tientallen    DSP06_2            �            1126 !display 06 honderdtallen    DSP06_3            �            1127 !display 06 duizendtallen    DSP07_0            �           1128 !display 07 eenheden    DSP07_1            �           1129 !display 07 tientallen    DSP07_2            �            1130 !display 07 honderdtallen    DSP07_3            �            1131 !display 07 duizendtallen    DSP08_0            �           1132 !display 08 eenheden    DSP08_1            �           1133 !display 08 tientallen    DSP08_2            �            1134 !display 08 honderdtallen    DSP08_3            �            1135 !display 08 duizendtallen    DSP09_0            �           1136 !display 09 eenheden    DSP09_1            �           1137 !display 09 tientallen    DSP09_2            �            1138 !display 09 honderdtallen    DSP09_3            �            1139 !display 09 duizendtallen    DSP10_0            �           1140 !display 10 eenheden    DSP10_1            �           1141 !display 10 tientallen    DSP10_2            �            1142 !display 10 honderdtallen    DSP10_3            �            1143 !display 10 duizendtallen    DSP11_0            �           1144 !display 11 eenheden    DSP11_1            �           1145 !display 11 tientallen    DSP11_2            �             1146 !display 11 honderdtallen    DSP11_3            � !           1147 !display 11 duizendtallen    DSP12_0            � "          1148 !display 12 eenheden    DSP12_1            � #          1149 !display 12 tientallen    DSP12_2            � $           1150 !display 12 honderdtallen    DSP12_3            � %           1151 !display 12 duizendtallen    DSP13_0            � &          1152 !display 13 eenheden    DSP13_1            � '          1153 !display 13 tientallen    DSP13_2            � (           1154 !display 13 honderdtallen    DSP13_3            � )           1155 !display 13 duizendtallen    DSP14_0            � *          1156 !display 14 eenheden    DSP14_1            � +          1157 !display 14 tientallen    DSP14_2            � ,           1158 !display 14 honderdtallen    DSP14_3            � -           1159 !display 14 duizendtallen    DSP15_0            � .          1160 !display 15 eenheden    DSP15_1            � /          1161 !display 15 tientallen    DSP15_2            � 0           1162 !display 15 honderdtallen    DSP15_3            � 1           1163 !display 15 duizendtallen    DSP16_0            � 2          1164 !display 16 eenheden    DSP16_1            � 3          1165 !display 16 tientallen    DSP16_2            � 4           1166 !display 16 honderdtallen    DSP16_3            � 5           1167 !display 16 duizendtallen    DSP17_0            � 6          1168 !display 17 eenheden    DSP17_1            � 7          1169 !display 17 tientallen    DSP17_2            � 8           1170 !display 17 honderdtallen    DSP17_3            � 9           1171 !display 17 duizendtallen    DSP18_0            � :          1172 !display 18 eenheden    DSP18_1            � ;          1173 !display 18 tientallen    DSP18_2            � <           1174 !display 18 honderdtallen    DSP18_3            � =           1175 !display 18 duizendtallen    DSP19_0            � >          1176 !display 19 eenheden    DSP19_1            � ?          1177 !display 19 tientallen    DSP19_2            � @           1178 !display 19 honderdtallen    DSP19_3            � A           1179 !display 19 duizendtallen    DSP20_0            � B          1180 !display 20 eenheden    DSP20_1            � C          1181 !display 20 tientallen    DSP20_2            � D           1182 !display 20 honderdtallen    DSP20_3            � E           1183 !display 20 duizendtallen    DSP21_0            � F          1184 !display 21 eenheden    DSP21_1            � G          1185 !display 21 tientallen    DSP21_2            � H           1186 !display 21 honderdtallen    DSP21_3            � I           1187 !display 21 duizendtallen    DSP22_0            � J          1188 !display 22 eenheden    DSP22_1            � K          1189 !display 22 tientallen    DSP22_2            � L           1190 !display 22 honderdtallen    DSP22_3            � M           1191 !display 22 duizendtallen    DSP23_0            � N          1192 !display 23 eenheden    DSP23_1            � O          1193 !display 23 tientallen    DSP23_2            � P           1194 !display 23 honderdtallen    DSP23_3            � Q           1195 !display 23 duizendtallen    DSP24_0            � R          1196 !display 24 eenheden    DSP24_1            � S          1197 !display 24 tientallen    DSP24_2            � T           1198 !display 24 honderdtallen    DSP24_3            � U           1199 !display 24 duizendtallen    DSP25_0            � V          1200 !display 25 eenheden    DSP25_1            � W          1201 !display 25 tientallen    DSP25_2            � X           1202 !display 25 honderdtallen    DSP25_3            � Y           1203 !display 25 duizendtallen    DSP26_0            � Z          1204 !display 26 eenheden    DSP26_1            � [          1205 !display 26 tientallen    DSP26_2            � \           1206 !display 26 honderdtallen    DSP26_3            � ]           1207 !display 26 duizendtallen    DSP27_0            � ^          1208 !display 27 eenheden    DSP27_1            � _          1209 !display 27 tientallen    DSP27_2            � `           1210 !display 27 honderdtallen    DSP27_3            � a           1211 !display 27 duizendtallen    DSP28_0            � b          1212 !display 28 eenheden    DSP28_1            � c          1213 !display 28 tientallen    DSP28_2            � d           1214 !display 28 honderdtallen    DSP28_3            � e           1215 !display 28 duizendtallen    DSP29_0            � f          1216 !display 29 eenheden    DSP29_1            � g          1217 !display 29 tientallen    DSP29_2            � h           1218 !display 29 honderdtallen    DSP29_3            � i           1219 !display 29 duizendtallen    DSP30_0            � j          1220 !display 30 eenheden    DSP30_1            � k          1221 !display 30 tientallen    DSP30_2            � l           1222 !display 30 honderdtallen    DSP30_3            � m           1223 !display 30 duizendtallen    DSP31_0            � n          1224 !display 31 eenheden    DSP31_1            � o          1225 !display 31 tientallen    DSP31_2            � p           1226 !display 31 honderdtallen    DSP31_3            � q           1227 !display 31 duizendtallen    DSP32_0            � r          1228 !display 32 eenheden    DSP32_1            � s          1229 !display 32 tientallen    DSP32_2            � t           1230 !display 32 honderdtallen    DSP32_3            � u           1231 !display 32 duizendtallen    DSP33_0            � v          1232 !display 33 eenheden    DSP33_1            � w          1233 !display 33 tientallen    DSP33_2            � x           1234 !display 33 honderdtallen    DSP33_3            � y           1235 !display 33 duizendtallen    DSP34_0            � z          1236 !display 34 eenheden    DSP34_1            � {          1237 !display 34 tientallen    DSP34_2            � |           1238 !display 34 honderdtallen    DSP34_3            � }           1239 !display 34 duizendtallen    DSP35_0            � ~          1240 !display 35 eenheden    DSP35_1            �           1241 !display 35 tientallen    DSP35_2            � �           1242 !display 35 honderdtallen    DSP35_3            � �           1243 !display 35 duizendtallen    DSP36_0            � �          1244 !display 36 eenheden    DSP36_1            � �          1245 !display 36 tientallen    DSP36_2            � �           1246 !display 36 honderdtallen    DSP36_3            � �           1247 !display 36 duizendtallen    DSP37_0            � �          1248 !display 37 eenheden    DSP37_1            � �          1249 !display 37 tientallen    DSP37_2            � �           1250 !display 37 honderdtallen    DSP37_3            � �           1251 !display 37 duizendtallen    DSP38_0            � �          1252 !display 38 eenheden    DSP38_1            � �          1253 !display 38 tientallen    DSP38_2            � �           1254 !display 38 honderdtallen    DSP38_3            � �           1255 !display 38 duizendtallen    DSP39_0            � �          1256 !display 39 eenheden    DSP39_1            � �          1257 !display 39 tientallen    DSP39_2            � �           1258 !display 39 honderdtallen    DSP39_3            � �           1259 !display 39 duizendtallen    DSP40_0            � �          1260 !display 40 eenheden    DSP40_1            � �          1261 !display 40 tientallen    DSP40_2            � �           1262 !display 40 honderdtallen    DSP40_3            � �           1263 !display 40 duizendtallen    DSP41_0            � �          1264 !display 41 eenheden    DSP41_1            � �          1265 !display 41 tientallen    DSP41_2            � �           1266 !display 41 honderdtallen    DSP41_3            � �           1267 !display 41 duizendtallen    DSP42_0            � �          1268 !display 42 eenheden    DSP42_1            � �          1269 !display 42 tientallen    DSP42_2            � �           1270 !display 42 honderdtallen    DSP42_3            � �           1271 !display 42 duizendtallen    DSP43_0            � �          1272 !display 43 eenheden    DSP43_1            � �          1273 !display 43 tientallen    DSP43_2            � �           1274 !display 43 honderdtallen    DSP43_3            � �           1275 !display 43 duizendtallen    DSP44_0            � �          1276 !display 44 eenheden    DSP44_1            � �          1277 !display 44 tientallen    DSP44_2            � �           1278 !display 44 honderdtallen    DSP44_3            � �           1279 !display 44 duizendtallen    DSP45_0            � �          1280 !display 45 eenheden    DSP45_1            � �          1281 !display 45 tientallen    DSP45_2            � �           1282 !display 45 honderdtallen    DSP45_3            � �           1283 !display 45 duizendtallen    DSP46_0            � �          1284 !display 46 eenheden    DSP46_1            � �          1285 !display 46 tientallen    DSP46_2            � �           1286 !display 46 honderdtallen    DSP46_3            � �           1287 !display 46 duizendtallen    DSP47_0            � �          1288 !display 47 eenheden    DSP47_1            � �          1289 !display 47 tientallen    DSP47_2            � �           1290 !display 47 honderdtallen    DSP47_3            � �           1291 !display 47 duizendtallen    DSP48_0            � �          1292 !display 48 eenheden    DSP48_1            � �          1293 !display 48 tientallen    DSP48_2            � �           1294 !display 48 honderdtallen    DSP48_3            � �           1295 !display 48 duizendtallen    DSP49_0            � �          1296 !display 49 eenheden    DSP49_1            � �          1297 !display 49 tientallen    DSP49_2            � �           1298 !display 49 honderdtallen    DSP49_3            � �           1299 !display 49 duizendtallen    DSP50_0            � �          1300 !display 50 eenheden    DSP50_1            � �          1301 !display 50 tientallen    DSP50_2            � �           1302 !display 50 honderdtallen    DSP50_3            � �           1303 !display 50 duizendtallen    DSP51_0            � �          1304 !display 51 eenheden    DSP51_1            � �          1305 !display 51 tientallen    DSP51_2            � �           1306 !display 51 honderdtallen    DSP51_3            � �           1307 !display 51 duizendtallen    DSP52_0            � �          1308 !display 52 eenheden    DSP52_1            � �          1309 !display 52 tientallen    DSP52_2            � �           1310 !display 52 honderdtallen    DSP52_3            � �           1311 !display 52 duizendtallen    DSP53_0            � �          1312 !display 53 eenheden    DSP53_1            � �          1313 !display 53 tientallen    DSP53_2            � �           1314 !display 53 honderdtallen    DSP53_3            � �           1315 !display 53 duizendtallen    DSP54_0            � �          1316 !display 54 eenheden    DSP54_1            � �          1317 !display 54 tientallen    DSP54_2            � �           1318 !display 54 honderdtallen    DSP54_3            � �           1319 !display 54 duizendtallen    DSP55_0            � �          1320 !display 55 eenheden    DSP55_1            � �          1321 !display 55 tientallen    DSP55_2            � �           1322 !display 55 honderdtallen    DSP55_3            � �           1323 !display 55 duizendtallen    DSP56_0            � �          1324 !display 56 eenheden    DSP56_1            � �          1325 !display 56 tientallen    DSP56_2            � �           1326 !display 56 honderdtallen    DSP56_3            � �           1327 !display 56 duizendtallen    DSP57_0            � �          1328 !display 57 eenheden    DSP57_1            � �          1329 !display 57 tientallen    DSP57_2            � �           1330 !display 57 honderdtallen    DSP57_3            � �           1331 !display 57 duizendtallen    DSP58_0            � �          1332 !display 58 eenheden    DSP58_1            � �          1333 !display 58 tientallen    DSP58_2            � �           1334 !display 58 honderdtallen    DSP58_3            � �           1335 !display 58 duizendtallen    DSP59_0            � �          1336 !display 59 eenheden    DSP59_1            � �          1337 !display 59 tientallen    DSP59_2            � �           1338 !display 59 honderdtallen    DSP59_3            � �           1339 !display 59 duizendtallen    DSP60_0            � �          1340 !display 60 eenheden    DSP60_1            � �          1341 !display 60 tientallen    DSP60_2            � �           1342 !display 60 honderdtallen    DSP60_3            � �           1343 !display 60 duizendtallen    DSP61_0            � �          1344 !display 61 eenheden    DSP61_1            � �          1345 !display 61 tientallen    DSP61_2            � �           1346 !display 61 honderdtallen    DSP61_3            � �           1347 !display 61 duizendtallen    DSP62_0            � �          1348 !display 62 eenheden    DSP62_1            � �          1349 !display 62 tientallen    DSP62_2            � �           1350 !display 62 honderdtallen    DSP62_3            � �           1351 !display 62 duizendtallen    DSP63_0            � �          1352 !display 63 eenheden    DSP63_1            � �          1353 !display 63 tientallen    DSP63_2            � �           1354 !display 63 honderdtallen    DSP63_3            � �           1355 !display 63 duizendtallen    DSP64_0            � �          1356 !display 64 eenheden    DSP64_1            � �          1357 !display 64 tientallen    DSP64_2            � �           1358 !display 64 honderdtallen    DSP64_3            � �           1359 !display 64 duizendtallen    DSP65_0            � �          1360 !display 65 eenheden    DSP65_1            � �          1361 !display 65 tientallen    DSP65_2            � �           1362 !display 65 honderdtallen    DSP65_3            � �           1363 !display 65 duizendtallen    DSP66_0            � �          1364 !display 66 eenheden    DSP66_1            � �          1365 !display 66 tientallen    DSP66_2            � �           1366 !display 66 honderdtallen    DSP66_3            � �           1367 !display 66 duizendtallen    DSP67_0            � �          1368 !display 67 eenheden    DSP67_1            � �          1369 !display 67 tientallen    DSP67_2            �             1370 !display 67 honderdtallen    DSP67_3            �            1371 !display 67 duizendtallen    DSP68_0            �           1372 !display 68 eenheden    DSP68_1            �           1373 !display 68 tientallen    DSP68_2            �            1374 !display 68 honderdtallen    DSP68_3            �            1375 !display 68 duizendtallen    DSP69_0            �           1376 !display 69 eenheden    DSP69_1            �           1377 !display 69 tientallen    DSP69_2            �            1378 !display 69 honderdtallen    DSP69_3            � 	           1379 !display 69 duizendtallen    DSP70_0            � 
          1380 !display 70 eenheden    DSP70_1            �           1381 !display 70 tientallen    DSP70_2            �            1382 !display 70 honderdtallen    DSP70_3            �            1383 !display 70 duizendtallen    DSP71_0            �           1384 !display 71 eenheden    DSP71_1            �           1385 !display 71 tientallen    DSP71_2            �            1386 !display 71 honderdtallen    DSP71_3            �            1387 !display 71 duizendtallen    DSP72_0            �           1388 !display 72 eenheden    DSP72_1            �           1389 !display 72 tientallen    DSP72_2            �            1390 !display 72 honderdtallen    DSP72_3            �            1391 !display 72 duizendtallen    DSP73_0            �           1392 !display 73 eenheden    DSP73_1            �           1393 !display 73 tientallen    DSP73_2            �            1394 !display 73 honderdtallen    DSP73_3            �            1395 !display 73 duizendtallen    DSP74_0            �           1396 !display 74 eenheden    DSP74_1            �           1397 !display 74 tientallen    DSP74_2            �            1398 !display 74 honderdtallen    DSP74_3            �            1399 !display 74 duizendtallen    DSP75_0            �           1400 !display 75 eenheden    DSP75_1            �           1401 !display 75 tientallen    DSP75_2            �             1402 !display 75 honderdtallen    DSP75_3            � !           1403 !display 75 duizendtallen    DSP76_0            � "          1404 !display 76 eenheden    DSP76_1            � #          1405 !display 76 tientallen    DSP76_2            � $           1406 !display 76 honderdtallen    DSP76_3            � %           1407 !display 76 duizendtallen    DSP77_0            � &          1408 !display 77 eenheden    DSP77_1            � '          1409 !display 77 tientallen    DSP77_2            � (           1410 !display 77 honderdtallen    DSP77_3            � )           1411 !display 77 duizendtallen    DSP78_0            � *          1412 !display 78 eenheden    DSP78_1            � +          1413 !display 78 tientallen    DSP78_2            � ,           1414 !display 78 honderdtallen    DSP78_3            � -           1415 !display 78 duizendtallen    DSP79_0            � .          1416 !display 79 eenheden    DSP79_1            � /          1417 !display 79 tientallen    DSP79_2            � 0           1418 !display 79 honderdtallen    DSP79_3            � 1           1419 !display 79 duizendtallen    DSP80_0            � 2          1420 !display 80 eenheden    DSP80_1            � 3          1421 !display 80 tientallen    DSP80_2            � 4           1422 !display 80 honderdtallen    DSP80_3            � 5           1423 !display 80 duizendtallen    DSP81_0            � 6          1424 !display 81 eenheden    DSP81_1            � 7          1425 !display 81 tientallen    DSP81_2            � 8           1426 !display 81 honderdtallen    DSP81_3            � 9           1427 !display 81 duizendtallen    DSP82_0            � :          1428 !display 82 eenheden    DSP82_1            � ;          1429 !display 82 tientallen    DSP82_2            � <           1430 !display 82 honderdtallen    DSP82_3            � =           1431 !display 82 duizendtallen    DSP83_0            � >          1432 !display 83 eenheden    DSP83_1            � ?          1433 !display 83 tientallen    DSP83_2            � @           1434 !display 83 honderdtallen    DSP83_3            � A           1435 !display 83 duizendtallen    DSP84_0            � B          1436 !display 84 eenheden    DSP84_1            � C          1437 !display 84 tientallen    DSP84_2            � D           1438 !display 84 honderdtallen    DSP84_3            � E           1439 !display 84 duizendtallen    DSP85_0            � F          1440 !display 85 eenheden    DSP85_1            � G          1441 !display 85 tientallen    DSP85_2            � H           1442 !display 85 honderdtallen    DSP85_3            � I           1443 !display 85 duizendtallen    DSP86_0            � J          1444 !display 86 eenheden    DSP86_1            � K          1445 !display 86 tientallen    DSP86_2            � L           1446 !display 86 honderdtallen    DSP86_3            � M           1447 !display 86 duizendtallen    DSP87_0            � N          1448 !display 87 eenheden    DSP87_1            � O          1449 !display 87 tientallen    DSP87_2            � P           1450 !display 87 honderdtallen    DSP87_3            � Q           1451 !display 87 duizendtallen    DSP88_0            � R          1452 !display 88 eenheden    DSP88_1            � S          1453 !display 88 tientallen    DSP88_2            � T           1454 !display 88 honderdtallen    DSP88_3            � U           1455 !display 88 duizendtallen    DSP89_0            � V          1456 !display 89 eenheden    DSP89_1            � W          1457 !display 89 tientallen    DSP89_2            � X           1458 !display 89 honderdtallen    DSP89_3            � Y           1459 !display 89 duizendtallen    DSP90_0            � Z          1460 !display 90 eenheden    DSP90_1            � [          1461 !display 90 tientallen    DSP90_2            � \           1462 !display 90 honderdtallen    DSP90_3            � ]           1463 !display 90 duizendtallen    DSP91_0            � ^          1464 !display 91 eenheden    DSP91_1            � _          1465 !display 91 tientallen    DSP91_2            � `           1466 !display 91 honderdtallen    DSP91_3            � a           1467 !display 91 duizendtallen    DSP92_0            � b          1468 !display 92 eenheden    DSP92_1            � c          1469 !display 92 tientallen    DSP92_2            � d           1470 !display 92 honderdtallen    DSP92_3            � e           1471 !display 92 duizendtallen    DSP93_0            � f          1472 !display 93 eenheden    DSP93_1            � g          1473 !display 93 tientallen    DSP93_2            � h           1474 !display 93 honderdtallen    DSP93_3            � i           1475 !display 93 duizendtallen    DSP94_0            � j          1476 !display 94 eenheden    DSP94_1            � k          1477 !display 94 tientallen    DSP94_2            � l           1478 !display 94 honderdtallen    DSP94_3            � m           1479 !display 94 duizendtallen    DSP95_0            � n          1480 !display 95 eenheden    DSP95_1            � o          1481 !display 95 tientallen    DSP95_2            � p           1482 !display 95 honderdtallen    DSP95_3            � q           1483 !display 95 duizendtallen    DSP96_0            � r          1484 !display 96 eenheden    DSP96_1            � s          1485 !display 96 tientallen    DSP96_2            � t           1486 !display 96 honderdtallen    DSP96_3            � u           1487 !display 96 duizendtallen    DSP97_0            � v          1488 !display 97 eenheden    DSP97_1            � w          1489 !display 97 tientallen    DSP97_2            � x           1490 !display 97 honderdtallen    DSP97_3            � y           1491 !display 97 duizendtallen    DSP98_0            � z          1492 !display 98 eenheden    DSP98_1            � {          1493 !display 98 tientallen    DSP98_2            � |           1494 !display 98 honderdtallen    DSP98_3            � }           1495 !display 98 duizendtallen    DSP99_0            � ~          1496 !display 99 eenheden    DSP99_1            �           1497 !display 99 tientallen    DSP99_2            � �           1498 !display 99 honderdtallen    DSP99_3            � �           1499 !display 99 duizendtallen    constante_0            � �          1500 !constante 0    constante_1            � �          1501 !constante 1    constante_2            � �          1502 !constante 2    constante_3            � �          1503 !constante 3    constante_4            � �          1504 !constante 4    constante_5            � �          1505 !constante 5    constante_6            � �          1506 !constante 6    constante_7            � �          1507 !constante 7    constante_8            � �          1508 !constante 8    constante_9            � �          1509 !constante 9    unnamed_1510            � �          1510     unnamed_1511            � �          1511     STP00_0            � �          2000 !setpoint 00 eenheden    STP00_1            � �          2001 !setpoint 00 tientallen    STP00_2            � �      !    2002 !setpoint 00 honderdtallen    STP00_3            � �      !    2003 !setpoint 00 duizendtallen    STP01_0            � �          2004 !setpoint 01 eenheden    STP01_1            � �          2005 !setpoint 01 tientallen    STP01_2            � �      !    2006 !setpoint 01 honderdtallen    STP01_3            � �      !    2007 !setpoint 01 duizendtallen    STP02_0            � �          2008 !setpoint 02 eenheden    STP02_1            � �          2009 !setpoint 02 tientallen    STP02_2            � �      !    2010 !setpoint 02 honderdtallen    STP02_3            � �      !    2011 !setpoint 02 duizendtallen    STP03_0            � �          2012 !setpoint 03 eenheden    STP03_1            � �          2013 !setpoint 03 tientallen    STP03_2            � �      !    2014 !setpoint 03 honderdtallen    STP03_3            � �      !    2015 !setpoint 03 duizendtallen    STP04_0            � �          2016 !setpoint 04 eenheden    STP04_1            � �          2017 !setpoint 04 tientallen    STP04_2            � �      !    2018 !setpoint 04 honderdtallen    STP04_3            � �      !    2019 !setpoint 04 duizendtallen    STP05_0            � �          2020 !setpoint 05 eenheden    STP05_1            � �          2021 !setpoint 05 tientallen    STP05_2            � �      !    2022 !setpoint 05 honderdtallen    STP05_3            � �      !    2023 !setpoint 05 duizendtallen    STP06_0            � �          2024 !setpoint 06 eenheden    STP06_1            � �          2025 !setpoint 06 tientallen    STP06_2            � �      !    2026 !setpoint 06 honderdtallen    STP06_3            � �      !    2027 !setpoint 06 duizendtallen    STP07_0            � �          2028 !setpoint 07 eenheden    STP07_1            � �          2029 !setpoint 07 tientallen    STP07_2            � �      !    2030 !setpoint 07 honderdtallen    STP07_3            � �      !    2031 !setpoint 07 duizendtallen    STP08_0            � �          2032 !setpoint 08 eenheden    STP08_1            � �          2033 !setpoint 08 tientallen    STP08_2            � �      !    2034 !setpoint 08 honderdtallen    STP08_3            � �      !    2035 !setpoint 08 duizendtallen    STP09_0            � �          2036 !setpoint 09 eenheden    STP09_1            � �          2037 !setpoint 09 tientallen    STP09_2            � �      !    2038 !setpoint 09 honderdtallen    STP09_3            � �      !    2039 !setpoint 09 duizendtallen    STP10_0            � �          2040 !setpoint 10 eenheden    STP10_1            � �          2041 !setpoint 10 tientallen    STP10_2            � �      !    2042 !setpoint 10 honderdtallen    STP10_3            � �      !    2043 !setpoint 10 duizendtallen    STP11_0            � �          2044 !setpoint 11 eenheden    STP11_1            � �          2045 !setpoint 11 tientallen    STP11_2            � �      !    2046 !setpoint 11 honderdtallen    STP11_3            � �      !    2047 !setpoint 11 duizendtallen    STP12_0            � �          2048 !setpoint 12 eenheden    STP12_1            � �          2049 !setpoint 12 tientallen    STP12_2            � �      !    2050 !setpoint 12 honderdtallen    STP12_3            � �      !    2051 !setpoint 12 duizendtallen    STP13_0            � �          2052 !setpoint 13 eenheden    STP13_1            � �          2053 !setpoint 13 tientallen    STP13_2            � �      !    2054 !setpoint 13 honderdtallen    STP13_3            � �      !    2055 !setpoint 13 duizendtallen    STP14_0            � �          2056 !setpoint 14 eenheden    STP14_1            � �          2057 !setpoint 14 tientallen    STP14_2            � �      !    2058 !setpoint 14 honderdtallen    STP14_3            � �      !    2059 !setpoint 14 duizendtallen    STP15_0            � �          2060 !setpoint 15 eenheden    STP15_1            � �          2061 !setpoint 15 tientallen    STP15_2            � �      !    2062 !setpoint 15 honderdtallen    STP15_3            � �      !    2063 !setpoint 15 duizendtallen    STP16_0            � �          2064 !setpoint 16 eenheden    STP16_1            � �          2065 !setpoint 16 tientallen    STP16_2            � �      !    2066 !setpoint 16 honderdtallen    STP16_3            � �      !    2067 !setpoint 16 duizendtallen    STP17_0            � �          2068 !setpoint 17 eenheden    STP17_1            � �          2069 !setpoint 17 tientallen    STP17_2            � �      !    2070 !setpoint 17 honderdtallen    STP17_3            � �      !    2071 !setpoint 17 duizendtallen    STP18_0            � �          2072 !setpoint 18 eenheden    STP18_1            � �          2073 !setpoint 18 tientallen    STP18_2            � �      !    2074 !setpoint 18 honderdtallen    STP18_3            � �      !    2075 !setpoint 18 duizendtallen    STP19_0            � �          2076 !setpoint 19 eenheden    STP19_1            � �          2077 !setpoint 19 tientallen    STP19_2            � �      !    2078 !setpoint 19 honderdtallen    STP19_3            � �      !    2079 !setpoint 19 duizendtallen    STP20_0            � �          2080 !setpoint 20 eenheden    STP20_1            � �          2081 !setpoint 20 tientallen    STP20_2            � �      !    2082 !setpoint 20 honderdtallen    STP20_3            � �      !    2083 !setpoint 20 duizendtallen    STP21_0            � �          2084 !setpoint 21 eenheden    STP21_1            � �          2085 !setpoint 21 tientallen    STP21_2            � �      !    2086 !setpoint 21 honderdtallen    STP21_3            � �      !    2087 !setpoint 21 duizendtallen    STP22_0            � �          2088 !setpoint 22 eenheden    STP22_1            � �          2089 !setpoint 22 tientallen    STP22_2            � �      !    2090 !setpoint 22 honderdtallen    STP22_3            � �      !    2091 !setpoint 22 duizendtallen    STP23_0            � �          2092 !setpoint 23 eenheden    STP23_1            � �          2093 !setpoint 23 tientallen    STP23_2            � �      !    2094 !setpoint 23 honderdtallen    STP23_3            � �      !    2095 !setpoint 23 duizendtallen    STP24_0            � �          2096 !setpoint 24 eenheden    STP24_1            � �          2097 !setpoint 24 tientallen    STP24_2            � �      !    2098 !setpoint 24 honderdtallen    STP24_3            � �      !    2099 !setpoint 24 duizendtallen    STP25_0            � �          2100 !setpoint 25 eenheden    STP25_1            � �          2101 !setpoint 25 tientallen    STP25_2            � �      !    2102 !setpoint 25 honderdtallen    STP25_3            � �      !    2103 !setpoint 25 duizendtallen    STP26_0            � �          2104 !setpoint 26 eenheden    STP26_1            � �          2105 !setpoint 26 tientallen    STP26_2            � �      !    2106 !setpoint 26 honderdtallen    STP26_3            � �      !    2107 !setpoint 26 duizendtallen    STP27_0            � �          2108 !setpoint 27 eenheden    STP27_1            � �          2109 !setpoint 27 tientallen    STP27_2            � �      !    2110 !setpoint 27 honderdtallen    STP27_3            � �      !    2111 !setpoint 27 duizendtallen    STP28_0            � �          2112 !setpoint 28 eenheden    STP28_1            � �          2113 !setpoint 28 tientallen    STP28_2            �        !    2114 !setpoint 28 honderdtallen    STP28_3            �       !    2115 !setpoint 28 duizendtallen    STP29_0            �           2116 !setpoint 29 eenheden    STP29_1            �           2117 !setpoint 29 tientallen    STP29_2            �       !    2118 !setpoint 29 honderdtallen    STP29_3            �       !    2119 !setpoint 29 duizendtallen    STP30_0            �           2120 !setpoint 30 eenheden    STP30_1            �           2121 !setpoint 30 tientallen    STP30_2            �       !    2122 !setpoint 30 honderdtallen    STP30_3            � 	      !    2123 !setpoint 30 duizendtallen    STP31_0            � 
          2124 !setpoint 31 eenheden    STP31_1            �           2125 !setpoint 31 tientallen    STP31_2            �       !    2126 !setpoint 31 honderdtallen    STP31_3            �       !    2127 !setpoint 31 duizendtallen    STP32_0            �           2128 !setpoint 32 eenheden    STP32_1            �           2129 !setpoint 32 tientallen    STP32_2            �       !    2130 !setpoint 32 honderdtallen    STP32_3            �       !    2131 !setpoint 32 duizendtallen    STP33_0            �           2132 !setpoint 33 eenheden    STP33_1            �           2133 !setpoint 33 tientallen    STP33_2            �       !    2134 !setpoint 33 honderdtallen    STP33_3            �       !    2135 !setpoint 33 duizendtallen    STP34_0            �           2136 !setpoint 34 eenheden    STP34_1            �           2137 !setpoint 34 tientallen    STP34_2            �       !    2138 !setpoint 34 honderdtallen    STP34_3            �       !    2139 !setpoint 34 duizendtallen    STP35_0            �           2140 !setpoint 35 eenheden    STP35_1            �           2141 !setpoint 35 tientallen    STP35_2            �       !    2142 !setpoint 35 honderdtallen    STP35_3            �       !    2143 !setpoint 35 duizendtallen    STP36_0            �           2144 !setpoint 36 eenheden    STP36_1            �           2145 !setpoint 36 tientallen    STP36_2            �        !    2146 !setpoint 36 honderdtallen    STP36_3            � !      !    2147 !setpoint 36 duizendtallen    STP37_0            � "          2148 !setpoint 37 eenheden    STP37_1            � #          2149 !setpoint 37 tientallen    STP37_2            � $      !    2150 !setpoint 37 honderdtallen    STP37_3            � %      !    2151 !setpoint 37 duizendtallen    STP38_0            � &          2152 !setpoint 38 eenheden    STP38_1            � '          2153 !setpoint 38 tientallen    STP38_2            � (      !    2154 !setpoint 38 honderdtallen    STP38_3            � )      !    2155 !setpoint 38 duizendtallen    STP39_0            � *          2156 !setpoint 39 eenheden    STP39_1            � +          2157 !setpoint 39 tientallen    STP39_2            � ,      !    2158 !setpoint 39 honderdtallen    STP39_3            � -      !    2159 !setpoint 39 duizendtallen    STP40_0            � .          2160 !setpoint 40 eenheden    STP40_1            � /          2161 !setpoint 40 tientallen    STP40_2            � 0      !    2162 !setpoint 40 honderdtallen    STP40_3            � 1      !    2163 !setpoint 40 duizendtallen    STP41_0            � 2          2164 !setpoint 41 eenheden    STP41_1            � 3          2165 !setpoint 41 tientallen    STP41_2            � 4      !    2166 !setpoint 41 honderdtallen    STP41_3            � 5      !    2167 !setpoint 41 duizendtallen    STP42_0            � 6          2168 !setpoint 42 eenheden    STP42_1            � 7          2169 !setpoint 42 tientallen    STP42_2            � 8      !    2170 !setpoint 42 honderdtallen    STP42_3            � 9      !    2171 !setpoint 42 duizendtallen    STP43_0            � :          2172 !setpoint 43 eenheden    STP43_1            � ;          2173 !setpoint 43 tientallen    STP43_2            � <      !    2174 !setpoint 43 honderdtallen    STP43_3            � =      !    2175 !setpoint 43 duizendtallen    STP44_0            � >          2176 !setpoint 44 eenheden    STP44_1            � ?          2177 !setpoint 44 tientallen    STP44_2            � @      !    2178 !setpoint 44 honderdtallen    STP44_3            � A      !    2179 !setpoint 44 duizendtallen    STP45_0            � B          2180 !setpoint 45 eenheden    STP45_1            � C          2181 !setpoint 45 tientallen    STP45_2            � D      !    2182 !setpoint 45 honderdtallen    STP45_3            � E      !    2183 !setpoint 45 duizendtallen    STP46_0            � F          2184 !setpoint 46 eenheden    STP46_1            � G          2185 !setpoint 46 tientallen    STP46_2            � H      !    2186 !setpoint 46 honderdtallen    STP46_3            � I      !    2187 !setpoint 46 duizendtallen    STP47_0            � J          2188 !setpoint 47 eenheden    STP47_1            � K          2189 !setpoint 47 tientallen    STP47_2            � L      !    2190 !setpoint 47 honderdtallen    STP47_3            � M      !    2191 !setpoint 47 duizendtallen    STP48_0            � N          2192 !setpoint 48 eenheden    STP48_1            � O          2193 !setpoint 48 tientallen    STP48_2            � P      !    2194 !setpoint 48 honderdtallen    STP48_3            � Q      !    2195 !setpoint 48 duizendtallen    STP49_0            � R          2196 !setpoint 49 eenheden    STP49_1            � S          2197 !setpoint 49 tientallen    STP49_2            � T      !    2198 !setpoint 49 honderdtallen    STP49_3            � U      !    2199 !setpoint 49 duizendtallen    STP50_0            � V          2200 !setpoint 50 eenheden    STP50_1            � W          2201 !setpoint 50 tientallen    STP50_2            � X      !    2202 !setpoint 50 honderdtallen    STP50_3            � Y      !    2203 !setpoint 50 duizendtallen    STP51_0            � Z          2204 !setpoint 51 eenheden    STP51_1            � [          2205 !setpoint 51 tientallen    STP51_2            � \      !    2206 !setpoint 51 honderdtallen    STP51_3            � ]      !    2207 !setpoint 51 duizendtallen    STP52_0            � ^          2208 !setpoint 52 eenheden    STP52_1            � _          2209 !setpoint 52 tientallen    STP52_2            � `      !    2210 !setpoint 52 honderdtallen    STP52_3            � a      !    2211 !setpoint 52 duizendtallen    STP53_0            � b          2212 !setpoint 53 eenheden    STP53_1            � c          2213 !setpoint 53 tientallen    STP53_2            � d      !    2214 !setpoint 53 honderdtallen    STP53_3            � e      !    2215 !setpoint 53 duizendtallen    STP54_0            � f          2216 !setpoint 54 eenheden    STP54_1            � g          2217 !setpoint 54 tientallen    STP54_2            � h      !    2218 !setpoint 54 honderdtallen    STP54_3            � i      !    2219 !setpoint 54 duizendtallen    STP55_0            � j          2220 !setpoint 55 eenheden    STP55_1            � k          2221 !setpoint 55 tientallen    STP55_2            � l      !    2222 !setpoint 55 honderdtallen    STP55_3            � m      !    2223 !setpoint 55 duizendtallen    STP56_0            � n          2224 !setpoint 56 eenheden    STP56_1            � o          2225 !setpoint 56 tientallen    STP56_2            � p      !    2226 !setpoint 56 honderdtallen    STP56_3            � q      !    2227 !setpoint 56 duizendtallen    STP57_0            � r          2228 !setpoint 57 eenheden    STP57_1            � s          2229 !setpoint 57 tientallen    STP57_2            � t      !    2230 !setpoint 57 honderdtallen    STP57_3            � u      !    2231 !setpoint 57 duizendtallen    STP58_0            � v          2232 !setpoint 58 eenheden    STP58_1            � w          2233 !setpoint 58 tientallen    STP58_2            � x      !    2234 !setpoint 58 honderdtallen    STP58_3            � y      !    2235 !setpoint 58 duizendtallen    STP59_0            � z          2236 !setpoint 59 eenheden    STP59_1            � {          2237 !setpoint 59 tientallen    STP59_2            � |      !    2238 !setpoint 59 honderdtallen    STP59_3            � }      !    2239 !setpoint 59 duizendtallen    STP60_0            � ~          2240 !setpoint 60 eenheden    STP60_1            �           2241 !setpoint 60 tientallen    STP60_2            � �      !    2242 !setpoint 60 honderdtallen    STP60_3            � �      !    2243 !setpoint 60 duizendtallen    STP61_0            � �          2244 !setpoint 61 eenheden    STP61_1            � �          2245 !setpoint 61 tientallen    STP61_2            � �      !    2246 !setpoint 61 honderdtallen    STP61_3            � �      !    2247 !setpoint 61 duizendtallen    STP62_0            � �          2248 !setpoint 62 eenheden    STP62_1            � �          2249 !setpoint 62 tientallen    STP62_2            � �      !    2250 !setpoint 62 honderdtallen    STP62_3            � �      !    2251 !setpoint 62 duizendtallen    STP63_0            � �          2252 !setpoint 63 eenheden    STP63_1            � �          2253 !setpoint 63 tientallen    STP63_2            � �      !    2254 !setpoint 63 honderdtallen    STP63_3            � �      !    2255 !setpoint 63 duizendtallen    STP64_0            � �          2256 !setpoint 64 eenheden    STP64_1            � �          2257 !setpoint 64 tientallen    STP64_2            � �      !    2258 !setpoint 64 honderdtallen    STP64_3            � �      !    2259 !setpoint 64 duizendtallen    STP65_0            � �          2260 !setpoint 65 eenheden    STP65_1            � �          2261 !setpoint 65 tientallen    STP65_2            � �      !    2262 !setpoint 65 honderdtallen    STP65_3            � �      !    2263 !setpoint 65 duizendtallen    STP66_0            � �          2264 !setpoint 66 eenheden    STP66_1            � �          2265 !setpoint 66 tientallen    STP66_2            � �      !    2266 !setpoint 66 honderdtallen    STP66_3            � �      !    2267 !setpoint 66 duizendtallen    STP67_0            � �          2268 !setpoint 67 eenheden    STP67_1            � �          2269 !setpoint 67 tientallen    STP67_2            � �      !    2270 !setpoint 67 honderdtallen    STP67_3            � �      !    2271 !setpoint 67 duizendtallen    STP68_0            � �          2272 !setpoint 68 eenheden    STP68_1            � �          2273 !setpoint 68 tientallen    STP68_2            � �      !    2274 !setpoint 68 honderdtallen    STP68_3            � �      !    2275 !setpoint 68 duizendtallen    STP69_0            � �          2276 !setpoint 69 eenheden    STP69_1            � �          2277 !setpoint 69 tientallen    STP69_2            � �      !    2278 !setpoint 69 honderdtallen    STP69_3            � �      !    2279 !setpoint 69 duizendtallen    STP70_0            � �          2280 !setpoint 70 eenheden    STP70_1            � �          2281 !setpoint 70 tientallen    STP70_2            � �      !    2282 !setpoint 70 honderdtallen    STP70_3            � �      !    2283 !setpoint 70 duizendtallen    STP71_0            � �          2284 !setpoint 71 eenheden    STP71_1            � �          2285 !setpoint 71 tientallen    STP71_2            � �      !    2286 !setpoint 71 honderdtallen    STP71_3            � �      !    2287 !setpoint 71 duizendtallen    STP72_0            � �          2288 !setpoint 72 eenheden    STP72_1            � �          2289 !setpoint 72 tientallen    STP72_2            � �      !    2290 !setpoint 72 honderdtallen    STP72_3            � �      !    2291 !setpoint 72 duizendtallen    STP73_0            � �          2292 !setpoint 73 eenheden    STP73_1            � �          2293 !setpoint 73 tientallen    STP73_2            � �      !    2294 !setpoint 73 honderdtallen    STP73_3            � �      !    2295 !setpoint 73 duizendtallen    STP74_0            � �          2296 !setpoint 74 eenheden    STP74_1            � �          2297 !setpoint 74 tientallen    STP74_2            � �      !    2298 !setpoint 74 honderdtallen    STP74_3            � �      !    2299 !setpoint 74 duizendtallen    STP75_0            � �          2300 !setpoint 75 eenheden    STP75_1            � �          2301 !setpoint 75 tientallen    STP75_2            � �      !    2302 !setpoint 75 honderdtallen    STP75_3            � �      !    2303 !setpoint 75 duizendtallen    STP76_0            � �          2304 !setpoint 76 eenheden    STP76_1            � �          2305 !setpoint 76 tientallen    STP76_2            � �      !    2306 !setpoint 76 honderdtallen    STP76_3            � �      !    2307 !setpoint 76 duizendtallen    STP77_0            � �          2308 !setpoint 77 eenheden    STP77_1            � �          2309 !setpoint 77 tientallen    STP77_2            � �      !    2310 !setpoint 77 honderdtallen    STP77_3            � �      !    2311 !setpoint 77 duizendtallen    STP78_0            � �          2312 !setpoint 78 eenheden    STP78_1            � �          2313 !setpoint 78 tientallen    STP78_2            � �      !    2314 !setpoint 78 honderdtallen    STP78_3            � �      !    2315 !setpoint 78 duizendtallen    STP79_0            � �          2316 !setpoint 79 eenheden    STP79_1            � �          2317 !setpoint 79 tientallen    STP79_2            � �      !    2318 !setpoint 79 honderdtallen    STP79_3            � �      !    2319 !setpoint 79 duizendtallen    STP80_0            � �          2320 !setpoint 80 eenheden    STP80_1            � �          2321 !setpoint 80 tientallen    STP80_2            � �      !    2322 !setpoint 80 honderdtallen    STP80_3            � �      !    2323 !setpoint 80 duizendtallen    STP81_0            � �          2324 !setpoint 81 eenheden    STP81_1            � �          2325 !setpoint 81 tientallen    STP81_2            � �      !    2326 !setpoint 81 honderdtallen    STP81_3            � �      !    2327 !setpoint 81 duizendtallen    STP82_0            � �          2328 !setpoint 82 eenheden    STP82_1            � �          2329 !setpoint 82 tientallen    STP82_2            � �      !    2330 !setpoint 82 honderdtallen    STP82_3            � �      !    2331 !setpoint 82 duizendtallen    STP83_0            � �          2332 !setpoint 83 eenheden    STP83_1            � �          2333 !setpoint 83 tientallen    STP83_2            � �      !    2334 !setpoint 83 honderdtallen    STP83_3            � �      !    2335 !setpoint 83 duizendtallen    STP84_0            � �          2336 !setpoint 84 eenheden    STP84_1            � �          2337 !setpoint 84 tientallen    STP84_2            � �      !    2338 !setpoint 84 honderdtallen    STP84_3            � �      !    2339 !setpoint 84 duizendtallen    STP85_0            � �          2340 !setpoint 85 eenheden    STP85_1            � �          2341 !setpoint 85 tientallen    STP85_2            � �      !    2342 !setpoint 85 honderdtallen    STP85_3            � �      !    2343 !setpoint 85 duizendtallen    STP86_0            � �          2344 !setpoint 86 eenheden    STP86_1            � �          2345 !setpoint 86 tientallen    STP86_2            � �      !    2346 !setpoint 86 honderdtallen    STP86_3            � �      !    2347 !setpoint 86 duizendtallen    STP87_0            � �          2348 !setpoint 87 eenheden    STP87_1            � �          2349 !setpoint 87 tientallen    STP87_2            � �      !    2350 !setpoint 87 honderdtallen    STP87_3            � �      !    2351 !setpoint 87 duizendtallen    STP88_0            � �          2352 !setpoint 88 eenheden    STP88_1            � �          2353 !setpoint 88 tientallen    STP88_2            � �      !    2354 !setpoint 88 honderdtallen    STP88_3            � �      !    2355 !setpoint 88 duizendtallen    STP89_0            � �          2356 !setpoint 89 eenheden    STP89_1            � �          2357 !setpoint 89 tientallen    STP89_2            � �      !    2358 !setpoint 89 honderdtallen    STP89_3            � �      !    2359 !setpoint 89 duizendtallen    STP90_0            � �          2360 !setpoint 90 eenheden    STP90_1            � �          2361 !setpoint 90 tientallen    STP90_2            � �      !    2362 !setpoint 90 honderdtallen    STP90_3            � �      !    2363 !setpoint 90 duizendtallen    STP91_0            � �          2364 !setpoint 91 eenheden    STP91_1            � �          2365 !setpoint 91 tientallen    STP91_2            � �      !    2366 !setpoint 91 honderdtallen    STP91_3            � �      !    2367 !setpoint 91 duizendtallen    STP92_0            � �          2368 !setpoint 92 eenheden    STP92_1            � �          2369 !setpoint 92 tientallen    STP92_2            �        !    2370 !setpoint 92 honderdtallen    STP92_3            �       !    2371 !setpoint 92 duizendtallen    STP93_0            �           2372 !setpoint 93 eenheden    STP93_1            �           2373 !setpoint 93 tientallen    STP93_2            �       !    2374 !setpoint 93 honderdtallen    STP93_3            �       !    2375 !setpoint 93 duizendtallen    STP94_0            �           2376 !setpoint 94 eenheden    STP94_1            �           2377 !setpoint 94 tientallen    STP94_2            �       !    2378 !setpoint 94 honderdtallen    STP94_3            � 	      !    2379 !setpoint 94 duizendtallen    STP95_0            � 
          2380 !setpoint 95 eenheden    STP95_1            �           2381 !setpoint 95 tientallen    STP95_2            �       !    2382 !setpoint 95 honderdtallen    STP95_3            �       !    2383 !setpoint 95 duizendtallen    STP96_0            �           2384 !setpoint 96 eenheden    STP96_1            �           2385 !setpoint 96 tientallen    STP96_2            �       !    2386 !setpoint 96 honderdtallen    STP96_3            �       !    2387 !setpoint 96 duizendtallen    STP97_0            �           2388 !setpoint 97 eenheden    STP97_1            �           2389 !setpoint 97 tientallen    STP97_2            �       !    2390 !setpoint 97 honderdtallen    STP97_3            �       !    2391 !setpoint 97 duizendtallen    STP98_0            �           2392 !setpoint 98 eenheden    STP98_1            �           2393 !setpoint 98 tientallen    STP98_2            �       !    2394 !setpoint 98 honderdtallen    STP98_3            �       !    2395 !setpoint 98 duizendtallen    STP99_0            �           2396 !setpoint 99 eenheden    STP99_1            �           2397 !setpoint 99 tientallen    STP99_2            �       !    2398 !setpoint 99 honderdtallen    STP99_3            �       !    2399 !setpoint 99 duizendtallen    EENTIM88            �       %    2400 !eenh. 1 min. timer in fase 88    TIETIM88            �       &    2401 !tient. 1 min. timer in fase 88    ST2BU01            �            2501 !storingscode lichtkrant    ST3BU01            � !      	    2502 !+    BD0T00            � "          2503     BD0T01            � #          2504     RE0T00            � $      	    2505 !+    RE0T01            � %          2506 !| uur timer    RE0T02            � &      	    2507 !|    RE0T03            � '      	    2508 !+    RE1T00            � (      	    2509 !+    RE1T01            � )      0    2510 !+ tijdvertr. detectieschakelaar CMF gevu    unnamed_2511            � *          2511     ClockState_10s             � +      $    510.2 Trigger state for 10s. pulse    TRIGGER_ClockState_10s               
   BitTrigger    � .      '    00510.2  Trigger state for 10s. pulse                     �'x[  @    ����           PLC_PRG                             ��Z  @    ����           TTIMER            	   Condition            �           *< Starts the timer    Setpoint           �           *< Count to start       RemainingCount           �                        �#q[  @    ����           WRITEBIT               pBit                  �           *< AddressValue of the target    bValue            �           *< Value to equalize bit to       WriteBit                                      ,q[  @    ����        
   WRITEVALUE               pValue                 �           *< Pointer to value to write    Value           �        $   *< Value to store into the variable    
   WriteValue                                      ��q[  @    ����            
 �   �   �   �   �   �   1   �   �   ,   �   /   ( �     K   �    K   �    K   +�    K   @�                M�        +     ��localhost  �\�v4  ��I��� @� (Q��         �                     �  � ɯ  ������   ��@   ���?      �    ɯ  1]E l� �%� p||� ���     �� Pu�          ɯ  1]E 4       ɯ  1]E �� �%� p|�� ��� 	   Pu�� v��                  0u���     b  b      AUX)K^�� PWW�            Ethernet_TCP_IP  SoftPLC___ WAGO Ethernet TCP/IP driver    =   �  IP address Target node IP address 
   192.168.20.249 <   �  Port number Target node port number    �	      ��  O   �  Transport protocol Transport protocol used               tcp    udp :   �  Debug level always 0, for internal use only      <         �      Q�s/����� `��S            Serial (RS232)  SoftPLC__ 3S Serial RS232 driver    Q  �  Port                COM1    COM2    COM3    COM4    COM5    COM6    COM7    COM8    COM9 	   COM10 
   COM11    COM12    COM13    COM14    COM15    COM16    COM17    COM18    COM19    COM20    COM21    COM22    COM23    COM24    COM25    COM26    COM27    COM28    COM29    COM30    COM31    COM32 Y   �  Baudrate      K     �  4800 �%  9600  K  19200  �  38400  �  57600  � 115200 4   �  Parity               No    Even    Odd 3   �  Stop bits                1    1,5    2 7   d   Motorola byteorder                No    Yes 1   �  Flow Control                Off    On b      AUX)K^�� PWW�            Ethernet_TCP_IP  SoftPLC___ WAGO Ethernet TCP/IP driver    =   �  IP address Target node IP address 
   192.168.20.249 <   �  Port number Target node port number    �	      ��  O   �  Transport protocol Transport protocol used               tcp    udp :   �  Debug level always 0, for internal use only        K        @   ��Z�,     , ��                     CoDeSys 1-2.2   ����  ��������                     �.  r       �      
   �         �         �          �                    "          $                                                   '          (          �          �          �          �          �         �          �          �          �         �          �          �          �          �         �      �   �       P  �          �         �       �  �                    ~          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �       @  �       @  �       @  �       @  �       @  �       @  �         �         �          �       �  M         N          O          P          `         a          t          y          z          b         c          X          d         e         _          Q          \         R          K          U         X         Z         �          �         �      
   �         �         �         �         �         �          �          �         �      �����          �          �      (                                                                        "         !          #          $         �          ^          f         g          h          i          j          k         F          H         J         L          N         P         R          U         S          T          V          W          �          �          l          o          p          q          r          s         u          �          v         �          �      ����|         ~         �         x          z      (   �          �         %         �          �          �         @         �          �          �         &          �          	                   �          �          �         �          �         �          �          �          �          �          �          �          �          �          �          �          �                            I         J         K          	          L         M          �                             �          P         Q          S          )          	          	          �           	          +	       @  ,	       @  -	      ����Z	      ����[	      ��������        ���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������.  �         �         �          �                    "          $                                                   '          (          �          �          �          �          �         �         �       @  �          �          �         �         �          t          y          z          X          e         _         \         K          U        CAN;UDPX         Z         �          �         �      
   �         �         �         �         �         �          �          �         �      �����          �          �      (                                                                        "         !          #          $         �          g          h          i          j          k          F          H         J         L          N         P         R          U         S          T          V          W          �          o          p          q          r          s         u          �          v         �         |         ~         �         x          z      (   �          %         �          �          �         @         �          �      �  �      �  �          �         &          �          	                   �          �          �         �          �         �          �          �          �          �          �          �          �          �          �          �         �                                      I         J         K          	          L         M          �                   �          P         Q          )          	          	          �           	          +	       @  ,	       @  -	      ����Z	      ����[	      ��������        �����.  �         �         �          �                    "          $                                                   '          (          �          �          �          �          �         �         �       @  �          �          �         �         �          t          y          z          X          e         _         \         K          U        CAN;UDPX         Z         �          �         �      
   �         �         �         �         �         �          �          �         �      �����          �          �      (                                                                        "         !          #          $         �          g          h          i          j          k          F          H         J         L          N         P         R          U         S          T          V          W          �          o          p          q          r          s         u          �          v         �         |         ~         �         x          z      (   �          %         �          �          �         @         �          �      �  �      �  �          �         &          �          	                   �          �          �         �          �         �          �          �          �          �          �          �          �          �          �          �         �                                      I         J         K          	          L         M          �                   �          P         Q          )          	          	          �           	          +	       @  ,	       @  -	      ����Z	      ����[	      ��������        �����.  �         �         �          �                    "          $                                                   '          (          �          �          �          �          �         �          �          �          �         �          �          �          �          �         �      �   �       P  �          �         �       �  �          �         0�       � �          �       @  �      �  �         a          t          y          z          b          c          X          d         e         _         \         R          K          U        UDPX         Z         �          �         �      
   �         �         �         �         �         �          �          �         �      �����          �          �      (   "          #         $          �          g          h          i          j          k         F          H         J         L          N         P         R          U         S          T          V          W          �          o          p          q          r          s          u          �          v         w          �         |         ~         �         x          z      (   �          %         �          �          �         @         �          �         �      X  �          �         &        ���          	                   �          �          �         �          �         �          �          �          �          �          �          �          �          �          �          �          �         �          �          �                                                           I         J         K          	          L         M          �                             �          P         Q          S          )          	          	          �           	          +	       @  ,	       @  -	      ����Z	      ����[	      ��������        �����.  �         �         �          �                    "          $                                                   '          (          �          �          �          �          �         �         �       @  �          �          �         �         �          t          y          z          X          e         _         \         K          U        CAN;UDPX         Z         �          �         �      
   �         �         �         �         �         �          �          �         �      �����          �          �      (                                                                        "         !          #          $         �          g          h          i          j          k          F          H         J         L          N         P         R          U         S          T          V          W          �          o          p          q          r          s         u          �          v         �         |         ~         �         x          z      (   �          %         �          �          �         @         �          �      �  �      �  �          �         &          �          	                   �          �          �         �          �         �          �          �          �          �          �          �          �          �          �          �         �                                      I         J         K          	          L         M          �                   �          P         Q          )          	          	          �           	          +	       @  ,	       @  -	      ����Z	      ����[	      ��������        �����.  �         �         �          �                    "          $                                                   '          (          �          �          �          �          �         �         �       @  �          �          �         �         �          t          y          z          X          e         _         \         K          U        CAN;UDPX         Z         �          �         �      
   �         �         �         �         �         �          �          �         �      �����          �          �      (                                                                        "         !          #          $         �          g          h          i          j          k          F          H         J         L          N         P         R          U         S          T          V          W          �          o          p          q          r          s         u          �          v         �         |         ~         �         x          z      (   �          %         �          �          �         @         �          �      �  �      �  �          �         &          �          	                   �          �          �         �          �         �          �          �          �          �          �          �          �          �          �          �         �                                      I         J         K          	          L         M          �                   �          P         Q          )          	          	          �           	          +	       @  ,	       @  -	      ����Z	      ����[	      ��������        �����.  �         �         �          �                    "          $                                                   '          (          �          �          �          �          �         �         �       @  �          �          �         �      3   �          t          y          z          X          e         _         \         K          U        CAN;UDPX         Z         �          �         �      
   �         �         �         �         �         �          �          �         �      �����          �          �      (                                                                        "         !          #          $         �          g          h          i          j          k          F          H         J         L          N         P         R          U         S          T          V          W          �          o          p          q          r          s         u          �          v         �         |         ~         �         x          z      (   �          %         �          �          �         @         �          �      �  �      �  �          �         &          �          	                   �          �          �         �          �         �          �          �          �          �          �          �          �          �          �          �         �                                      I         J         K          	          L         M          �                   �          P         Q          )          	          	          �           	          +	       @  ,	       @  -	      ����Z	      ����[	      ��������        �����.  �         �         �          �                    "          $                                                   '          (          �          �          �          �          �         �         �       @  �          �          �         �         �          t          y          z          X          e         _         \         K          U        CAN;UDPX         Z         �          �         �      
   �         �         �         �         �         �          �          �         �      �����          �          �      (                                                                        "         !          #          $         �          g          h          i          j          k          F          H         J         L          N         P         R          U         S          T          V          W          �          o          p          q          r          s         u          �          v         �         |         ~         �         x          z      (   �          %         �          �          �         @         �          �      �  �      �  �          �         &          �          	                   �          �          �         �          �         �          �          �          �          �          �          �          �          �          �          �         �                                      I         J         K          	          L         M          �                   �          P         Q          )          	          	          �           	          +	       @  ,	       @  -	      ����Z	      ����[	      ��������        �����.  �         �         �          �                    "          $                                                   '          (          �          �          �          �          �         �          �          �          �         �          �          �          �          �         �      �   �       P  �          �         �       �  �          �         0�       � �          �       @  �      �  �         a          t          y          z          b          c          X          d         e         _         \         R          K          U        UDPX         Z         �          �         �      
   �         �         �         �         �         �          �          �         �      �����          �          �      (   "          #         $          �          g          h          i          j          k         F          H         J         L          N         P         R          U         S          T          V          W          �          o          p          q          r          s          u          �          v         w          �         |         ~         �         x          z      (   �          %         �          �          �         @         �          �         �      X  �          �         &        ���          	                   �          �          �         �          �         �          �          �          �          �          �          �          �          �          �          �          �         �          �          �                                                           I         J         K          	          L         M          �                             �          P         Q          S          )          	          	          �           	          +	       @  ,	       @  -	      ����Z	      ����[	      ��������        �����.  �         �         �          �                    "          $                                                   '          (          �          �          �          �          �         �          �          �          �         �          �          �          �          �         �      �   �       P  �          �         �       �  �          �         0�       � �          �       @  �      �  �         a          t          y          z          b          c          X          d         e         _         \         R         K          U        UDPX         Z         �          �         �      
   �         �         �         �         �         �          �          �         �      �����          �          �      (   "          #         $          �          g          h          i          j          k         F          H         J         L          N         P         R          U         S          T          V          W          �          o          p          q          r          s          u          �          v         w         �         |         ~         �         x          z      (   �          %         �          �          �         @         �          �         �      X  �          �         &        ���          	                   �          �          �         �          �         �          �          �          �          �          �          �          �          �          �          �          �         �          �          �                                       I         J         K          	          L         M          �                             �          P         Q          S          )          	          	          �           	          +	       @  ,	       @  -	      ����Z	      ����[	      ��������        �����.  �         �         �          �                    "          $                                                   '          (          �          �          �          �          �         �         �       @  �          �          �         �         �          t          y          z          X          e         _         \         K          U        CAN;UDPX         Z         �          �         �      
   �         �         �         �         �         �          �          �         �      �����          �          �      (                                                                        "         !          #          $         �          g          h          i          j          k          F          H         J         L          N         P         R          U         S          T          V          W          �          o          p          q          r          s         u          �          v         �         |         ~         �         x          z      (   �          %         �          �          �         @         �          �      �  �      �  �          �         &          �          	                   �          �          �         �          �         �          �          �          �          �          �          �          �          �          �          �         �                                      I         J         K          	          L         M          �                   �          P         Q          )          	          	          �           	          +	       @  ,	       @  -	      ����Z	      ����[	      ��������        ������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������  ��������                                                   �  	   	   Name                 ����
   Index                 ��         SubIndex                 �          Accesslevel          !         low   middle   high       Accessright          1      	   read only
   write only
   read-write       Variable    	             ����
   Value                Variable       Min                Variable       Max                Variable          5  
   	   Name                 ����
   Index                 ��         SubIndex                 �          Accesslevel          !         low   middle   high       Accessright          1      	   read only
   write only
   read-write    	   Type          ~         INT   UINT   DINT   UDINT   LINT   ULINT   SINT   USINT   BYTE   WORD   DWORD   REAL   LREAL   STRING    
   Value                Type       Default                Type       Min                Type       Max                Type          5  
   	   Name                 ����
   Index                 ��         SubIndex                 �          Accesslevel          !         low   middle   high       Accessright          1      	   read only
   write only
   read-write    	   Type          ~         INT   UINT   DINT   UDINT   LINT   ULINT   SINT   USINT   BYTE   WORD   DWORD   REAL   LREAL   STRING    
   Value                Type       Default                Type       Min                Type       Max                Type          d        Member    	             ����   Index-Offset                 ��         SubIndex-Offset                 �          Accesslevel          !         low   middle   high       Accessright          1      	   read only
   write only
   read-write       Min                Member       Max                Member          �  	   	   Name                 ����   Member    	             ����
   Value                Member    
   Index                 ��         SubIndex                 �          Accesslevel          !         low   middle   high       Accessright          1      	   read only
   write only
   read-write       Min                Member       Max                Member          �  	   	   Name                 ����
   Index                 ��         SubIndex                 �          Accesslevel          !         low   middle   high       Accessright          1      	   read only
   write only
   read-write       Variable    	             ����
   Value                Variable       Min                Variable       Max                Variable                         ����  ��������               �   _Dummy@    @   @@    @   @             ��@             ��@@   @     �v@@   ; @+   ����  ��������                                  �v@      4@   �             �v@      D@   �                       �       @                           �f@      4@     �f@                �v@     �f@     @u@     �f@        ���            Module.Root-1__not_found__    Hardware configuration���� IB          % QB          % MB          %   o    Module.K_Bus1Module.Root    K-Bus     IB          % QB          % MB          %	   o     Module.Type_1_4_Channels1Module.K_Bus   Parameter.INTTypePAAssignment10000Module.Type_1_4_ChannelsPLCPLC  INTParameter.INTTypeModule10001Module.Type_1_4_Channelspluggedplugged  INT0750-0403 4 DI 24 V DC 0.2ms     IB          % QB          % MB          %   M     Ch_1 Digital inputChannel.BOOLOnX_I1Module.Type_1_4_Channels         IX         %    M     Ch_2 Digital inputChannel.BOOLOnX_I2Module.Type_1_4_Channels         IX        %    M     Ch_3 Digital inputChannel.BOOLOnX_I3Module.Type_1_4_Channels         IX        %    M     Ch_4 Digital inputChannel.BOOLOnX_I4Module.Type_1_4_Channels         IX        %    o     Module.Type_1_4_Channels2Module.K_Bus   Parameter.INTTypePAAssignment10000Module.Type_1_4_ChannelsPLCPLC  INTParameter.INTTypeModule10001Module.Type_1_4_Channelspluggedplugged  INT0750-0403 4 DI 24 V DC 0.2ms     IB          % QB          % MB          %   M     Ch_1 Digital inputChannel.BOOLOnX_I1Module.Type_1_4_Channels         IX        %    M     Ch_2 Digital inputChannel.BOOLOnX_I2Module.Type_1_4_Channels         IX        %    M     Ch_3 Digital inputChannel.BOOLOnX_I3Module.Type_1_4_Channels         IX        %    M     Ch_4 Digital inputChannel.BOOLOnX_I4Module.Type_1_4_Channels         IX        %    o     Module.Type_1_4_Channels3Module.K_Bus   Parameter.INTTypePAAssignment10000Module.Type_1_4_ChannelsPLCPLC  INTParameter.INTTypeModule10001Module.Type_1_4_Channelspluggedplugged  INT0750-0403 4 DI 24 V DC 0.2ms     IB          % QB          % MB          %   M     Ch_1 Digital inputChannel.BOOLOnX_I1Module.Type_1_4_Channels         IX        %    M     Ch_2 Digital inputChannel.BOOLOnX_I2Module.Type_1_4_Channels         IX 	       %    M     Ch_3 Digital inputChannel.BOOLOnX_I3Module.Type_1_4_Channels         IX 
       %    M     Ch_4 Digital inputChannel.BOOLOnX_I4Module.Type_1_4_Channels         IX        %    o     Module.Type_1_4_Channels4Module.K_Bus   Parameter.INTTypePAAssignment10000Module.Type_1_4_ChannelsPLCPLC  INTParameter.INTTypeModule10001Module.Type_1_4_Channelspluggedplugged  INT0750-0403 4 DI 24 V DC 0.2ms     IB          % QB          % MB          %   M     Ch_1 Digital inputChannel.BOOLOnX_I1Module.Type_1_4_Channels         IX        %    M     Ch_2 Digital inputChannel.BOOLOnX_I2Module.Type_1_4_Channels         IX        %    M     Ch_3 Digital inputChannel.BOOLOnX_I3Module.Type_1_4_Channels         IX        %    M     Ch_4 Digital inputChannel.BOOLOnX_I4Module.Type_1_4_Channels         IX        %    o     Module.Type_10_4_Channels5Module.K_Bus   Parameter.INTTypePAAssignment10000Module.Type_10_4_ChannelsPLCPLC  INTParameter.INTTypeModule10001Module.Type_10_4_Channelspluggedplugged  INT0750-0504 4 DO 24V DC 0.5A     IB          % QB          % MB          %   M     Ch_1 Digital outputChannel.BOOLOnX_Q1Module.Type_10_4_Channels        QX          %    M     Ch_2 Digital outputChannel.BOOLOnX_Q2Module.Type_10_4_Channels        QX         %    M     Ch_3 Digital outputChannel.BOOLOnX_Q3Module.Type_10_4_Channels        QX         %    M     Ch_4 Digital outputChannel.BOOLOnX_Q4Module.Type_10_4_Channels        QX         %    o     Module.Type_10_4_Channels6Module.K_Bus   Parameter.INTTypePAAssignment10000Module.Type_10_4_ChannelsPLCPLC  INTParameter.INTTypeModule10001Module.Type_10_4_Channelspluggedplugged  INT0750-0504 4 DO 24V DC 0.5A     IB          % QB          % MB          %   M     Ch_1 Digital outputChannel.BOOLOnX_Q1Module.Type_10_4_Channels        QX         %    M     Ch_2 Digital outputChannel.BOOLOnX_Q2Module.Type_10_4_Channels        QX         %    M     Ch_3 Digital outputChannel.BOOLOnX_Q3Module.Type_10_4_Channels        QX         %    M     Ch_4 Digital outputChannel.BOOLOnX_Q4Module.Type_10_4_Channels        QX         %    o     Module.Type_10_4_Channels7Module.K_Bus   Parameter.INTTypePAAssignment10000Module.Type_10_4_ChannelsPLCPLC  INTParameter.INTTypeModule10001Module.Type_10_4_Channelspluggedplugged  INT0750-0504 4 DO 24V DC 0.5A     IB          % QB          % MB          %   M     Ch_1 Digital outputChannel.BOOLOnX_Q1Module.Type_10_4_Channels        QX         %    M     Ch_2 Digital outputChannel.BOOLOnX_Q2Module.Type_10_4_Channels        QX  	       %    M     Ch_3 Digital outputChannel.BOOLOnX_Q3Module.Type_10_4_Channels        QX  
       %    M     Ch_4 Digital outputChannel.BOOLOnX_Q4Module.Type_10_4_Channels        QX         %    o     Module.Type_8_2_Channels8Module.K_Bus   Parameter.INTTypePAAssignment10000Module.Type_8_2_ChannelsPLCPLC  INTParameter.INTTypeModule10001Module.Type_8_2_Channelspluggedplugged  INT0750-0456 2 AI �10V DC     IB          % QB          % MB          %   M     Ch_1 Input wordChannel.WORDOnW_I1Module.Type_8_2_Channels         IW          %    M     Ch_2 Input wordChannel.WORDOnW_I2Module.Type_8_2_Channels         IW         %    o     Module.Type_8_2_Channels9Module.K_Bus   Parameter.INTTypePAAssignment10000Module.Type_8_2_ChannelsPLCPLC  INTParameter.INTTypeModule10001Module.Type_8_2_Channelspluggedplugged  INT0750-0456 2 AI �10V DC     IB          % QB          % MB          %   M     Ch_1 Input wordChannel.WORDOnW_I1Module.Type_8_2_Channels         IW         %    M     Ch_2 Input wordChannel.WORDOnW_I2Module.Type_8_2_Channels         IW         %    o     Module.FB_VARS2Module.Root    Fieldbus variables    IB          % QB          % MB          %    o     Module.FLAG_VARS3Module.Root    Flag variables    IB          % QB          % MB          %    ��Z	�+x[     ��������           VAR_GLOBAL
END_VAR
                                                                                  "     ��������              t�Z                   start   Called when program starts    _   FUNCTION systemevent: DWORD VAR_INPUT dwEvent: DWORD; dwFilter: DWORD; dwOwner: DWORD; END_VAR     �.     stop   Called when program stops    _   FUNCTION systemevent: DWORD VAR_INPUT dwEvent: DWORD; dwFilter: DWORD; dwOwner: DWORD; END_VAR     �.     before_reset   Called before reset takes place    _   FUNCTION systemevent: DWORD VAR_INPUT dwEvent: DWORD; dwFilter: DWORD; dwOwner: DWORD; END_VAR     �.     after_reset   Called after reset took place    _   FUNCTION systemevent: DWORD VAR_INPUT dwEvent: DWORD; dwFilter: DWORD; dwOwner: DWORD; END_VAR     �.     shutdownC   Called before shutdown is performed (Firmware update over ethernet)    _   FUNCTION systemevent: DWORD VAR_INPUT dwEvent: DWORD; dwFilter: DWORD; dwOwner: DWORD; END_VAR     �.     excpt_watchdog%   Software watchdog of IEC-task expired    _   FUNCTION systemevent: DWORD VAR_INPUT dwEvent: DWORD; dwFilter: DWORD; dwOwner: DWORD; END_VAR     �.     excpt_fieldbus   Fieldbus error    _   FUNCTION systemevent: DWORD VAR_INPUT dwEvent: DWORD; dwFilter: DWORD; dwOwner: DWORD; END_VAR  	   �.     excpt_ioupdate
   KBus error    _   FUNCTION systemevent: DWORD VAR_INPUT dwEvent: DWORD; dwFilter: DWORD; dwOwner: DWORD; END_VAR  
   �.     excpt_dividebyzero*   Division by zero. Only integer operations!    _   FUNCTION systemevent: DWORD VAR_INPUT dwEvent: DWORD; dwFilter: DWORD; dwOwner: DWORD; END_VAR     �.     excpt_noncontinuable   Exception handler    _   FUNCTION systemevent: DWORD VAR_INPUT dwEvent: DWORD; dwFilter: DWORD; dwOwner: DWORD; END_VAR     �.     after_reading_inputs   Called after reading of inputs    _   FUNCTION systemevent: DWORD VAR_INPUT dwEvent: DWORD; dwFilter: DWORD; dwOwner: DWORD; END_VAR     �.     before_writing_outputs    Called before writing of outputs    _   FUNCTION systemevent: DWORD VAR_INPUT dwEvent: DWORD; dwFilter: DWORD; dwOwner: DWORD; END_VAR     �.  
   debug_loop   Debug loop at breakpoint    _   FUNCTION systemevent: DWORD VAR_INPUT dwEvent: DWORD; dwFilter: DWORD; dwOwner: DWORD; END_VAR     �.     online_change+   Is called after CodeInit() at Online-Change    _   FUNCTION systemevent: DWORD VAR_INPUT dwEvent: DWORD; dwFilter: DWORD; dwOwner: DWORD; END_VAR  !   �.     before_download$   Is called before the Download starts    _   FUNCTION systemevent: DWORD VAR_INPUT dwEvent: DWORD; dwFilter: DWORD; dwOwner: DWORD; END_VAR  "   �.     event_login/   Is called before the login service is performed    _   FUNCTION systemevent: DWORD VAR_INPUT dwEvent: DWORD; dwFilter: DWORD; dwOwner: DWORD; END_VAR  �  �.     eth_overload   Ethernet Overload    _   FUNCTION systemevent: DWORD VAR_INPUT dwEvent: DWORD; dwFilter: DWORD; dwOwner: DWORD; END_VAR  �  �.     eth_network_ready@   Is called directly after the Network and the PLC are initialised    _   FUNCTION systemevent: DWORD VAR_INPUT dwEvent: DWORD; dwFilter: DWORD; dwOwner: DWORD; END_VAR  �  �.  
   blink_codeN   New blink code / Blink code cleared ( Call STATUS_GET_LAST_ERROR for details )    _   FUNCTION systemevent: DWORD VAR_INPUT dwEvent: DWORD; dwFilter: DWORD; dwOwner: DWORD; END_VAR  �  �.     interrupt_0(   Interrupt Real Time Clock (every second)    _   FUNCTION systemevent: DWORD VAR_INPUT dwEvent: DWORD; dwFilter: DWORD; dwOwner: DWORD; END_VAR  �  �.  $����  ��������               ��������           Standard t�Z	t�Z      ��������                         	�'x[     ��������           VAR_CONFIG
END_VAR
                                                                                   '           2   , � � l�           ClockPulses ��Z	��q[2     ��������        �   
VAR_GLOBAL
	_CLOCK_100MS AT %QX0.0: BOOL ;
	_CLOCK_1S AT %QX0.1: BOOL ;
	_CLOCK_10S AT %QX0.2: BOOL ;
	_CLOCK_60S AT %QX0.3: BOOL ;
END_VAR
                                                                                               '              , ��           Global_Variables u�Z	�L"[     ��������        2   VAR_GLOBAL
	AlwaysOne : BOOL := TRUE ;
END_VAR
                                                                                               '           �     ��������        (   Networkmanagement implicit Variables UDP ��0[	��0[�     ��������        �  VAR_GLOBAL CONSTANT
	USE_NWVARS_UDP : BOOL := FALSE;
	MAX_NetVarItems_UDP	: INT := 0;
	MAX_NetVarPDO_Rx_UDP	: INT := 0;
	MAX_NetVarPDO_Tx_UDP	: INT := 0;
	MAX_NetVarOD_UDP		: INT := 0;
END_VAR
VAR_GLOBAL
	pNetVarItems_UDP		: ARRAY[0..MAX_NetVarItems_UDP] OF NetVarDataItem_UDP;
	pNetVarPDO_Rx_UDP		: ARRAY[0..MAX_NetVarPDO_Rx_UDP] OF NetVarPDO_Rx_UDP;
	pNetVarPDO_Tx_UDP		: ARRAY[0..MAX_NetVarPDO_Tx_UDP] OF NetVarPDO_Tx_UDP;
	pNetVarOD_UDP			: ARRAY[0..MAX_NetVarOD_UDP] OF NetVarSDO_UDP;
	pNetVarPDO_Rx_Diagnosis_UDP : ARRAY[0..MAX_NetVarPDO_Rx_UDP] OF NetVarUDPDiagStruct;
	pNetVarPDO_Tx_Diagnosis_UDP : ARRAY[0..MAX_NetVarPDO_Tx_UDP] OF NetVarUDPDiagStruct;
END_VAR
                                                                                               '           	   , � � s�           Variable_Configuration u�Z	u�Z	     ��������           VAR_CONFIG
END_VAR
                                                                                                 ~   |0|0 @t    @R   Arial @       HH':'mm':'ss @      dd'-'MM'-'yyyy   dd'-'MM'-'yyyy HH':'mm':'ss�����                               ,     �   ���  �3 ���   � ���     
    @��  ���     @      DEFAULT             System      ~   |0|0 @t    @R   Arial @       HH':'mm':'ss @      dd'-'MM'-'yyyy   dd'-'MM'-'yyyy HH':'mm':'ss�����                      )   HH':'mm':'ss @                             dd'-'MM'-'yyyy @       '           
 �   , � � �        
   BitTrigger �+x[	�*x[      ��������        3  FUNCTION_BLOCK BitTrigger
VAR_INPUT
	CLK : BOOL ; (**< Trigger condition of the Event *)
END_VAR
VAR_OUTPUT
	CLK_OUT : BOOL ; (**< Internal state of the trigger *)
	Q : BOOL ; (**< Single cycle high bit for the trigger *)
END_VAR
VAR
	EventCount : DINT ; (**< Amount of events processed *)
END_VAR�   
Q := CLK AND (NOT CLK_OUT) ; (* Create the trigger Flank *)
CLK_OUT := CLK;							 (* Store the condition in the output variable *)

(* Count the amount of events occurred *)
IF Q THEN
	EventCount := EventCount + 1;
END_IF;               /   , � � ��           ClockCycles �St[	��Z      ��������        J   PROGRAM ClockCycles
VAR
	trigger_50ms : TON ;
	Counter : INT ;
END_VAR�  trigger_50ms(IN:= TRUE, PT:= T#45ms, Q=> , ET=> );
IF(trigger_50ms.Q) THEN
	trigger_50ms(IN:= FALSE);
	Counter := Counter + 1;
	_CLOCK_100MS := NOT _CLOCK_100MS;
	IF Counter >= 600 THEN
		Counter := 0;
		_CLOCK_60S := NOT _CLOCK_60S;
	END_IF;

	IF 0 = Counter MOD 10 THEN
		_CLOCK_1S := NOT _CLOCK_1S;
	END_IF;

	IF 0 = Counter MOD 100 THEN
		_CLOCK_10S := NOT _CLOCK_10S;
	END_IF;
END_IF;               �   , � � t3        
   ComposeInt ,q[	�+q[      ��������        �   FUNCTION ComposeInt : INT
VAR_INPUT
	Ones : INT ;
	Tens : INT ;
	Hundreds : INT ;
	Thousands : INT ;
END_VAR
VAR
END_VARI   ComposeInt := (Thousands * 1000) + (Hundreds * 100) + (Tens * 10) + Ones;               ,   , � � ��        
   IO_Mapping ,x[	��t[      ��������          PROGRAM IO_Mapping
VAR
	bSecondPulse AT %QX256.0 : BOOL ; (**< 50% Duty cycle second pulse *)
	TriggerState AT %QX256.1 : BOOL ; (**< Trigger Condition *)
	TimerResult AT %QX256.2 : BOOL ; (**< Timer Expiration *)
	ActualCount AT %QW257 : INT ; (**< Actual count sent by modbus TCP *)
	Cycles AT %QW258  : WORD ; (**< CycleCount *)
	bEnableCount AT %IX256.0 : BOOL ; (**< Enable input received by the modbus TCP *)
	bMinutePulse AT %QX256.3 : BOOL ; (**< 50% Duty cycle minute pulse *)
	Trigger : R_TRIG ;
END_VAR�  WriteBit(ADR(PC20_CYCLE.FASE_7), bEnableCount );

bSecondPulse := _CLOCK_1S ;
bMinutePulse := _CLOCK_60S ;
TriggerState := _CLOCK_1S AND PC20_CYCLE.FASE_7 AND NOT PC20_CYCLE.TIMER_41;
TimerResult := PC20_CYCLE.TIMER_41;

ActualCount := ComposeInt(PC20_CYCLE.DSP41_0, PC20_CYCLE.DSP41_1, PC20_CYCLE.DSP41_2, PC20_CYCLE.DSP41_3);

WriteValue(ADR(PC20_CYCLE.STP41_1), 1);
Trigger(CLK:= TriggerState, Q=> );
WriteBit(ADR(PC20_CYCLE.S_1SEC), Trigger.Q);

Cycles := Cycles + 1 ;

               �   , � � �`           OptimizedTimer ��q[	��q[      ��������        $   PROGRAM OptimizedTimer
VAR
END_VAR   ;               �   , � � M        
   PC20_CYCLE �)x[	�'x[      ��������        �y PROGRAM PC20_CYCLE
VAR
  RESULT1 : BOOL ; (* 3.0 !F=C *)
  RESULT : BOOL ; (* 3.1 !F=C *)
  ENTER : BOOL ; (* 3.3 !triggerpuls enterdrukkn. *)
  DUMP_1 : BOOL ; (* 4.1  *)
  DUMP_2 : BOOL ; (* 4.2  *)
  DUMP_3 : BOOL ; (* 4.3  *)
  DUMP_4 : BOOL ; (* 5.0  *)
  DUMP_5 : BOOL ; (* 5.1  *)
  DUMP_6 : BOOL ; (* 5.2  *)
  DUMP_7 : BOOL ; (* 5.3  *)
  DUMP_8 : BOOL ; (* 6.0  *)
  DUMP_9 : BOOL ; (* 6.1  *)
  DUMP_10 : BOOL ; (* 6.2  *)
  DUMP_11 : BOOL ; (* 6.3  *)
  DUMP_12 : BOOL ; (* 7.0  *)
  DUMP_13 : BOOL ; (* 7.1  *)
  DUMP_14 : BOOL ; (* 7.2  *)
  DUMP_15 : BOOL ; (* 7.3  *)
  DUMP_16 : BOOL ; (* 8.0  *)
  DUMP_17 : BOOL ; (* 8.1  *)
  DUMP_18 : BOOL ; (* 8.2  *)
  DUMP_19 : BOOL ; (* 8.3  *)
  DUMP_20 : BOOL ; (* 9.0  *)
  DUMP_21 : BOOL ; (* 9.1  *)
  DUMP_22 : BOOL ; (* 9.2  *)
  DUMP_23 : BOOL ; (* 9.3  *)
  DUMP_24 : BOOL ; (* 10.0  *)
  DUMP_25 : BOOL ; (* 10.1  *)
  DUMP_26 : BOOL ; (* 10.2  *)
  DUMP_27 : BOOL ; (* 10.3  *)
  DUMP_28 : BOOL ; (* 11.0  *)
  DUMP_29 : BOOL ; (* 11.1  *)
  DUMP_30 : BOOL ; (* 11.2  *)
  DUMP : BOOL ; (* 11.3  *)
  DUMP_31 : BOOL ; (* 12.0  *)
  DUMP_32 : BOOL ; (* 12.1  *)
  DUMP_33 : BOOL ; (* 12.2  *)
  DUMP_34 : BOOL ; (* 12.3  *)
  DUMP_35 : BOOL ; (* 13.0  *)
  DUMP_36 : BOOL ; (* 13.1  *)
  DUMP_37 : BOOL ; (* 13.2  *)
  DUMP_38 : BOOL ; (* 13.3  *)
  DUMP_39 : BOOL ; (* 14.0  *)
  DUMP_40 : BOOL ; (* 14.1  *)
  DUMP_41 : BOOL ; (* 14.2  *)
  DUMP_42 : BOOL ; (* 14.3  *)
  PLCC1 : BOOL ; (* 15.0 !eerste PLC_cyclus hoog_signaal *)
  TIMER_01 : BOOL ; (* 20.0  *)
  TIMER_02 : BOOL ; (* 20.1  *)
  TIMER_03 : BOOL ; (* 20.2  *)
  TIMER_04 : BOOL ; (* 20.3  *)
  TIMER_05 : BOOL ; (* 21.0  *)
  TIMER_06 : BOOL ; (* 21.1  *)
  TIMER_07 : BOOL ; (* 21.2  *)
  TIMER_08 : BOOL ; (* 21.3  *)
  TIMER_09 : BOOL ; (* 22.0  *)
  TIMER_10 : BOOL ; (* 22.1  *)
  TIMER_11 : BOOL ; (* 22.2  *)
  TIMER_12 : BOOL ; (* 22.3  *)
  TIMER_13 : BOOL ; (* 23.0  *)
  TIMER_14 : BOOL ; (* 23.1  *)
  TIMER_15 : BOOL ; (* 23.2  *)
  TIMER_16 : BOOL ; (* 23.3  *)
  TIMER_17 : BOOL ; (* 24.0  *)
  TIMER_18 : BOOL ; (* 24.1  *)
  TIMER_19 : BOOL ; (* 24.2  *)
  TIMER_20 : BOOL ; (* 24.3  *)
  TIMER_21 : BOOL ; (* 25.0  *)
  TIMER_22 : BOOL ; (* 25.1  *)
  TIMER_23 : BOOL ; (* 25.2  *)
  TIMER_24 : BOOL ; (* 25.3  *)
  TIMER_25 : BOOL ; (* 26.0  *)
  TIMER_26 : BOOL ; (* 26.1  *)
  TIMER_27 : BOOL ; (* 26.2  *)
  TIMER_28 : BOOL ; (* 26.3  *)
  TIMER_29 : BOOL ; (* 27.0  *)
  TIMER_30 : BOOL ; (* 27.1  *)
  TIMER_31 : BOOL ; (* 27.2  *)
  TIMER_32 : BOOL ; (* 27.3  *)
  TIMER_33 : BOOL ; (* 28.0  *)
  TIMER_34 : BOOL ; (* 28.1  *)
  TIMER_35 : BOOL ; (* 28.2  *)
  TIMER_36 : BOOL ; (* 28.3  *)
  TIMER_37 : BOOL ; (* 29.0  *)
  TIMER_38 : BOOL ; (* 29.1  *)
  TIMER_39 : BOOL ; (* 29.2  *)
  TIMER_40 : BOOL ; (* 29.3  *)
  TIMER_41 : BOOL ; (* 30.0  *)
  TIMER_42 : BOOL ; (* 30.1  *)
  TIMER_43 : BOOL ; (* 30.2  *)
  TIMER_44 : BOOL ; (* 30.3  *)
  TIMER_45 : BOOL ; (* 31.0  *)
  TIMER_46 : BOOL ; (* 31.1  *)
  TIMER_47 : BOOL ; (* 31.2  *)
  TIMER_48 : BOOL ; (* 31.3  *)
  TIMER_49 : BOOL ; (* 32.0  *)
  TIMER_50 : BOOL ; (* 32.1  *)
  TIMER_51 : BOOL ; (* 32.2  *)
  TIMER_52 : BOOL ; (* 32.3  *)
  TIMER_53 : BOOL ; (* 33.0  *)
  TIMER_54 : BOOL ; (* 33.1  *)
  TIMER_55 : BOOL ; (* 33.2  *)
  TIMER_56 : BOOL ; (* 33.3  *)
  TIMER_57 : BOOL ; (* 34.0  *)
  TIMER_58 : BOOL ; (* 34.1  *)
  TIMER_59 : BOOL ; (* 34.2  *)
  TIMER_60 : BOOL ; (* 34.3  *)
  R_VOORW : BOOL ; (* 35.0 !regeneratievoorw. OK *)
  BDR0B11 : BOOL ; (* 35.1 !bedrijfsvoorwaarden *)
  unnamed_035_2 : BOOL ; (* 35.2  *)
  unnamed_035_3 : BOOL ; (* 35.3  *)
  BDR0B01 : BOOL ; (* 36.0 !bedrijfsfase 1 *)
  BDR0B02 : BOOL ; (* 36.1 !bedrijfsfase 2 *)
  BDR0B03 : BOOL ; (* 36.2 !bedrijfsfase 3 *)
  BDR0B04 : BOOL ; (* 36.3 !bedrijfsfase 4 *)
  BDR0B05 : BOOL ; (* 37.0 !bedrijfsfase 5 *)
  BDR0B06 : BOOL ; (* 37.1 !bedrijfsfase 6 *)
  FASE_7 : BOOL ; (* 37.2 !fase 7 *)
  REG0B08 : BOOL ; (* 37.3 !regeneratiefase 8 *)
  REG0B09 : BOOL ; (* 38.0 !regeneratiefase 9 *)
  REG0B10 : BOOL ; (* 38.1 !regeneratiefase 10 *)
  REG0B11 : BOOL ; (* 38.2 !regeneratiefase 11 *)
  REG0B12 : BOOL ; (* 38.3 !regeneratiefase 12 *)
  REG0B13 : BOOL ; (* 39.0 !regeneratiefase 13 *)
  REG0B14 : BOOL ; (* 39.1 !regeneratiefase 14 *)
  REG0B15 : BOOL ; (* 39.2 !regeneratiefase 15 *)
  REG0B16 : BOOL ; (* 39.3 !regeneratiefase 16 *)
  REG0B17 : BOOL ; (* 40.0 !regeneratiefase 17 *)
  REG0B18 : BOOL ; (* 40.1 !regeneratiefase 18 *)
  REG0B19 : BOOL ; (* 40.2 !regeneratiefase 19 *)
  REG0B20 : BOOL ; (* 40.3 !regeneratiefase 20 *)
  REG0B21 : BOOL ; (* 41.0 !regeneratiefase 21 *)
  REG0B22 : BOOL ; (* 41.1 !regeneratiefase 22 *)
  REG0B23 : BOOL ; (* 41.2 !regeneratiefase 23 *)
  REG0B24 : BOOL ; (* 41.3 !regeneratiefase 24 *)
  REG0B25 : BOOL ; (* 42.0 !regeneratiefase 25 *)
  REG0B26 : BOOL ; (* 42.1 !regeneratiefase 26 *)
  REG0B27 : BOOL ; (* 42.2 !regeneratiefase 27 *)
  REG0B28 : BOOL ; (* 42.3 !regeneratiefase 28 *)
  REG0B29 : BOOL ; (* 43.0 !regeneratiefase 29 *)
  REG0B30 : BOOL ; (* 43.1 !regeneratiefase 30 *)
  REG0B31 : BOOL ; (* 43.2 !regeneratiefase 31 *)
  REG0B32 : BOOL ; (* 43.3 !regeneratiefase 32 *)
  REG0B33 : BOOL ; (* 44.0 !regeneratiefase 33 *)
  REG0B34 : BOOL ; (* 44.1 !regeneratiefase 33.1 *)
  REG0B00 : BOOL ; (* 44.2 !start regen. fasen 8 t/m 33.1 *)
  REG0B88 : BOOL ; (* 44.3 !aanloopfase 88 *)
  ALARM29 : BOOL ; (* 45.0 !V 1.1 niet geopend *)
  ALARM30 : BOOL ; (* 45.1 !V 1.1 niet gesloten *)
  ALARM31 : BOOL ; (* 45.2 !V 3.1 niet geopend *)
  ALARM32 : BOOL ; (* 45.3 !V 3.1 niet gesloten *)
  ALARM33 : BOOL ; (* 46.0 !V 5.1 niet geopend *)
  ALARM34 : BOOL ; (* 46.1 !V 5.1 niet gesloten *)
  ALARM35 : BOOL ; (* 46.2 !V 7.1 niet geopend *)
  ALARM36 : BOOL ; (* 46.3 !V 7.1 niet gesloten *)
  ALARM13 : BOOL ; (* 47.0 !V10.1 niet geopend *)
  ALARM14 : BOOL ; (* 47.1 !V10.1 niet gesloten *)
  ALARM15 : BOOL ; (* 47.2 !V10.2 niet geopend *)
  ALARM16 : BOOL ; (* 47.3 !V10.2 niet gesloten *)
  ALARM17 : BOOL ; (* 48.0 !V10.3 niet geopend *)
  ALARM18 : BOOL ; (* 48.1 !V10.3 niet gesloten *)
  ALARM19 : BOOL ; (* 48.2 !V10.4 niet geopend *)
  ALARM20 : BOOL ; (* 48.3 !V10.4 niet gesloten *)
  ALARM21 : BOOL ; (* 49.0 !V11.1 niet geopend *)
  ALARM22 : BOOL ; (* 49.1 !V11.1 niet gesloten *)
  ALARM23 : BOOL ; (* 49.2 !V11.2 niet geopend *)
  ALARM24 : BOOL ; (* 49.3 !V11.2 niet gesloten *)
  ALARM25 : BOOL ; (* 50.0 !V11.3 niet geopend *)
  ALARM26 : BOOL ; (* 50.1 !V11.3 niet gesloten *)
  ALARM27 : BOOL ; (* 50.2 !V12.1 niet geopend *)
  ALARM28 : BOOL ; (* 50.3 !V12.1 niet gesloten *)
  BDR0B00 : BOOL ; (* 51.0 !start bedrijf fasen 1 t/m 6 *)
  BDR0B07 : BOOL ; (* 51.1 !einde fasetimer *)
  BDR0B08 : BOOL ; (* 51.2 !startpuls bedrijf fase 1 t/m 6 *)
  BDR0B09 : BOOL ; (* 51.3 !hand doorstap (triggerpuls) *)
  BDR0T00 : BOOL ; (* 52.0 !doorstap triggerpuls *)
  BDR0T01 : BOOL ; (* 52.1 !triggerpuls laden timer fase 1 *)
  BDR0T02 : BOOL ; (* 52.2 !triggerpuls laden timer fase 2 *)
  BDR0T03 : BOOL ; (* 52.3 !triggerpuls laden timer fase 3 *)
  BDR0T04 : BOOL ; (* 53.0 !triggerpuls laden timer fase 4 *)
  BDR0T05 : BOOL ; (* 53.1 !triggerpuls laden timer fase 5 *)
  BDR0T06 : BOOL ; (* 53.2 !triggerpuls laden timer fase 6 *)
  STAP_2 : BOOL ; (* 53.3 !stappen faseregister *)
  BDR0B10 : BOOL ; (* 54.0 !bedrijfsmelding *)
  BDR0T07 : BOOL ; (* 54.1 !triggerpuls reset fasen *)
  TRGAAN88 : BOOL ; (* 54.2 !triggerpuls aanloopfase 88 *)
  TMRAAN88 : BOOL ; (* 54.3 !timer aanloopfase 88 *)
  FASE78 : BOOL ; (* 55.0  *)
  FASE77 : BOOL ; (* 55.1  *)
  FASE76 : BOOL ; (* 55.2  *)
  FASE75 : BOOL ; (* 55.3  *)
  FASE74 : BOOL ; (* 56.0  *)
  FASE73 : BOOL ; (* 56.1  *)
  FASE72 : BOOL ; (* 56.2  *)
  FASE71 : BOOL ; (* 56.3  *)
  FASE70 : BOOL ; (* 57.0  *)
  FASE69 : BOOL ; (* 57.1  *)
  FASE68 : BOOL ; (* 57.2  *)
  FASE67 : BOOL ; (* 57.3  *)
  FASE66 : BOOL ; (* 58.0  *)
  FASE65 : BOOL ; (* 58.1  *)
  FASE64 : BOOL ; (* 58.2  *)
  FASE63 : BOOL ; (* 58.3  *)
  FASE62 : BOOL ; (* 59.0  *)
  FASE61 : BOOL ; (* 59.1  *)
  FASE60 : BOOL ; (* 59.2  *)
  FASE59 : BOOL ; (* 59.3  *)
  FASE58 : BOOL ; (* 60.0  *)
  FASE57 : BOOL ; (* 60.1  *)
  FASE56 : BOOL ; (* 60.2  *)
  FASE55 : BOOL ; (* 60.3  *)
  FASE54 : BOOL ; (* 61.0  *)
  FASE53 : BOOL ; (* 61.1  *)
  FASE52 : BOOL ; (* 61.2  *)
  FASE51 : BOOL ; (* 61.3  *)
  FASE50 : BOOL ; (* 62.0  *)
  FASE49 : BOOL ; (* 62.1  *)
  FASE48 : BOOL ; (* 62.2  *)
  FASE47 : BOOL ; (* 62.3  *)
  FASE46 : BOOL ; (* 63.0  *)
  FASE45 : BOOL ; (* 63.1  *)
  FASE44 : BOOL ; (* 63.2  *)
  FASE43 : BOOL ; (* 63.3  *)
  FASE42 : BOOL ; (* 64.0  *)
  FASE41 : BOOL ; (* 64.1  *)
  FASE40 : BOOL ; (* 64.2  *)
  FASE39 : BOOL ; (* 64.3  *)
  FASE38 : BOOL ; (* 65.0  *)
  FASE37 : BOOL ; (* 65.1  *)
  FASE36 : BOOL ; (* 65.2  *)
  FASE35 : BOOL ; (* 65.3  *)
  FASE34 : BOOL ; (* 66.0  *)
  FASE33 : BOOL ; (* 66.1  *)
  FASE32 : BOOL ; (* 66.2  *)
  FASE31 : BOOL ; (* 66.3  *)
  FASE30 : BOOL ; (* 67.0  *)
  FASE29 : BOOL ; (* 67.1  *)
  FASE28 : BOOL ; (* 67.2  *)
  FASE27 : BOOL ; (* 67.3  *)
  FASE26 : BOOL ; (* 68.0  *)
  FASE25 : BOOL ; (* 68.1  *)
  FASE24 : BOOL ; (* 68.2  *)
  FASE23 : BOOL ; (* 68.3  *)
  FASE22 : BOOL ; (* 69.0  *)
  FASE21 : BOOL ; (* 69.1  *)
  FASE20 : BOOL ; (* 69.2  *)
  FASE19 : BOOL ; (* 69.3  *)
  FASE18 : BOOL ; (* 70.0  *)
  FASE17 : BOOL ; (* 70.1  *)
  FASE16 : BOOL ; (* 70.2  *)
  FASE15 : BOOL ; (* 70.3  *)
  FASE14 : BOOL ; (* 71.0  *)
  FASE13 : BOOL ; (* 71.1  *)
  FASE12 : BOOL ; (* 71.2  *)
  FASE11 : BOOL ; (* 71.3  *)
  FASE10 : BOOL ; (* 72.0  *)
  FASE09 : BOOL ; (* 72.1  *)
  FASE08 : BOOL ; (* 72.2  *)
  FASE07 : BOOL ; (* 72.3  *)
  FASE06 : BOOL ; (* 73.0  *)
  FASE05 : BOOL ; (* 73.1  *)
  FASE04 : BOOL ; (* 73.2  *)
  FASE03 : BOOL ; (* 73.3  *)
  FASE02 : BOOL ; (* 74.0  *)
  FASE01 : BOOL ; (* 74.1  *)
  unnamed_074_2 : BOOL ; (* 74.2  *)
  unnamed_074_3 : BOOL ; (* 74.3  *)
  TIMER01 : BOOL ; (* 75.0  *)
  STAP : BOOL ; (* 75.1 !triggerpuls *)
  DOORSTAP : BOOL ; (* 75.2 !fasedoorstappuls door drukknop *)
  STAP_1 : BOOL ; (* 75.3 !fasedoorstappuls *)
  START : BOOL ; (* 76.0 !start storingcode's naar lichtkrant *)
  ST_AANW : BOOL ; (* 76.1 !storing aanwezig ? *)
  TRIGTIM : BOOL ; (* 76.2 !triggerpuls timer01 *)
  RONDSTAP : BOOL ; (* 76.3 !stap van fase 78 naar fase 01 *)
  STAPPULS : BOOL ; (* 77.0 !triggerpuls rondstap *)
  STARTP : BOOL ; (* 77.1 !triggerpuls start *)
  FASESPRG : BOOL ; (* 77.2 !fase overspringen *)
  PULS78 : BOOL ; (* 77.3 !triggerpuls einde fase 78 *)
  STAP01 : BOOL ; (* 78.0 !doorstappuls fase 78 naar fase 01 *)
  VRIJG01 : BOOL ; (* 80.0 !vrijgave fase *)
  VRIJG02 : BOOL ; (* 80.1 !vrijgave fase *)
  VRIJG03 : BOOL ; (* 80.2 !vrijgave fase *)
  VRIJG04 : BOOL ; (* 80.3 !vrijgave fase *)
  VRIJG05 : BOOL ; (* 81.0 !vrijgave fase *)
  VRIJG06 : BOOL ; (* 81.1 !vrijgave fase *)
  VRIJG07 : BOOL ; (* 81.2 !vrijgave fase *)
  VRIJG08 : BOOL ; (* 81.3 !vrijgave fase *)
  VRIJG09 : BOOL ; (* 82.0 !vrijgave fase *)
  VRIJG10 : BOOL ; (* 82.1 !vrijgave fase *)
  VRIJG11 : BOOL ; (* 82.2 !vrijgave fase *)
  VRIJG12 : BOOL ; (* 82.3 !vrijgave fase *)
  VRIJG13 : BOOL ; (* 83.0 !vrijgave fase *)
  VRIJG14 : BOOL ; (* 83.1 !vrijgave fase *)
  VRIJG15 : BOOL ; (* 83.2 !vrijgave fase *)
  VRIJG16 : BOOL ; (* 83.3 !vrijgave fase *)
  VRIJG17 : BOOL ; (* 84.0 !vrijgave fase *)
  VRIJG18 : BOOL ; (* 84.1 !vrijgave fase *)
  VRIJG19 : BOOL ; (* 84.2 !vrijgave fase *)
  VRIJG20 : BOOL ; (* 84.3 !vrijgave fase *)
  VRIJG21 : BOOL ; (* 85.0 !vrijgave fase *)
  VRIJG22 : BOOL ; (* 85.1 !vrijgave fase *)
  VRIJG23 : BOOL ; (* 85.2 !vrijgave fase *)
  VRIJG24 : BOOL ; (* 85.3 !vrijgave fase *)
  VRIJG25 : BOOL ; (* 86.0 !vrijgave fase *)
  VRIJG26 : BOOL ; (* 86.1 !vrijgave fase *)
  VRIJG27 : BOOL ; (* 86.2 !vrijgave fase *)
  VRIJG28 : BOOL ; (* 86.3 !vrijgave fase *)
  VRIJG29 : BOOL ; (* 87.0 !vrijgave fase *)
  VRIJG30 : BOOL ; (* 87.1 !vrijgave fase *)
  VRIJG31 : BOOL ; (* 87.2 !vrijgave fase *)
  VRIJG32 : BOOL ; (* 87.3 !vrijgave fase *)
  VRIJG33 : BOOL ; (* 88.0 !vrijgave fase *)
  VRIJG34 : BOOL ; (* 88.1 !vrijgave fase *)
  VRIJG35 : BOOL ; (* 88.2 !vrijgave fase *)
  VRIJG36 : BOOL ; (* 88.3 !vrijgave fase *)
  VRIJG37 : BOOL ; (* 89.0 !vrijgave fase *)
  VRIJG38 : BOOL ; (* 89.1 !vrijgave fase *)
  VRIJG39 : BOOL ; (* 89.2 !vrijgave fase *)
  VRIJG40 : BOOL ; (* 89.3 !vrijgave fase *)
  VRIJG41 : BOOL ; (* 90.0 !vrijgave fase *)
  VRIJG42 : BOOL ; (* 90.1 !vrijgave fase *)
  VRIJG43 : BOOL ; (* 90.2 !vrijgave fase *)
  VRIJG44 : BOOL ; (* 90.3 !vrijgave fase *)
  VRIJG45 : BOOL ; (* 91.0 !vrijgave fase *)
  VRIJG46 : BOOL ; (* 91.1 !vrijgave fase *)
  VRIJG47 : BOOL ; (* 91.2 !vrijgave fase *)
  VRIJG48 : BOOL ; (* 91.3 !vrijgave fase *)
  VRIJG49 : BOOL ; (* 92.0 !vrijgave fase *)
  VRIJG50 : BOOL ; (* 92.1 !vrijgave fase *)
  VRIJG51 : BOOL ; (* 92.2 !vrijgave fase *)
  VRIJG52 : BOOL ; (* 92.3 !vrijgave fase *)
  VRIJG53 : BOOL ; (* 93.0 !vrijgave fase *)
  VRIJG54 : BOOL ; (* 93.1 !vrijgave fase *)
  VRIJG55 : BOOL ; (* 93.2 !vrijgave fase *)
  VRIJG56 : BOOL ; (* 93.3 !vrijgave fase *)
  VRIJG57 : BOOL ; (* 94.0 !vrijgave fase *)
  VRIJG58 : BOOL ; (* 94.1 !vrijgave fase *)
  VRIJG59 : BOOL ; (* 94.2 !vrijgave fase *)
  VRIJG60 : BOOL ; (* 94.3 !vrijgave fase *)
  VRIJG61 : BOOL ; (* 95.0 !vrijgave fase *)
  VRIJG62 : BOOL ; (* 95.1 !vrijgave fase *)
  VRIJG63 : BOOL ; (* 95.2 !vrijgave fase *)
  VRIJG64 : BOOL ; (* 95.3 !vrijgave fase *)
  VRIJG65 : BOOL ; (* 96.0 !vrijgave fase *)
  VRIJG66 : BOOL ; (* 96.1 !vrijgave fase *)
  VRIJG67 : BOOL ; (* 96.2 !vrijgave fase *)
  VRIJG68 : BOOL ; (* 96.3 !vrijgave fase *)
  VRIJG69 : BOOL ; (* 97.0 !vrijgave fase *)
  VRIJG70 : BOOL ; (* 97.1 !vrijgave fase *)
  VRIJG71 : BOOL ; (* 97.2 !vrijgave fase *)
  VRIJG72 : BOOL ; (* 97.3 !vrijgave fase *)
  VRIJG73 : BOOL ; (* 98.0 !vrijgave fase *)
  VRIJG74 : BOOL ; (* 98.1 !vrijgave fase *)
  VRIJG75 : BOOL ; (* 98.2 !vrijgave fase *)
  VRIJG76 : BOOL ; (* 98.3 !vrijgave fase *)
  VRIJG77 : BOOL ; (* 99.0 !vrijgave fase *)
  VRIJG78 : BOOL ; (* 99.1 !vrijgave fase *)
  ALM0I02 : BOOL ; (* 112.0 !stuurlucht te laag *)
  BDR0I00 : BOOL ; (* 112.1 !bedrijfskeuze schak. "REGENERATIE" *)
  BDR0I01 : BOOL ; (* 112.2 !bedrijfskeuze schak. "STAND_BY" *)
  BDR0I02 : BOOL ; (* 112.3 !bedrijfskeuze schak. "NORMAAL" *)
  BDR0I03 : BOOL ; (* 113.0 !bedrijfskeuze schak. "MCS_400" *)
  AKTIEF : BOOL ; (* 113.1 !aktiveren bedrijfskeuze *)
  STAPDRKN : BOOL ; (* 113.2 !doorstappen lichtkrant *)
  REG0I04 : BOOL ; (* 113.3 !keuzeschak.regen. automatisch *)
  REG0I05 : BOOL ; (* 114.0 !drukkn.doorstappen regeneratie *)
  REG0I06 : BOOL ; (* 114.1 !drukkn.aktiveren gekozen fase *)
  ENTER_drukknop : BOOL ; (* 114.2 !ENTER_drukknop *)
  REG0I10 : BOOL ; (* 114.3 !detectieschakelaar CMF gevuld *)
  REG0I11 : BOOL ; (* 115.0 !detectieschakelaar CMF geledigd *)
  LOOGNIET : BOOL ; (* 115.1 !schakelaar loog fasen (1=) overslaan *)
  ALM0I39 : BOOL ; (* 115.2 !P10 therm. gestoord *)
  unnamed_115_3 : BOOL ; (* 115.3  *)
  BDR0I07 : BOOL ; (* 116.0 !P10 automatisch *)
  REG0I07 : BOOL ; (* 116.1 !P11 paraat *)
  REG0I08 : BOOL ; (* 116.2 !keuzeschakelaar CMF handmatig vullen *)
  REG0I09 : BOOL ; (* 116.3 !keuzeschakelaar CMF handmatig ledigen *)
  ALM0I44 : BOOL ; (* 117.0 !slechte geleidb.h. reinwater *)
  ALM0I06 : BOOL ; (* 117.1 !slechte geleidb.h. spoelfase 32 *)
  ALM0I43 : BOOL ; (* 117.2 !druk vuilproceswater correct *)
  ALM0I37 : BOOL ; (* 117.3 !rondpompdruk correct *)
  ALM0I01 : BOOL ; (* 118.0 !spoeldruk correct *)
  unnamed_118_1 : BOOL ; (* 118.1  *)
  ALM0I09 : BOOL ; (* 118.2 !nivo warme loog *)
  ALM0I10 : BOOL ; (* 118.3 !nivo zoutzuur *)
  ALM0I04 : BOOL ; (* 119.0 !LN_vooralarm vuilwatertank *)
  ALM0I05 : BOOL ; (* 119.1 !LN_alarm vuilwatertank *)
  ALM0I12 : BOOL ; (* 119.2 !nivo neuttank *)
  TMP0I00 : BOOL ; (* 119.3 !termostaat warme loog *)
  ALM0I03 : BOOL ; (* 120.0 !stuursp. gestoord *)
  ALM0I42 : BOOL ; (* 120.1 !nivo proceswater *)
  unnamed_120_2 : BOOL ; (* 120.2  *)
  unnamed_120_3 : BOOL ; (* 120.3  *)
  unnamed_121_0 : BOOL ; (* 121.0  *)
  RESET : BOOL ; (* 121.1  *)
  LAMPTEST : BOOL ; (* 121.2 !lampentest "8" *)
  unnamed_121_3 : BOOL ; (* 121.3  *)
  V1_1_O : BOOL ; (* 122.0 !eindschak.afsluiter V 1.1 geopend *)
  V1_1_C : BOOL ; (* 122.1 !eindschak.afsluiter V 1.1 gesloten *)
  V3_1_O : BOOL ; (* 122.2 !eindschak.afsluiter V 3.1 geopend *)
  V3_1_C : BOOL ; (* 122.3 !eindschak.afsluiter V 3.1 gesloten *)
  V5_1_O : BOOL ; (* 123.0 !eindschak.afsluiter V 5.1 geopend *)
  V5_1_C : BOOL ; (* 123.1 !eindschak.afsluiter V 5.1 gesloten *)
  V7_1_O : BOOL ; (* 123.2 !eindschak.afsluiter V 7.1 geopend *)
  V7_1_C : BOOL ; (* 123.3 !eindschak.afsluiter V 7.1 gesloten *)
  V10_1_O : BOOL ; (* 124.0 !eindschak.afsluiter V10.1 geopend *)
  V10_1_C : BOOL ; (* 124.1 !eindschak.afsluiter V10.1 gesloten *)
  V10_2_O : BOOL ; (* 124.2 !eindschak.afsluiter V10.2 geopend *)
  V10_2_C : BOOL ; (* 124.3 !eindschak.afsluiter V10.2 gesloten *)
  V10_3_O : BOOL ; (* 125.0 !eindschak.afsluiter V10.3 geopend *)
  V10_3_C : BOOL ; (* 125.1 !eindschak.afsluiter V10.3 gesloten *)
  V10_4_O : BOOL ; (* 125.2 !eindschak.afsluiter V10.4 geopend *)
  V10_4_C : BOOL ; (* 125.3 !eindschak.afsluiter V10.4 gesloten *)
  V11_1_O : BOOL ; (* 126.0 !eindschak.afsluiter V11.1 geopend *)
  V11_1_C : BOOL ; (* 126.1 !eindschak.afsluiter V11.1 gesloten *)
  V11_2_O : BOOL ; (* 126.2 !eindschak.afsluiter V11.2 geopend *)
  V11_2_C : BOOL ; (* 126.3 !eindschak.afsluiter V11.2 gesloten *)
  V11_3_O : BOOL ; (* 127.0 !eindschak.afsluiter V11.3 geopend *)
  V11_3_C : BOOL ; (* 127.1 !eindschak.afsluiter V11.3 gesloten *)
  V12_1_O : BOOL ; (* 127.2 !eindschak.afsluiter V12.1 geopend *)
  V12_1_C : BOOL ; (* 127.3 !eindschak.afsluiter V12.1 gesloten *)
  POMP_P10 : BOOL ; (* 140.1  *)
  POMP_P11 : BOOL ; (* 140.2  *)
  CMF_IN : BOOL ; (* 140.3 !inbedrijfmelding CMF naar kast algemeen *)
  V1_1 : BOOL ; (* 141.0  *)
  V1_2 : BOOL ; (* 141.1  *)
  V1_3 : BOOL ; (* 141.2  *)
  V3_1 : BOOL ; (* 141.3  *)
  V3_2 : BOOL ; (* 142.0  *)
  V3_3 : BOOL ; (* 142.1  *)
  V5_1 : BOOL ; (* 142.2  *)
  V5_2 : BOOL ; (* 142.3  *)
  V5_3 : BOOL ; (* 143.0  *)
  V7_1 : BOOL ; (* 143.1  *)
  V7_2 : BOOL ; (* 143.2  *)
  V9_1 : BOOL ; (* 143.3  *)
  V9_2 : BOOL ; (* 144.0  *)
  V9_3 : BOOL ; (* 144.1  *)
  V10_1 : BOOL ; (* 144.2  *)
  V10_2 : BOOL ; (* 144.3  *)
  V10_3 : BOOL ; (* 145.0  *)
  V10_4 : BOOL ; (* 145.1  *)
  V11_1 : BOOL ; (* 145.2  *)
  V11_2 : BOOL ; (* 145.3  *)
  V11_3 : BOOL ; (* 146.0  *)
  V12_1 : BOOL ; (* 146.1  *)
  V12_2 : BOOL ; (* 146.2  *)
  V12_3 : BOOL ; (* 146.3  *)
  V13_1_2 : BOOL ; (* 147.0  *)
  unnamed_147_1 : BOOL ; (* 147.1  *)
  unnamed_147_2 : BOOL ; (* 147.2  *)
  CLAXON : BOOL ; (* 147.3  *)
  DISPL01 : BOOL ; (* 164.0 !aansturing display "01" *)
  DISPL02 : BOOL ; (* 164.1 !aansturing display "02" *)
  DISPL04 : BOOL ; (* 164.2 !aansturing display "04" *)
  DISPL08 : BOOL ; (* 164.3 !aansturing display "08" *)
  DISPL10 : BOOL ; (* 165.0 !aansturing display "10" *)
  DISPL20 : BOOL ; (* 165.1 !aansturing display "20" *)
  DISPL40 : BOOL ; (* 165.2 !aansturing display "40" *)
  DISPL80 : BOOL ; (* 165.3 !aansturing display "80" *)
  CA01 : BOOL ; (* 200.0  *)
  CA02 : BOOL ; (* 200.1  *)
  CA03 : BOOL ; (* 200.2  *)
  CA04 : BOOL ; (* 200.3  *)
  CA05 : BOOL ; (* 201.0  *)
  CA06 : BOOL ; (* 201.1  *)
  CA07 : BOOL ; (* 201.2  *)
  CA08 : BOOL ; (* 201.3  *)
  CA09 : BOOL ; (* 202.0  *)
  CA10 : BOOL ; (* 202.1  *)
  CA11 : BOOL ; (* 202.2  *)
  CA12 : BOOL ; (* 202.3  *)
  CA13 : BOOL ; (* 203.0  *)
  CA14 : BOOL ; (* 203.1  *)
  CA15 : BOOL ; (* 203.2  *)
  CA16 : BOOL ; (* 203.3  *)
  CA17 : BOOL ; (* 204.0  *)
  CA18 : BOOL ; (* 204.1  *)
  CA19 : BOOL ; (* 204.2  *)
  CA20 : BOOL ; (* 204.3  *)
  CA21 : BOOL ; (* 205.0  *)
  CA22 : BOOL ; (* 205.1  *)
  CA23 : BOOL ; (* 205.2  *)
  CA24 : BOOL ; (* 205.3  *)
  CA25 : BOOL ; (* 206.0  *)
  CA26 : BOOL ; (* 206.1  *)
  CA27 : BOOL ; (* 206.2  *)
  CA28 : BOOL ; (* 206.3  *)
  CA29 : BOOL ; (* 207.0  *)
  CA30 : BOOL ; (* 207.1  *)
  CA31 : BOOL ; (* 207.2  *)
  CA32 : BOOL ; (* 207.3  *)
  CA33 : BOOL ; (* 208.0  *)
  CA34 : BOOL ; (* 208.1  *)
  CA35 : BOOL ; (* 208.2  *)
  CA36 : BOOL ; (* 208.3  *)
  CA37 : BOOL ; (* 209.0  *)
  CA38 : BOOL ; (* 209.1  *)
  CA39 : BOOL ; (* 209.2  *)
  CA40 : BOOL ; (* 209.3  *)
  CA41 : BOOL ; (* 210.0  *)
  CA42 : BOOL ; (* 210.1  *)
  CA43 : BOOL ; (* 210.2  *)
  CA44 : BOOL ; (* 210.3  *)
  CA45 : BOOL ; (* 211.0 !lage flow alarm vuilproceswater *)
  CA46 : BOOL ; (* 211.1 !regeneratie cmf niet op tijd gevuld *)
  CA47 : BOOL ; (* 211.2 !regeneratie cmf niet op tijd geledigd *)
  CA48 : BOOL ; (* 211.3  *)
  CA49 : BOOL ; (* 212.0  *)
  CA50 : BOOL ; (* 212.1  *)
  CA51 : BOOL ; (* 212.2  *)
  CA52 : BOOL ; (* 212.3  *)
  CA53 : BOOL ; (* 213.0  *)
  CA54 : BOOL ; (* 213.1  *)
  CA55 : BOOL ; (* 213.2  *)
  CA56 : BOOL ; (* 213.3  *)
  CA57 : BOOL ; (* 214.0  *)
  CA58 : BOOL ; (* 214.1  *)
  CA59 : BOOL ; (* 214.2  *)
  CA60 : BOOL ; (* 214.3  *)
  CA61 : BOOL ; (* 215.0  *)
  CA62 : BOOL ; (* 215.1  *)
  CA63 : BOOL ; (* 215.2  *)
  CA64 : BOOL ; (* 215.3  *)
  CA65 : BOOL ; (* 216.0  *)
  CA66 : BOOL ; (* 216.1  *)
  CA67 : BOOL ; (* 216.2  *)
  CA68 : BOOL ; (* 216.3  *)
  CA69 : BOOL ; (* 217.0  *)
  CA70 : BOOL ; (* 217.1  *)
  CA71 : BOOL ; (* 217.2  *)
  CA72 : BOOL ; (* 217.3  *)
  CA73 : BOOL ; (* 218.0  *)
  CA74 : BOOL ; (* 218.1  *)
  CA75 : BOOL ; (* 218.2  *)
  CA76 : BOOL ; (* 218.3  *)
  CA77 : BOOL ; (* 219.0  *)
  CA78 : BOOL ; (* 219.1  *)
  unnamed_219_2 : BOOL ; (* 219.2  *)
  unnamed_219_3 : BOOL ; (* 219.3  *)
  VERGR01 : BOOL ; (* 220.0  *)
  VERGR02 : BOOL ; (* 220.1 !stuurlucht gestoord *)
  VERGR03 : BOOL ; (* 220.2 !stuurspanning gestoord *)
  VERGR04 : BOOL ; (* 220.3  *)
  VERGR05 : BOOL ; (* 221.0 !vuilwater tank leeg *)
  VERGR06 : BOOL ; (* 221.1  *)
  VERGR07 : BOOL ; (* 221.2  *)
  VERGR08 : BOOL ; (* 221.3  *)
  VERGR09 : BOOL ; (* 222.0  *)
  VERGR10 : BOOL ; (* 222.1  *)
  VERGR11 : BOOL ; (* 222.2  *)
  VERGR12 : BOOL ; (* 222.3  *)
  VERGR13 : BOOL ; (* 223.0  *)
  VERGR14 : BOOL ; (* 223.1  *)
  VERGR15 : BOOL ; (* 223.2  *)
  VERGR16 : BOOL ; (* 223.3  *)
  VERGR17 : BOOL ; (* 224.0  *)
  VERGR18 : BOOL ; (* 224.1  *)
  VERGR19 : BOOL ; (* 224.2  *)
  VERGR20 : BOOL ; (* 224.3  *)
  VERGR21 : BOOL ; (* 225.0  *)
  VERGR22 : BOOL ; (* 225.1  *)
  VERGR23 : BOOL ; (* 225.2  *)
  VERGR24 : BOOL ; (* 225.3  *)
  VERGR25 : BOOL ; (* 226.0  *)
  VERGR26 : BOOL ; (* 226.1  *)
  VERGR27 : BOOL ; (* 226.2  *)
  VERGR28 : BOOL ; (* 226.3  *)
  VERGR29 : BOOL ; (* 227.0  *)
  VERGR30 : BOOL ; (* 227.1  *)
  VERGR31 : BOOL ; (* 227.2  *)
  VERGR32 : BOOL ; (* 227.3  *)
  VERGR33 : BOOL ; (* 228.0  *)
  VERGR34 : BOOL ; (* 228.1  *)
  VERGR35 : BOOL ; (* 228.2  *)
  VERGR36 : BOOL ; (* 228.3  *)
  VERGR37 : BOOL ; (* 229.0 !hoge druk alarm P10 *)
  VERGR38 : BOOL ; (* 229.1  *)
  VERGR39 : BOOL ; (* 229.2  *)
  VERGR40 : BOOL ; (* 229.3  *)
  VERGR41 : BOOL ; (* 230.0  *)
  VERGR42 : BOOL ; (* 230.1  *)
  VERGR43 : BOOL ; (* 230.2 !druk vuilproceswater *)
  VERGR44 : BOOL ; (* 230.3 !rho proceswater *)
  VERGR45 : BOOL ; (* 231.0 !lage flow alarm vuilproceswater *)
  VERGR46 : BOOL ; (* 231.1 !regeneratie cmf niet op tijd gevuld *)
  VERGR47 : BOOL ; (* 231.2 !regeneratie cmf niet op tijd geledigd *)
  VERGR48 : BOOL ; (* 231.3  *)
  VERGR49 : BOOL ; (* 232.0  *)
  VERGR50 : BOOL ; (* 232.1  *)
  VERGR51 : BOOL ; (* 232.2  *)
  VERGR52 : BOOL ; (* 232.3  *)
  VERGR53 : BOOL ; (* 233.0  *)
  VERGR54 : BOOL ; (* 233.1  *)
  VERGR55 : BOOL ; (* 233.2  *)
  VERGR56 : BOOL ; (* 233.3  *)
  VERGR57 : BOOL ; (* 234.0  *)
  VERGR58 : BOOL ; (* 234.1  *)
  VERGR59 : BOOL ; (* 234.2  *)
  VERGR60 : BOOL ; (* 234.3  *)
  VERGR61 : BOOL ; (* 235.0  *)
  VERGR62 : BOOL ; (* 235.1  *)
  VERGR63 : BOOL ; (* 235.2  *)
  VERGR64 : BOOL ; (* 235.3  *)
  VERGR65 : BOOL ; (* 236.0  *)
  VERGR66 : BOOL ; (* 236.1  *)
  VERGR67 : BOOL ; (* 236.2  *)
  VERGR68 : BOOL ; (* 236.3  *)
  VERGR69 : BOOL ; (* 237.0  *)
  VERGR70 : BOOL ; (* 237.1  *)
  VERGR71 : BOOL ; (* 237.2  *)
  VERGR72 : BOOL ; (* 237.3  *)
  VERGR73 : BOOL ; (* 238.0  *)
  VERGR74 : BOOL ; (* 238.1  *)
  VERGR75 : BOOL ; (* 238.2  *)
  VERGR76 : BOOL ; (* 238.3  *)
  VERGR77 : BOOL ; (* 239.0  *)
  VERGR78 : BOOL ; (* 239.1  *)
  unnamed_239_2 : BOOL ; (* 239.2  *)
  unnamed_239_3 : BOOL ; (* 239.3  *)
  MELD01 : BOOL ; (* 240.0  *)
  MELD02 : BOOL ; (* 240.1  *)
  MELD03 : BOOL ; (* 240.2  *)
  MELD04 : BOOL ; (* 240.3  *)
  MELD05 : BOOL ; (* 241.0  *)
  MELD06 : BOOL ; (* 241.1  *)
  MELD07 : BOOL ; (* 241.2  *)
  MELD08 : BOOL ; (* 241.3  *)
  MELD09 : BOOL ; (* 242.0  *)
  MELD10 : BOOL ; (* 242.1  *)
  MELD11 : BOOL ; (* 242.2  *)
  MELD12 : BOOL ; (* 242.3  *)
  MELD13 : BOOL ; (* 243.0  *)
  MELD14 : BOOL ; (* 243.1  *)
  MELD15 : BOOL ; (* 243.2  *)
  MELD16 : BOOL ; (* 243.3  *)
  MELD17 : BOOL ; (* 244.0  *)
  MELD18 : BOOL ; (* 244.1  *)
  MELD19 : BOOL ; (* 244.2  *)
  MELD20 : BOOL ; (* 244.3  *)
  MELD21 : BOOL ; (* 245.0  *)
  MELD22 : BOOL ; (* 245.1  *)
  MELD23 : BOOL ; (* 245.2  *)
  MELD24 : BOOL ; (* 245.3  *)
  MELD25 : BOOL ; (* 246.0  *)
  MELD26 : BOOL ; (* 246.1  *)
  MELD27 : BOOL ; (* 246.2  *)
  MELD28 : BOOL ; (* 246.3  *)
  MELD29 : BOOL ; (* 247.0  *)
  MELD30 : BOOL ; (* 247.1  *)
  MELD31 : BOOL ; (* 247.2  *)
  MELD32 : BOOL ; (* 247.3  *)
  MELD33 : BOOL ; (* 248.0  *)
  MELD34 : BOOL ; (* 248.1  *)
  MELD35 : BOOL ; (* 248.2  *)
  MELD36 : BOOL ; (* 248.3  *)
  MELD37 : BOOL ; (* 249.0  *)
  MELD38 : BOOL ; (* 249.1  *)
  MELD39 : BOOL ; (* 249.2  *)
  MELD40 : BOOL ; (* 249.3  *)
  MELD41 : BOOL ; (* 250.0  *)
  MELD42 : BOOL ; (* 250.1  *)
  MELD43 : BOOL ; (* 250.2  *)
  MELD44 : BOOL ; (* 250.3  *)
  MELD45 : BOOL ; (* 251.0 !lage flow alarm vuilproceswater *)
  MELD46 : BOOL ; (* 251.1 !regeneratie cmf niet op tijd gevuld *)
  MELD47 : BOOL ; (* 251.2 !regeneratie cmf niet op tijd geledigd *)
  MELD48 : BOOL ; (* 251.3  *)
  MELD49 : BOOL ; (* 252.0  *)
  MELD50 : BOOL ; (* 252.1  *)
  MELD51 : BOOL ; (* 252.2  *)
  MELD52 : BOOL ; (* 252.3  *)
  MELD53 : BOOL ; (* 253.0  *)
  MELD54 : BOOL ; (* 253.1  *)
  MELD55 : BOOL ; (* 253.2  *)
  MELD56 : BOOL ; (* 253.3  *)
  MELD57 : BOOL ; (* 254.0  *)
  MELD58 : BOOL ; (* 254.1  *)
  MELD59 : BOOL ; (* 254.2  *)
  MELD60 : BOOL ; (* 254.3  *)
  MELD61 : BOOL ; (* 255.0  *)
  MELD62 : BOOL ; (* 255.1  *)
  MELD63 : BOOL ; (* 255.2  *)
  MELD64 : BOOL ; (* 255.3  *)
  MELD65 : BOOL ; (* 256.0  *)
  MELD66 : BOOL ; (* 256.1  *)
  MELD67 : BOOL ; (* 256.2  *)
  MELD68 : BOOL ; (* 256.3  *)
  MELD69 : BOOL ; (* 257.0  *)
  MELD70 : BOOL ; (* 257.1  *)
  MELD71 : BOOL ; (* 257.2  *)
  MELD72 : BOOL ; (* 257.3  *)
  MELD73 : BOOL ; (* 258.0  *)
  MELD74 : BOOL ; (* 258.1  *)
  MELD75 : BOOL ; (* 258.2  *)
  MELD76 : BOOL ; (* 258.3  *)
  MELD77 : BOOL ; (* 259.0  *)
  MELD78 : BOOL ; (* 259.1  *)
  unnamed_259_2 : BOOL ; (* 259.2  *)
  unnamed_259_3 : BOOL ; (* 259.3  *)
  ALM1B01 : BOOL ; (* 260.0  *)
  ALM1B02 : BOOL ; (* 260.1  *)
  ALM1B03 : BOOL ; (* 260.2  *)
  ALM1B04 : BOOL ; (* 260.3  *)
  ALM1B05 : BOOL ; (* 261.0  *)
  ALM1B06 : BOOL ; (* 261.1  *)
  ALM1B07 : BOOL ; (* 261.2  *)
  ALM1B08 : BOOL ; (* 261.3  *)
  ALM1B09 : BOOL ; (* 262.0  *)
  ALM1B10 : BOOL ; (* 262.1  *)
  ALM1B11 : BOOL ; (* 262.2  *)
  ALM1B12 : BOOL ; (* 262.3  *)
  ALM1B13 : BOOL ; (* 263.0  *)
  ALM1B14 : BOOL ; (* 263.1  *)
  ALM1B15 : BOOL ; (* 263.2  *)
  ALM1B16 : BOOL ; (* 263.3  *)
  ALM1B17 : BOOL ; (* 264.0  *)
  ALM1B18 : BOOL ; (* 264.1  *)
  ALM1B19 : BOOL ; (* 264.2  *)
  ALM1B20 : BOOL ; (* 264.3  *)
  ALM1B21 : BOOL ; (* 265.0  *)
  ALM1B22 : BOOL ; (* 265.1  *)
  ALM1B23 : BOOL ; (* 265.2  *)
  ALM1B24 : BOOL ; (* 265.3  *)
  ALM1B25 : BOOL ; (* 266.0  *)
  ALM1B26 : BOOL ; (* 266.1  *)
  ALM1B27 : BOOL ; (* 266.2  *)
  ALM1B28 : BOOL ; (* 266.3  *)
  ALM1B29 : BOOL ; (* 267.0  *)
  ALM1B30 : BOOL ; (* 267.1  *)
  ALM1B31 : BOOL ; (* 267.2  *)
  ALM1B32 : BOOL ; (* 267.3  *)
  ALM1B33 : BOOL ; (* 268.0  *)
  ALM1B34 : BOOL ; (* 268.1  *)
  ALM1B35 : BOOL ; (* 268.2  *)
  ALM1B36 : BOOL ; (* 268.3  *)
  ALM1B37 : BOOL ; (* 269.0  *)
  ALM1B38 : BOOL ; (* 269.1  *)
  ALM1B39 : BOOL ; (* 269.2  *)
  ALM1B40 : BOOL ; (* 269.3  *)
  ALM1B41 : BOOL ; (* 270.0  *)
  ALM1B42 : BOOL ; (* 270.1  *)
  ALM1B43 : BOOL ; (* 270.2  *)
  ALM1B44 : BOOL ; (* 270.3  *)
  ALM1B45 : BOOL ; (* 271.0  *)
  ALM1B46 : BOOL ; (* 271.1  *)
  ALM1B47 : BOOL ; (* 271.2  *)
  ALM1B48 : BOOL ; (* 271.3  *)
  ALM1B49 : BOOL ; (* 272.0  *)
  ALM1B50 : BOOL ; (* 272.1  *)
  ALM1B51 : BOOL ; (* 272.2  *)
  ALM1B52 : BOOL ; (* 272.3  *)
  ALM1B53 : BOOL ; (* 273.0  *)
  ALM1B54 : BOOL ; (* 273.1  *)
  ALM1B55 : BOOL ; (* 273.2  *)
  ALM1B56 : BOOL ; (* 273.3  *)
  ALM1B57 : BOOL ; (* 274.0  *)
  ALM1B58 : BOOL ; (* 274.1  *)
  ALM1B59 : BOOL ; (* 274.2  *)
  ALM1B60 : BOOL ; (* 274.3  *)
  ALM1B61 : BOOL ; (* 275.0  *)
  ALM1B62 : BOOL ; (* 275.1  *)
  ALM1B63 : BOOL ; (* 275.2  *)
  ALM1B64 : BOOL ; (* 275.3  *)
  ALM1B65 : BOOL ; (* 276.0  *)
  ALM1B66 : BOOL ; (* 276.1  *)
  ALM1B67 : BOOL ; (* 276.2  *)
  ALM1B68 : BOOL ; (* 276.3  *)
  ALM1B69 : BOOL ; (* 277.0  *)
  ALM1B70 : BOOL ; (* 277.1  *)
  ALM1B71 : BOOL ; (* 277.2  *)
  ALM1B72 : BOOL ; (* 277.3  *)
  ALM1B73 : BOOL ; (* 278.0  *)
  ALM1B74 : BOOL ; (* 278.1  *)
  ALM1B75 : BOOL ; (* 278.2  *)
  ALM1B76 : BOOL ; (* 278.3  *)
  ALM1B77 : BOOL ; (* 279.0  *)
  ALM1B78 : BOOL ; (* 279.1  *)
  unnamed_279_2 : BOOL ; (* 279.2  *)
  unnamed_279_3 : BOOL ; (* 279.3  *)
  ALM2B01 : BOOL ; (* 280.0  *)
  ALM2B02 : BOOL ; (* 280.1  *)
  ALM2B03 : BOOL ; (* 280.2  *)
  ALM2B04 : BOOL ; (* 280.3  *)
  ALM2B05 : BOOL ; (* 281.0  *)
  ALM2B06 : BOOL ; (* 281.1  *)
  ALM2B07 : BOOL ; (* 281.2  *)
  ALM2B08 : BOOL ; (* 281.3  *)
  ALM2B09 : BOOL ; (* 282.0  *)
  ALM2B10 : BOOL ; (* 282.1  *)
  ALM2B11 : BOOL ; (* 282.2  *)
  ALM2B12 : BOOL ; (* 282.3  *)
  ALM2B13 : BOOL ; (* 283.0  *)
  ALM2B14 : BOOL ; (* 283.1  *)
  ALM2B15 : BOOL ; (* 283.2  *)
  ALM2B16 : BOOL ; (* 283.3  *)
  ALM2B17 : BOOL ; (* 284.0  *)
  ALM2B18 : BOOL ; (* 284.1  *)
  ALM2B19 : BOOL ; (* 284.2  *)
  ALM2B20 : BOOL ; (* 284.3  *)
  ALM2B21 : BOOL ; (* 285.0  *)
  ALM2B22 : BOOL ; (* 285.1  *)
  ALM2B23 : BOOL ; (* 285.2  *)
  ALM2B24 : BOOL ; (* 285.3  *)
  ALM2B25 : BOOL ; (* 286.0  *)
  ALM2B26 : BOOL ; (* 286.1  *)
  ALM2B27 : BOOL ; (* 286.2  *)
  ALM2B28 : BOOL ; (* 286.3  *)
  ALM2B29 : BOOL ; (* 287.0  *)
  ALM2B30 : BOOL ; (* 287.1  *)
  ALM2B31 : BOOL ; (* 287.2  *)
  ALM2B32 : BOOL ; (* 287.3  *)
  ALM2B33 : BOOL ; (* 288.0  *)
  ALM2B34 : BOOL ; (* 288.1  *)
  ALM2B35 : BOOL ; (* 288.2  *)
  ALM2B36 : BOOL ; (* 288.3  *)
  ALM2B37 : BOOL ; (* 289.0  *)
  ALM2B38 : BOOL ; (* 289.1  *)
  ALM2B39 : BOOL ; (* 289.2  *)
  ALM2B40 : BOOL ; (* 289.3  *)
  ALM2B41 : BOOL ; (* 290.0  *)
  ALM2B42 : BOOL ; (* 290.1  *)
  ALM2B43 : BOOL ; (* 290.2  *)
  ALM2B44 : BOOL ; (* 290.3  *)
  ALM2B45 : BOOL ; (* 291.0  *)
  ALM2B46 : BOOL ; (* 291.1  *)
  ALM2B47 : BOOL ; (* 291.2  *)
  ALM2B48 : BOOL ; (* 291.3  *)
  ALM2B49 : BOOL ; (* 292.0  *)
  ALM2B50 : BOOL ; (* 292.1  *)
  ALM2B51 : BOOL ; (* 292.2  *)
  ALM2B52 : BOOL ; (* 292.3  *)
  ALM2B53 : BOOL ; (* 293.0  *)
  ALM2B54 : BOOL ; (* 293.1  *)
  ALM2B55 : BOOL ; (* 293.2  *)
  ALM2B56 : BOOL ; (* 293.3  *)
  ALM2B57 : BOOL ; (* 294.0  *)
  ALM2B58 : BOOL ; (* 294.1  *)
  ALM2B59 : BOOL ; (* 294.2  *)
  ALM2B60 : BOOL ; (* 294.3  *)
  ALM2B61 : BOOL ; (* 295.0  *)
  ALM2B62 : BOOL ; (* 295.1  *)
  ALM2B63 : BOOL ; (* 295.2  *)
  ALM2B64 : BOOL ; (* 295.3  *)
  ALM2B65 : BOOL ; (* 296.0  *)
  ALM2B66 : BOOL ; (* 296.1  *)
  ALM2B67 : BOOL ; (* 296.2  *)
  ALM2B68 : BOOL ; (* 296.3  *)
  ALM2B69 : BOOL ; (* 297.0  *)
  ALM2B70 : BOOL ; (* 297.1  *)
  ALM2B71 : BOOL ; (* 297.2  *)
  ALM2B72 : BOOL ; (* 297.3  *)
  ALM2B73 : BOOL ; (* 298.0  *)
  ALM2B74 : BOOL ; (* 298.1  *)
  ALM2B75 : BOOL ; (* 298.2  *)
  ALM2B76 : BOOL ; (* 298.3  *)
  ALM2B77 : BOOL ; (* 299.0  *)
  ALM2B78 : BOOL ; (* 299.1  *)
  unnamed_299_2 : BOOL ; (* 299.2  *)
  unnamed_299_3 : BOOL ; (* 299.3  *)
  ALM3B01 : BOOL ; (* 300.0  *)
  ALM3B02 : BOOL ; (* 300.1  *)
  ALM3B03 : BOOL ; (* 300.2  *)
  ALM3B04 : BOOL ; (* 300.3  *)
  ALM3B05 : BOOL ; (* 301.0  *)
  ALM3B06 : BOOL ; (* 301.1  *)
  ALM3B07 : BOOL ; (* 301.2  *)
  ALM3B08 : BOOL ; (* 301.3  *)
  ALM3B09 : BOOL ; (* 302.0  *)
  ALM3B10 : BOOL ; (* 302.1  *)
  ALM3B11 : BOOL ; (* 302.2  *)
  ALM3B12 : BOOL ; (* 302.3  *)
  ALM3B13 : BOOL ; (* 303.0  *)
  ALM3B14 : BOOL ; (* 303.1  *)
  ALM3B15 : BOOL ; (* 303.2  *)
  ALM3B16 : BOOL ; (* 303.3  *)
  ALM3B17 : BOOL ; (* 304.0  *)
  ALM3B18 : BOOL ; (* 304.1  *)
  ALM3B19 : BOOL ; (* 304.2  *)
  ALM3B20 : BOOL ; (* 304.3  *)
  ALM3B21 : BOOL ; (* 305.0  *)
  ALM3B22 : BOOL ; (* 305.1  *)
  ALM3B23 : BOOL ; (* 305.2  *)
  ALM3B24 : BOOL ; (* 305.3  *)
  ALM3B25 : BOOL ; (* 306.0  *)
  ALM3B26 : BOOL ; (* 306.1  *)
  ALM3B27 : BOOL ; (* 306.2  *)
  ALM3B28 : BOOL ; (* 306.3  *)
  ALM3B29 : BOOL ; (* 307.0  *)
  ALM3B30 : BOOL ; (* 307.1  *)
  ALM3B31 : BOOL ; (* 307.2  *)
  ALM3B32 : BOOL ; (* 307.3  *)
  ALM3B33 : BOOL ; (* 308.0  *)
  ALM3B34 : BOOL ; (* 308.1  *)
  ALM3B35 : BOOL ; (* 308.2  *)
  ALM3B36 : BOOL ; (* 308.3  *)
  ALM3B37 : BOOL ; (* 309.0  *)
  ALM3B38 : BOOL ; (* 309.1  *)
  ALM3B39 : BOOL ; (* 309.2  *)
  ALM3B40 : BOOL ; (* 309.3  *)
  ALM3B41 : BOOL ; (* 310.0  *)
  ALM3B42 : BOOL ; (* 310.1  *)
  ALM3B43 : BOOL ; (* 310.2  *)
  ALM3B44 : BOOL ; (* 310.3  *)
  ALM3B45 : BOOL ; (* 311.0  *)
  ALM3B46 : BOOL ; (* 311.1  *)
  ALM3B47 : BOOL ; (* 311.2  *)
  ALM3B48 : BOOL ; (* 311.3  *)
  ALM3B49 : BOOL ; (* 312.0  *)
  ALM3B50 : BOOL ; (* 312.1  *)
  ALM3B51 : BOOL ; (* 312.2  *)
  ALM3B52 : BOOL ; (* 312.3  *)
  ALM3B53 : BOOL ; (* 313.0  *)
  ALM3B54 : BOOL ; (* 313.1  *)
  ALM3B55 : BOOL ; (* 313.2  *)
  ALM3B56 : BOOL ; (* 313.3  *)
  ALM3B57 : BOOL ; (* 314.0  *)
  ALM3B58 : BOOL ; (* 314.1  *)
  ALM3B59 : BOOL ; (* 314.2  *)
  ALM3B60 : BOOL ; (* 314.3  *)
  ALM3B61 : BOOL ; (* 315.0  *)
  ALM3B62 : BOOL ; (* 315.1  *)
  ALM3B63 : BOOL ; (* 315.2  *)
  ALM3B64 : BOOL ; (* 315.3  *)
  ALM3B65 : BOOL ; (* 316.0  *)
  ALM3B66 : BOOL ; (* 316.1  *)
  ALM3B67 : BOOL ; (* 316.2  *)
  ALM3B68 : BOOL ; (* 316.3  *)
  ALM3B69 : BOOL ; (* 317.0  *)
  ALM3B70 : BOOL ; (* 317.1  *)
  ALM3B71 : BOOL ; (* 317.2  *)
  ALM3B72 : BOOL ; (* 317.3  *)
  ALM3B73 : BOOL ; (* 318.0  *)
  ALM3B74 : BOOL ; (* 318.1  *)
  ALM3B75 : BOOL ; (* 318.2  *)
  ALM3B76 : BOOL ; (* 318.3  *)
  ALM3B77 : BOOL ; (* 319.0  *)
  ALM3B78 : BOOL ; (* 319.1  *)
  unnamed_319_2 : BOOL ; (* 319.2  *)
  unnamed_319_3 : BOOL ; (* 319.3  *)
  ALARM01 : BOOL ; (* 320.0 !spoeldruk te hoog *)
  ALARM02 : BOOL ; (* 320.1 !stuurlucht gestoord *)
  ALARM03 : BOOL ; (* 320.2 !stuurspanning gestoord *)
  ALARM04 : BOOL ; (* 320.3 !vuilwatertank bijna leeg *)
  ALARM05 : BOOL ; (* 321.0 !vuilwatertank leeg *)
  ALARM06 : BOOL ; (* 321.1 !geleidbaarheid na spoelen *)
  ALARM07 : BOOL ; (* 321.2 !filtercapaciteit te laag *)
  ALARM08 : BOOL ; (* 321.3 !concentraat afvoer gestoord *)
  ALARM09 : BOOL ; (* 322.0 !nivo warme loog *)
  ALARM10 : BOOL ; (* 322.1 !nivo zoutzuur *)
  ALARM11 : BOOL ; (* 322.2 !temperatuur loog *)
  ALARM12 : BOOL ; (* 322.3 !nivo neutralisatie *)
  ALARM37 : BOOL ; (* 323.0 !P10 rondpompdruk te hoog *)
  ALARM38 : BOOL ; (* 323.1  *)
  ALARM39 : BOOL ; (* 323.2 !P10 niet paraat *)
  ALARM40 : BOOL ; (* 323.3 !P11 niet paraat *)
  ALARM41 : BOOL ; (* 324.0 !concentraatafvoer te hoog *)
  ALARM42 : BOOL ; (* 324.1 !nivo proceswater *)
  ALARM43 : BOOL ; (* 324.2 !druk vuilproceswater *)
  ALARM44 : BOOL ; (* 324.3 !rho proceswater *)
  ALARM45 : BOOL ; (* 325.0 !lage flow alarm vuilproceswater *)
  ALARM46 : BOOL ; (* 325.1 !regeneratie cmf niet op tijd gevuld *)
  ALARM47 : BOOL ; (* 325.2 !regeneratie cmf niet op tijd geledigd *)
  ALARM48 : BOOL ; (* 325.3  *)
  ALARM49 : BOOL ; (* 326.0  *)
  ALARM50 : BOOL ; (* 326.1  *)
  ALARM51 : BOOL ; (* 326.2  *)
  ALARM52 : BOOL ; (* 326.3  *)
  ALARM53 : BOOL ; (* 327.0  *)
  ALARM54 : BOOL ; (* 327.1  *)
  ALARM55 : BOOL ; (* 327.2  *)
  ALARM56 : BOOL ; (* 327.3  *)
  ALARM57 : BOOL ; (* 328.0  *)
  ALARM58 : BOOL ; (* 328.1  *)
  ALARM59 : BOOL ; (* 328.2  *)
  ALARM60 : BOOL ; (* 328.3  *)
  ALARM61 : BOOL ; (* 329.0  *)
  ALARM62 : BOOL ; (* 329.1  *)
  ALARM63 : BOOL ; (* 329.2  *)
  ALARM64 : BOOL ; (* 329.3  *)
  ALARM65 : BOOL ; (* 330.0  *)
  ALARM66 : BOOL ; (* 330.1  *)
  ALARM67 : BOOL ; (* 330.2  *)
  ALARM68 : BOOL ; (* 330.3  *)
  ALARM69 : BOOL ; (* 331.0  *)
  ALARM70 : BOOL ; (* 331.1  *)
  ALARM71 : BOOL ; (* 331.2  *)
  ALARM72 : BOOL ; (* 331.3  *)
  ALARM73 : BOOL ; (* 332.0  *)
  ALARM74 : BOOL ; (* 332.1  *)
  ALARM75 : BOOL ; (* 332.2  *)
  ALARM76 : BOOL ; (* 332.3  *)
  ALARM77 : BOOL ; (* 333.0  *)
  ALARM78 : BOOL ; (* 333.1  *)
  unnamed_333_2 : BOOL ; (* 333.2  *)
  unnamed_333_3 : BOOL ; (* 333.3  *)
  unnamed_334_0 : BOOL ; (* 334.0  *)
  unnamed_334_1 : BOOL ; (* 334.1  *)
  unnamed_334_2 : BOOL ; (* 334.2  *)
  unnamed_334_3 : BOOL ; (* 334.3  *)
  ALM0B00 : BOOL ; (* 335.0 !laadpuls timer *)
  ALM0B01 : BOOL ; (* 335.1 !timer spoeldrukbewaking *)
  ALM0B02 : BOOL ; (* 335.2 !triggerpuls fase 33.1 *)
  ALM0B03 : BOOL ; (* 335.3  *)
  ALM0B04 : BOOL ; (* 336.0 !tijdvertr. rho alarm proceswater *)
  ALM0B05 : BOOL ; (* 336.1  *)
  ALM0B06 : BOOL ; (* 336.2 !tijdvertr.alarm geleidb.h. bedrijf *)
  ALM0B07 : BOOL ; (* 336.3 !temperatuur loog korrekt *)
  ALM0B08 : BOOL ; (* 337.0 !een of meerdere afsl.gestoord *)
  ALM0B09 : BOOL ; (* 337.1 !alarmmelding P10 *)
  ALM0B10 : BOOL ; (* 337.2 !alarmmelding P10 *)
  ALM0B11 : BOOL ; (* 337.3 !dump *)
  ALM0B12 : BOOL ; (* 338.0 !dump *)
  ALM0B13 : BOOL ; (* 338.1  *)
  ALM0B14 : BOOL ; (* 338.2  *)
  ALM0B15 : BOOL ; (* 338.3  *)
  ALM0B16 : BOOL ; (* 339.0  *)
  ALM0B17 : BOOL ; (* 339.1  *)
  ALM0B18 : BOOL ; (* 339.2  *)
  ALM0B19 : BOOL ; (* 339.3  *)
  ALM0B20 : BOOL ; (* 340.0  *)
  ALM0B21 : BOOL ; (* 340.1  *)
  ALM0B22 : BOOL ; (* 340.2  *)
  ALM0B23 : BOOL ; (* 340.3  *)
  ALM0B24 : BOOL ; (* 341.0 !aansturing V1.2,of V3.2,of V5.2 *)
  ALM0T01 : BOOL ; (* 341.1 !triggerpuls *)
  ALM0T02 : BOOL ; (* 341.2 !triggerpuls *)
  ALM0T03 : BOOL ; (* 341.3 !triggerpuls *)
  ALM0T04 : BOOL ; (* 342.0 !triggerpuls *)
  ALM0T05 : BOOL ; (* 342.1 !triggerpuls *)
  ALM0T06 : BOOL ; (* 342.2 !triggerpuls *)
  unnamed_342_3 : BOOL ; (* 342.3  *)
  ALM0B25 : BOOL ; (* 343.0 !regeneratieaanvraag (claxon) *)
  ALM0B26 : BOOL ; (* 343.1 !trigger keuzeschak. REGENERATIE *)
  REG0T00 : BOOL ; (* 345.0 !doorstap triggerpuls *)
  REG0T08 : BOOL ; (* 345.1 !triggerpuls laden timer fase 8 *)
  REG0T09 : BOOL ; (* 345.2 !triggerpuls laden timer fase 9 *)
  REG0T10 : BOOL ; (* 345.3 !triggerpuls laden timer fase 10 *)
  REG0T11 : BOOL ; (* 346.0 !triggerpuls laden timer fase 11 *)
  REG0T12 : BOOL ; (* 346.1 !triggerpuls laden timer fase 12 *)
  REG0T13 : BOOL ; (* 346.2 !triggerpuls laden timer fase 13 *)
  REG0T14 : BOOL ; (* 346.3 !triggerpuls laden timer fase 14 *)
  REG0T15 : BOOL ; (* 347.0 !triggerpuls laden timer fase 15 *)
  REG0T16 : BOOL ; (* 347.1 !triggerpuls laden timer fase 16 *)
  REG0T17 : BOOL ; (* 347.2 !triggerpuls laden timer fase 17 *)
  REG0T18 : BOOL ; (* 347.3 !triggerpuls laden timer fase 18 *)
  REG0T19 : BOOL ; (* 348.0 !triggerpuls laden timer fase 19 *)
  REG0T20 : BOOL ; (* 348.1 !triggerpuls laden timer fase 20 *)
  REG0T21 : BOOL ; (* 348.2 !triggerpuls laden timer fase 21 *)
  REG0T22 : BOOL ; (* 348.3 !triggerpuls laden timer fase 22 *)
  REG0T23 : BOOL ; (* 349.0 !triggerpuls laden timer fase 23 *)
  REG0T24 : BOOL ; (* 349.1 !triggerpuls laden timer fase 24 *)
  REG0T25 : BOOL ; (* 349.2 !triggerpuls laden timer fase 25 *)
  REG0T26 : BOOL ; (* 349.3 !triggerpuls laden timer fase 26 *)
  REG0T27 : BOOL ; (* 350.0 !triggerpuls laden timer fase 27 *)
  REG0T28 : BOOL ; (* 350.1 !triggerpuls laden timer fase 28 *)
  REG0T29 : BOOL ; (* 350.2 !triggerpuls laden timer fase 29 *)
  REG0T30 : BOOL ; (* 350.3 !triggerpuls laden timer fase 30 *)
  REG0T31 : BOOL ; (* 351.0 !triggerpuls laden timer fase 31 *)
  REG0T32 : BOOL ; (* 351.1 !triggerpuls laden timer fase 32 *)
  REG0T33 : BOOL ; (* 351.2 !triggerpuls laden timer fase 33 *)
  REG0T34 : BOOL ; (* 351.3 !triggerpuls laden timer fase 33.1 *)
  REG0T35 : BOOL ; (* 352.0 !triggerpuls *)
  STAP_3 : BOOL ; (* 352.1 !stappen fase register *)
  REG0T36 : BOOL ; (* 352.2 !triggerpuls *)
  unnamed_352_3 : BOOL ; (* 352.3  *)
  REG0B35 : BOOL ; (* 353.0 !einde fasetimer *)
  REG0B36 : BOOL ; (* 353.1 !startpuls regen. fasen 8 t/m 33.1 *)
  REG0B37 : BOOL ; (* 353.2 !hand doorstap (triggerpuls) *)
  unnamed_353_3 : BOOL ; (* 353.3  *)
  REG0B39 : BOOL ; (* 354.0 !uurpuls *)
  REG0B40 : BOOL ; (* 354.1 !einde regeneratie *)
  REG0B41 : BOOL ; (* 354.2 !reg.aanvr. op tijdbasis *)
  REG0B42 : BOOL ; (* 354.3 !regeneratieaanvraag *)
  REG0B43 : BOOL ; (* 355.0 !start spuien *)
  REG0B44 : BOOL ; (* 355.1 !laadpuls spui_timer *)
  REG0B45 : BOOL ; (* 355.2 !einde spuitijd *)
  REG0B46 : BOOL ; (* 355.3 !openen commando V10.4 *)
  REG0B47 : BOOL ; (* 356.0 !startvoorw.regen.fout *)
  REG0B48 : BOOL ; (* 356.1 !regen.startvoorwaarden *)
  REG0B49 : BOOL ; (* 356.2 !geleidb.h. QIA1 ok *)
  REG0B50 : BOOL ; (* 356.3 !geleidb.h. QIA2 ok *)
  DUMP1 : BOOL ; (* 357.0  *)
  DUMP2 : BOOL ; (* 357.1  *)
  DUMP3 : BOOL ; (* 357.2  *)
  unnamed_357_3 : BOOL ; (* 357.3  *)
  REG0B51 : BOOL ; (* 358.0 !vertr. controle spoelwater fase 32 *)
  REG0B52 : BOOL ; (* 358.1 !vertr. controle proceswater fase 33 *)
  REG0B53 : BOOL ; (* 358.2 !handmatig vullen CMF *)
  REG0B54 : BOOL ; (* 358.3 !handmatig ledigen CMF *)
  REG0B55 : BOOL ; (* 359.0 !regeneratiefasen CMF vullen *)
  REG0B56 : BOOL ; (* 359.1 !regeneratiefasen CMF ledigen *)
  REG0B57 : BOOL ; (* 359.2 !doorstap reg.fase CMF gevuld *)
  REG0B58 : BOOL ; (* 359.3 !tijdvertr. detectieschakelaar CMF gevuld *)
  BDR0B12 : BOOL ; (* 360.0 !startpuls wachttijd fase 7 *)
  BDR0B13 : BOOL ; (* 360.1 !min. puls *)
  BDR0B14 : BOOL ; (* 360.2 !einde 8 uur (wachttijd) fase 7 *)
  BDR0B15 : BOOL ; (* 360.3 !fase 2,4,6 *)
  BDR0B16 : BOOL ; (* 361.0 !puls fasebegin fasen 2,4,6 *)
  BDR0B17 : BOOL ; (* 361.1 !fase 7 *)
  BDR0B18 : BOOL ; (* 361.2 !puls laden fasetimer fase 7 *)
  BDR0B19 : BOOL ; (* 361.3 !fasetimer fase 7 (einde fase 7) *)
  BDR0B20 : BOOL ; (* 362.0 !puls drukknop aktiveren *)
  BDR0B21 : BOOL ; (* 362.1 !vrijgave uitgangen (aktiveren) *)
  BDR0B22 : BOOL ; (* 362.2 !puls handbedrijf *)
  BDR0B23 : BOOL ; (* 362.3 !triggerpuls doorstappen *)
  BDR0T08 : BOOL ; (* 363.0 !triggerpuls *)
  BDR0T09 : BOOL ; (* 363.1 !tr.puls laden wachttijd fase 7 *)
  BDR0T10 : BOOL ; (* 363.2 !tr.puls begin fasen 2,4,6 *)
  BDR0T11 : BOOL ; (* 363.3  *)
  BDR0T12 : BOOL ; (* 364.0 !triggerpuls *)
  BDR0T13 : BOOL ; (* 364.1 !triggerpuls *)
  BDR0T14 : BOOL ; (* 364.2 !triggerpuls *)
  BDR0T15 : BOOL ; (* 364.3 !triggerpuls *)
  TIMER_61 : BOOL ; (* 365.0 !pauzetijd aansturing afsl. V12.1 *)
  TIMER_62 : BOOL ; (* 365.1 !pulstijd aansturing afsl. V12.1 *)
  EIND_88 : BOOL ; (* 365.2 !einde aanloopfase 88 *)
  TMRGEL88 : BOOL ; (* 365.3 !timer 1 min. geleidb. goed in fase 88 *)
  TRGBEG88 : BOOL ; (* 366.0 !triggerpuls begin fase 88 *)
  FLW0B00 : BOOL ; (* 370.0 !F=C *)
  FLW0B01 : BOOL ; (* 370.1 !F<C *)
  FLW0B02 : BOOL ; (* 370.2 !F>C *)
  FLW0B03 : BOOL ; (* 370.3 !F niet gelijk aan C *)
  FLW1B00 : BOOL ; (* 371.0 !F=C *)
  FLW1B01 : BOOL ; (* 371.1 !F<C *)
  FLW1B02 : BOOL ; (* 371.2 !F>C *)
  FLW1B03 : BOOL ; (* 371.3 !F niet gelijk aan C *)
  FLW2B00 : BOOL ; (* 372.0 !F=C *)
  FLW2B01 : BOOL ; (* 372.1 !F<C *)
  FLW2B02 : BOOL ; (* 372.2 !F>C *)
  FLW2B03 : BOOL ; (* 372.3 !F niet gelijk aan C *)
  FLW3B00 : BOOL ; (* 373.0 !F=C *)
  FLW3B01 : BOOL ; (* 373.1 !F<C *)
  FLW3B02 : BOOL ; (* 373.2 !F>C *)
  FLW3B03 : BOOL ; (* 373.3 !F niet gelijk aan C *)
  FLW0B04 : BOOL ; (* 374.0 !tijdvertr. flowalarm *)
  FLW1B04 : BOOL ; (* 374.1 !tijdvertr. flowalarm *)
  FLW2B04 : BOOL ; (* 374.2 !tijdvertr. flowalarm *)
  FLW3B04 : BOOL ; (* 374.3 !tijdvertr. flowalarm *)
  GEL0B00 : BOOL ; (* 375.0 !F=C *)
  GEL0B01 : BOOL ; (* 375.1 !F<C *)
  GEL0B02 : BOOL ; (* 375.2 !F>C *)
  GEL0B03 : BOOL ; (* 375.3 !F niet gelijk aan C *)
  GEL1B00 : BOOL ; (* 376.0 !F=C *)
  GEL1B01 : BOOL ; (* 376.1 !F<C *)
  GEL1B02 : BOOL ; (* 376.2 !F>C *)
  GEL1B03 : BOOL ; (* 376.3 !F niet gelijk aan C *)
  GEL2B00 : BOOL ; (* 377.0 !F=C *)
  GEL2B01 : BOOL ; (* 377.1 !F<C *)
  GEL2B02 : BOOL ; (* 377.2 !F>C *)
  GEL2B03 : BOOL ; (* 377.3 !F niet gelijk aan C *)
  GEL3B00 : BOOL ; (* 378.0 !F=C *)
  GEL3B01 : BOOL ; (* 378.1 !F<C *)
  GEL3B02 : BOOL ; (* 378.2 !F>C *)
  GEL3B03 : BOOL ; (* 378.3 !F niet gelijk aan C *)
  GEL0B04 : BOOL ; (* 379.0 !tijdvertr. flowalarm *)
  GEL1B04 : BOOL ; (* 379.1 !tijdvertr. flowalarm *)
  GEL2B04 : BOOL ; (* 379.2 !tijdvertr. flowalarm *)
  GEL3B04 : BOOL ; (* 379.3 !tijdvertr. flowalarm *)
  DSP0L01 : BOOL ; (* 380.0 !hulp aansturing display "01" *)
  DSP0L02 : BOOL ; (* 380.1 !hulp aansturing display "02" *)
  DSP0L04 : BOOL ; (* 380.2 !hulp aansturing display "04" *)
  DSP0L08 : BOOL ; (* 380.3 !hulp aansturing display "08" *)
  DSP0L10 : BOOL ; (* 381.0 !hulp aansturing display "10" *)
  DSP0L20 : BOOL ; (* 381.1 !hulp aansturing display "20" *)
  DSP0L40 : BOOL ; (* 381.2 !hulp aansturing display "40" *)
  DSP0L80 : BOOL ; (* 381.3 !hulp aansturing display "80" *)
  WZC0B04 : BOOL ; (* 386.0 !commando BEDRIJF vanuit wizcon *)
  WZC0B06 : BOOL ; (* 386.2 !commando REGENERATIE vanuit wizcon *)
  WZC0B07 : BOOL ; (* 386.3 !commando SPUIEN vanuit wizcon *)
  WZC0B08 : BOOL ; (* 387.0 !wizconcommando BEDRIJF *)
  WZC0B09 : BOOL ; (* 387.1 !wizconcommando STAND_BY *)
  WZC0B10 : BOOL ; (* 387.2 !wizconcommando REGENERATIE *)
  WZC0B11 : BOOL ; (* 387.3 !wizconcommando SPUIEN *)
  WZC0B12 : BOOL ; (* 388.0 !wizconcommando BEDRIJF + KEUZESCHAK.=SUPERVISOR *)
  WZC0B13 : BOOL ; (* 388.1 !wizconcommando STAND_BY + KEUZESCHAK.=SUPERVISOR *)
  WZC0B14 : BOOL ; (* 388.2 !wizconcommando REGENRATIE + KEUZESCHAK.=SUPERVISOR *)
  WZC0B15 : BOOL ; (* 388.3 !wizconcommando SPUIEN + KEUZESCHAK.=SUPERVISOR *)
  WZC0T00 : BOOL ; (* 389.0 !triggerpuls wizconcommando BEDRIJF *)
  WZC0T02 : BOOL ; (* 389.2 !triggerpuls wizconcommando REGENRATIE *)
  WZC0T03 : BOOL ; (* 389.3 !triggerpuls wizconcommando SPUIEN *)
  WZC0B16 : BOOL ; (* 390.0 !bedrijfsvoering via WIZCON *)
  WZC0T04 : BOOL ; (* 390.1 !triggerpuls einde bedrijf via WIZCON *)
  WZC0B17 : BOOL ; (* 390.2 !puls einde bedrijf via WIZCON *)
  WZC0B18 : BOOL ; (* 390.3 !puls einde bedrijf via schakelaar *)
  REG0B60 : BOOL ; (* 400.0 !regeneratie fase 60 *)
  REG0B61 : BOOL ; (* 400.1 !regeneratie fase 61 *)
  REG0B62 : BOOL ; (* 400.2 !regeneratie fase 62 *)
  REG0B63 : BOOL ; (* 400.3 !regeneratie fase 63 *)
  REG0B64 : BOOL ; (* 401.0 !regeneratie fase 64 *)
  REG0B65 : BOOL ; (* 401.1 !regeneratie fase 65 *)
  TRGSTART : BOOL ; (* 401.2 !triggerpuls start fasen 8 t/m 32 *)
  ZUURLOOG : BOOL ; (* 401.3 !regeneratie met zuur en loog *)
  REG0T60 : BOOL ; (* 402.0 !triggerpuls laden timer fase 60 *)
  REG0T61 : BOOL ; (* 402.1 !triggerpuls laden timer fase 61 *)
  REG0T62 : BOOL ; (* 402.2 !triggerpuls laden timer fase 62 *)
  REG0T63 : BOOL ; (* 402.3 !triggerpuls laden timer fase 63 *)
  REG0T64 : BOOL ; (* 403.0 !triggerpuls laden timer fase 64 *)
  REG0T65 : BOOL ; (* 403.1 !triggerpuls laden timer fase 65 *)
  S_0_1SEC : BOOL ; (* 511.0 !triggerpuls 0,1 sec. *)
  S_1SEC : BOOL ; (* 511.1 !triggerpuls 1,0 sec. *)
  S_10SEC : BOOL ; (* 511.2 !triggerpuls 10 sec. *)
  S_1MIN : BOOL ; (* 511.3 !triggerpuls 1 min. *)
  DWS1_1 : INT ; (* 104 !eenheid DWS *)
  DWS1_2 : INT ; (* 105 !tiental DWS *)
  SETP_0 : INT ; (* 106 !ingevoerde setpoint eenheden *)
  SETP_1 : INT ; (* 107 !ingevoerde setpoint tientallen *)
  SETP_2 : INT ; (* 108 !ingevoerde setpoint honderdtallen *)
  SETP_3 : INT ; (* 109 !ingevoerde setpoint duizendtallen *)
  DWS2_1 : INT ; (* 110 !eenheid DWS *)
  DWS2_2 : INT ; (* 111 !tiental DWS *)
  DISPL_0 : INT ; (* 160 !display aansturing eenh. *)
  DISPL_1 : INT ; (* 161 !display aansturing tiental. *)
  DISPL_2 : INT ; (* 162 !display aansturing honderdt. *)
  DISPL_3 : INT ; (* 163 !display aansturing duizendt. *)
  DSP1 : INT ; (* 164 !aansturing display "eenheden" *)
  DSP2 : INT ; (* 165 !aansturing display "tientallen" *)
  unnamed_0166 : INT ; (* 166  *)
  unnamed_0167 : INT ; (* 167  *)
  ST1BUF1 : INT ; (* 168 !+ *)
  ST2BUF1 : INT ; (* 169 !storingscode lichtkrant *)
  ST3BUF1 : INT ; (* 170 !+ *)
  FLW0D00 : INT ; (* 370 !vergelijkingsresult. *)
  FLW1D00 : INT ; (* 371 !vergelijkingsresult. *)
  FLW2D00 : INT ; (* 372 !vergelijkingsresult. *)
  FLW3D00 : INT ; (* 373 !vergelijkingsresult. *)
  unnamed_0374 : INT ; (* 374  *)
  GEL0D00 : INT ; (* 375 !vergelijkingsresult. *)
  GEL1D00 : INT ; (* 376 !vergelijkingsresult. *)
  GEL2D00 : INT ; (* 377 !vergelijkingsresult. *)
  GEL3D00 : INT ; (* 378 !vergelijkingsresult. *)
  FLW00_2 : INT ; (* 1001 !MSB + *)
  FLW00_1 : INT ; (* 1002 !| flow reinwater *)
  FLW00_0 : INT ; (* 1003 !LSB + *)
  unnamed_1004 : INT ; (* 1004  *)
  FLW01_2 : INT ; (* 1005 !MSB + *)
  FLW01_1 : INT ; (* 1006 !| flow ruwwater *)
  FLW01_0 : INT ; (* 1007 !LSB + *)
  unnamed_1008 : INT ; (* 1008  *)
  FLW02_2 : INT ; (* 1009 !MSB + *)
  FLW02_1 : INT ; (* 1010 !| flow concentraat *)
  FLW02_0 : INT ; (* 1011 !LSB + *)
  unnamed_1012 : INT ; (* 1012  *)
  FLW03_2 : INT ; (* 1013 !MSB + *)
  FLW03_1 : INT ; (* 1014 !| reserve *)
  FLW03_0 : INT ; (* 1015 !LSB + *)
  unnamed_1016 : INT ; (* 1016  *)
  GEL00_2 : INT ; (* 1017 !MSB + *)
  GEL00_1 : INT ; (* 1018 !| geleidbaarheid reinwater *)
  GEL00_0 : INT ; (* 1019 !LSB + *)
  unnamed_1020 : INT ; (* 1020  *)
  GEL01_2 : INT ; (* 1021 !MSB + *)
  GEL01_1 : INT ; (* 1022 !| geleidbaarheid spoelleiding *)
  GEL01_0 : INT ; (* 1023 !LSB + *)
  unnamed_1024 : INT ; (* 1024  *)
  GEL02_2 : INT ; (* 1025 !MSB + *)
  GEL02_1 : INT ; (* 1026 !| reserve *)
  GEL02_0 : INT ; (* 1027 !LSB + *)
  unnamed_1028 : INT ; (* 1028  *)
  GEL03_2 : INT ; (* 1029 !MSB + *)
  GEL03_1 : INT ; (* 1030 !| reserve *)
  GEL03_0 : INT ; (* 1031 !LSB + *)
  DSP00_0 : INT ; (* 1100 !display 00 eenheden *)
  DSP00_1 : INT ; (* 1101 !display 00 tientallen *)
  DSP00_2 : INT ; (* 1102 !display 00 honderdtallen *)
  DSP00_3 : INT ; (* 1103 !display 00 duizendtallen *)
  DSP01_0 : INT ; (* 1104 !display 01 eenheden *)
  DSP01_1 : INT ; (* 1105 !display 01 tientallen *)
  DSP01_2 : INT ; (* 1106 !display 01 honderdtallen *)
  DSP01_3 : INT ; (* 1107 !display 01 duizendtallen *)
  DSP02_0 : INT ; (* 1108 !display 02 eenheden *)
  DSP02_1 : INT ; (* 1109 !display 02 tientallen *)
  DSP02_2 : INT ; (* 1110 !display 02 honderdtallen *)
  DSP02_3 : INT ; (* 1111 !display 02 duizendtallen *)
  DSP03_0 : INT ; (* 1112 !display 03 eenheden *)
  DSP03_1 : INT ; (* 1113 !display 03 tientallen *)
  DSP03_2 : INT ; (* 1114 !display 03 honderdtallen *)
  DSP03_3 : INT ; (* 1115 !display 03 duizendtallen *)
  DSP04_0 : INT ; (* 1116 !display 04 eenheden *)
  DSP04_1 : INT ; (* 1117 !display 04 tientallen *)
  DSP04_2 : INT ; (* 1118 !display 04 honderdtallen *)
  DSP04_3 : INT ; (* 1119 !display 04 duizendtallen *)
  DSP05_0 : INT ; (* 1120 !display 05 eenheden *)
  DSP05_1 : INT ; (* 1121 !display 05 tientallen *)
  DSP05_2 : INT ; (* 1122 !display 05 honderdtallen *)
  DSP05_3 : INT ; (* 1123 !display 05 duizendtallen *)
  DSP06_0 : INT ; (* 1124 !display 06 eenheden *)
  DSP06_1 : INT ; (* 1125 !display 06 tientallen *)
  DSP06_2 : INT ; (* 1126 !display 06 honderdtallen *)
  DSP06_3 : INT ; (* 1127 !display 06 duizendtallen *)
  DSP07_0 : INT ; (* 1128 !display 07 eenheden *)
  DSP07_1 : INT ; (* 1129 !display 07 tientallen *)
  DSP07_2 : INT ; (* 1130 !display 07 honderdtallen *)
  DSP07_3 : INT ; (* 1131 !display 07 duizendtallen *)
  DSP08_0 : INT ; (* 1132 !display 08 eenheden *)
  DSP08_1 : INT ; (* 1133 !display 08 tientallen *)
  DSP08_2 : INT ; (* 1134 !display 08 honderdtallen *)
  DSP08_3 : INT ; (* 1135 !display 08 duizendtallen *)
  DSP09_0 : INT ; (* 1136 !display 09 eenheden *)
  DSP09_1 : INT ; (* 1137 !display 09 tientallen *)
  DSP09_2 : INT ; (* 1138 !display 09 honderdtallen *)
  DSP09_3 : INT ; (* 1139 !display 09 duizendtallen *)
  DSP10_0 : INT ; (* 1140 !display 10 eenheden *)
  DSP10_1 : INT ; (* 1141 !display 10 tientallen *)
  DSP10_2 : INT ; (* 1142 !display 10 honderdtallen *)
  DSP10_3 : INT ; (* 1143 !display 10 duizendtallen *)
  DSP11_0 : INT ; (* 1144 !display 11 eenheden *)
  DSP11_1 : INT ; (* 1145 !display 11 tientallen *)
  DSP11_2 : INT ; (* 1146 !display 11 honderdtallen *)
  DSP11_3 : INT ; (* 1147 !display 11 duizendtallen *)
  DSP12_0 : INT ; (* 1148 !display 12 eenheden *)
  DSP12_1 : INT ; (* 1149 !display 12 tientallen *)
  DSP12_2 : INT ; (* 1150 !display 12 honderdtallen *)
  DSP12_3 : INT ; (* 1151 !display 12 duizendtallen *)
  DSP13_0 : INT ; (* 1152 !display 13 eenheden *)
  DSP13_1 : INT ; (* 1153 !display 13 tientallen *)
  DSP13_2 : INT ; (* 1154 !display 13 honderdtallen *)
  DSP13_3 : INT ; (* 1155 !display 13 duizendtallen *)
  DSP14_0 : INT ; (* 1156 !display 14 eenheden *)
  DSP14_1 : INT ; (* 1157 !display 14 tientallen *)
  DSP14_2 : INT ; (* 1158 !display 14 honderdtallen *)
  DSP14_3 : INT ; (* 1159 !display 14 duizendtallen *)
  DSP15_0 : INT ; (* 1160 !display 15 eenheden *)
  DSP15_1 : INT ; (* 1161 !display 15 tientallen *)
  DSP15_2 : INT ; (* 1162 !display 15 honderdtallen *)
  DSP15_3 : INT ; (* 1163 !display 15 duizendtallen *)
  DSP16_0 : INT ; (* 1164 !display 16 eenheden *)
  DSP16_1 : INT ; (* 1165 !display 16 tientallen *)
  DSP16_2 : INT ; (* 1166 !display 16 honderdtallen *)
  DSP16_3 : INT ; (* 1167 !display 16 duizendtallen *)
  DSP17_0 : INT ; (* 1168 !display 17 eenheden *)
  DSP17_1 : INT ; (* 1169 !display 17 tientallen *)
  DSP17_2 : INT ; (* 1170 !display 17 honderdtallen *)
  DSP17_3 : INT ; (* 1171 !display 17 duizendtallen *)
  DSP18_0 : INT ; (* 1172 !display 18 eenheden *)
  DSP18_1 : INT ; (* 1173 !display 18 tientallen *)
  DSP18_2 : INT ; (* 1174 !display 18 honderdtallen *)
  DSP18_3 : INT ; (* 1175 !display 18 duizendtallen *)
  DSP19_0 : INT ; (* 1176 !display 19 eenheden *)
  DSP19_1 : INT ; (* 1177 !display 19 tientallen *)
  DSP19_2 : INT ; (* 1178 !display 19 honderdtallen *)
  DSP19_3 : INT ; (* 1179 !display 19 duizendtallen *)
  DSP20_0 : INT ; (* 1180 !display 20 eenheden *)
  DSP20_1 : INT ; (* 1181 !display 20 tientallen *)
  DSP20_2 : INT ; (* 1182 !display 20 honderdtallen *)
  DSP20_3 : INT ; (* 1183 !display 20 duizendtallen *)
  DSP21_0 : INT ; (* 1184 !display 21 eenheden *)
  DSP21_1 : INT ; (* 1185 !display 21 tientallen *)
  DSP21_2 : INT ; (* 1186 !display 21 honderdtallen *)
  DSP21_3 : INT ; (* 1187 !display 21 duizendtallen *)
  DSP22_0 : INT ; (* 1188 !display 22 eenheden *)
  DSP22_1 : INT ; (* 1189 !display 22 tientallen *)
  DSP22_2 : INT ; (* 1190 !display 22 honderdtallen *)
  DSP22_3 : INT ; (* 1191 !display 22 duizendtallen *)
  DSP23_0 : INT ; (* 1192 !display 23 eenheden *)
  DSP23_1 : INT ; (* 1193 !display 23 tientallen *)
  DSP23_2 : INT ; (* 1194 !display 23 honderdtallen *)
  DSP23_3 : INT ; (* 1195 !display 23 duizendtallen *)
  DSP24_0 : INT ; (* 1196 !display 24 eenheden *)
  DSP24_1 : INT ; (* 1197 !display 24 tientallen *)
  DSP24_2 : INT ; (* 1198 !display 24 honderdtallen *)
  DSP24_3 : INT ; (* 1199 !display 24 duizendtallen *)
  DSP25_0 : INT ; (* 1200 !display 25 eenheden *)
  DSP25_1 : INT ; (* 1201 !display 25 tientallen *)
  DSP25_2 : INT ; (* 1202 !display 25 honderdtallen *)
  DSP25_3 : INT ; (* 1203 !display 25 duizendtallen *)
  DSP26_0 : INT ; (* 1204 !display 26 eenheden *)
  DSP26_1 : INT ; (* 1205 !display 26 tientallen *)
  DSP26_2 : INT ; (* 1206 !display 26 honderdtallen *)
  DSP26_3 : INT ; (* 1207 !display 26 duizendtallen *)
  DSP27_0 : INT ; (* 1208 !display 27 eenheden *)
  DSP27_1 : INT ; (* 1209 !display 27 tientallen *)
  DSP27_2 : INT ; (* 1210 !display 27 honderdtallen *)
  DSP27_3 : INT ; (* 1211 !display 27 duizendtallen *)
  DSP28_0 : INT ; (* 1212 !display 28 eenheden *)
  DSP28_1 : INT ; (* 1213 !display 28 tientallen *)
  DSP28_2 : INT ; (* 1214 !display 28 honderdtallen *)
  DSP28_3 : INT ; (* 1215 !display 28 duizendtallen *)
  DSP29_0 : INT ; (* 1216 !display 29 eenheden *)
  DSP29_1 : INT ; (* 1217 !display 29 tientallen *)
  DSP29_2 : INT ; (* 1218 !display 29 honderdtallen *)
  DSP29_3 : INT ; (* 1219 !display 29 duizendtallen *)
  DSP30_0 : INT ; (* 1220 !display 30 eenheden *)
  DSP30_1 : INT ; (* 1221 !display 30 tientallen *)
  DSP30_2 : INT ; (* 1222 !display 30 honderdtallen *)
  DSP30_3 : INT ; (* 1223 !display 30 duizendtallen *)
  DSP31_0 : INT ; (* 1224 !display 31 eenheden *)
  DSP31_1 : INT ; (* 1225 !display 31 tientallen *)
  DSP31_2 : INT ; (* 1226 !display 31 honderdtallen *)
  DSP31_3 : INT ; (* 1227 !display 31 duizendtallen *)
  DSP32_0 : INT ; (* 1228 !display 32 eenheden *)
  DSP32_1 : INT ; (* 1229 !display 32 tientallen *)
  DSP32_2 : INT ; (* 1230 !display 32 honderdtallen *)
  DSP32_3 : INT ; (* 1231 !display 32 duizendtallen *)
  DSP33_0 : INT ; (* 1232 !display 33 eenheden *)
  DSP33_1 : INT ; (* 1233 !display 33 tientallen *)
  DSP33_2 : INT ; (* 1234 !display 33 honderdtallen *)
  DSP33_3 : INT ; (* 1235 !display 33 duizendtallen *)
  DSP34_0 : INT ; (* 1236 !display 34 eenheden *)
  DSP34_1 : INT ; (* 1237 !display 34 tientallen *)
  DSP34_2 : INT ; (* 1238 !display 34 honderdtallen *)
  DSP34_3 : INT ; (* 1239 !display 34 duizendtallen *)
  DSP35_0 : INT ; (* 1240 !display 35 eenheden *)
  DSP35_1 : INT ; (* 1241 !display 35 tientallen *)
  DSP35_2 : INT ; (* 1242 !display 35 honderdtallen *)
  DSP35_3 : INT ; (* 1243 !display 35 duizendtallen *)
  DSP36_0 : INT ; (* 1244 !display 36 eenheden *)
  DSP36_1 : INT ; (* 1245 !display 36 tientallen *)
  DSP36_2 : INT ; (* 1246 !display 36 honderdtallen *)
  DSP36_3 : INT ; (* 1247 !display 36 duizendtallen *)
  DSP37_0 : INT ; (* 1248 !display 37 eenheden *)
  DSP37_1 : INT ; (* 1249 !display 37 tientallen *)
  DSP37_2 : INT ; (* 1250 !display 37 honderdtallen *)
  DSP37_3 : INT ; (* 1251 !display 37 duizendtallen *)
  DSP38_0 : INT ; (* 1252 !display 38 eenheden *)
  DSP38_1 : INT ; (* 1253 !display 38 tientallen *)
  DSP38_2 : INT ; (* 1254 !display 38 honderdtallen *)
  DSP38_3 : INT ; (* 1255 !display 38 duizendtallen *)
  DSP39_0 : INT ; (* 1256 !display 39 eenheden *)
  DSP39_1 : INT ; (* 1257 !display 39 tientallen *)
  DSP39_2 : INT ; (* 1258 !display 39 honderdtallen *)
  DSP39_3 : INT ; (* 1259 !display 39 duizendtallen *)
  DSP40_0 : INT ; (* 1260 !display 40 eenheden *)
  DSP40_1 : INT ; (* 1261 !display 40 tientallen *)
  DSP40_2 : INT ; (* 1262 !display 40 honderdtallen *)
  DSP40_3 : INT ; (* 1263 !display 40 duizendtallen *)
  DSP41_0 : INT ; (* 1264 !display 41 eenheden *)
  DSP41_1 : INT ; (* 1265 !display 41 tientallen *)
  DSP41_2 : INT ; (* 1266 !display 41 honderdtallen *)
  DSP41_3 : INT ; (* 1267 !display 41 duizendtallen *)
  DSP42_0 : INT ; (* 1268 !display 42 eenheden *)
  DSP42_1 : INT ; (* 1269 !display 42 tientallen *)
  DSP42_2 : INT ; (* 1270 !display 42 honderdtallen *)
  DSP42_3 : INT ; (* 1271 !display 42 duizendtallen *)
  DSP43_0 : INT ; (* 1272 !display 43 eenheden *)
  DSP43_1 : INT ; (* 1273 !display 43 tientallen *)
  DSP43_2 : INT ; (* 1274 !display 43 honderdtallen *)
  DSP43_3 : INT ; (* 1275 !display 43 duizendtallen *)
  DSP44_0 : INT ; (* 1276 !display 44 eenheden *)
  DSP44_1 : INT ; (* 1277 !display 44 tientallen *)
  DSP44_2 : INT ; (* 1278 !display 44 honderdtallen *)
  DSP44_3 : INT ; (* 1279 !display 44 duizendtallen *)
  DSP45_0 : INT ; (* 1280 !display 45 eenheden *)
  DSP45_1 : INT ; (* 1281 !display 45 tientallen *)
  DSP45_2 : INT ; (* 1282 !display 45 honderdtallen *)
  DSP45_3 : INT ; (* 1283 !display 45 duizendtallen *)
  DSP46_0 : INT ; (* 1284 !display 46 eenheden *)
  DSP46_1 : INT ; (* 1285 !display 46 tientallen *)
  DSP46_2 : INT ; (* 1286 !display 46 honderdtallen *)
  DSP46_3 : INT ; (* 1287 !display 46 duizendtallen *)
  DSP47_0 : INT ; (* 1288 !display 47 eenheden *)
  DSP47_1 : INT ; (* 1289 !display 47 tientallen *)
  DSP47_2 : INT ; (* 1290 !display 47 honderdtallen *)
  DSP47_3 : INT ; (* 1291 !display 47 duizendtallen *)
  DSP48_0 : INT ; (* 1292 !display 48 eenheden *)
  DSP48_1 : INT ; (* 1293 !display 48 tientallen *)
  DSP48_2 : INT ; (* 1294 !display 48 honderdtallen *)
  DSP48_3 : INT ; (* 1295 !display 48 duizendtallen *)
  DSP49_0 : INT ; (* 1296 !display 49 eenheden *)
  DSP49_1 : INT ; (* 1297 !display 49 tientallen *)
  DSP49_2 : INT ; (* 1298 !display 49 honderdtallen *)
  DSP49_3 : INT ; (* 1299 !display 49 duizendtallen *)
  DSP50_0 : INT ; (* 1300 !display 50 eenheden *)
  DSP50_1 : INT ; (* 1301 !display 50 tientallen *)
  DSP50_2 : INT ; (* 1302 !display 50 honderdtallen *)
  DSP50_3 : INT ; (* 1303 !display 50 duizendtallen *)
  DSP51_0 : INT ; (* 1304 !display 51 eenheden *)
  DSP51_1 : INT ; (* 1305 !display 51 tientallen *)
  DSP51_2 : INT ; (* 1306 !display 51 honderdtallen *)
  DSP51_3 : INT ; (* 1307 !display 51 duizendtallen *)
  DSP52_0 : INT ; (* 1308 !display 52 eenheden *)
  DSP52_1 : INT ; (* 1309 !display 52 tientallen *)
  DSP52_2 : INT ; (* 1310 !display 52 honderdtallen *)
  DSP52_3 : INT ; (* 1311 !display 52 duizendtallen *)
  DSP53_0 : INT ; (* 1312 !display 53 eenheden *)
  DSP53_1 : INT ; (* 1313 !display 53 tientallen *)
  DSP53_2 : INT ; (* 1314 !display 53 honderdtallen *)
  DSP53_3 : INT ; (* 1315 !display 53 duizendtallen *)
  DSP54_0 : INT ; (* 1316 !display 54 eenheden *)
  DSP54_1 : INT ; (* 1317 !display 54 tientallen *)
  DSP54_2 : INT ; (* 1318 !display 54 honderdtallen *)
  DSP54_3 : INT ; (* 1319 !display 54 duizendtallen *)
  DSP55_0 : INT ; (* 1320 !display 55 eenheden *)
  DSP55_1 : INT ; (* 1321 !display 55 tientallen *)
  DSP55_2 : INT ; (* 1322 !display 55 honderdtallen *)
  DSP55_3 : INT ; (* 1323 !display 55 duizendtallen *)
  DSP56_0 : INT ; (* 1324 !display 56 eenheden *)
  DSP56_1 : INT ; (* 1325 !display 56 tientallen *)
  DSP56_2 : INT ; (* 1326 !display 56 honderdtallen *)
  DSP56_3 : INT ; (* 1327 !display 56 duizendtallen *)
  DSP57_0 : INT ; (* 1328 !display 57 eenheden *)
  DSP57_1 : INT ; (* 1329 !display 57 tientallen *)
  DSP57_2 : INT ; (* 1330 !display 57 honderdtallen *)
  DSP57_3 : INT ; (* 1331 !display 57 duizendtallen *)
  DSP58_0 : INT ; (* 1332 !display 58 eenheden *)
  DSP58_1 : INT ; (* 1333 !display 58 tientallen *)
  DSP58_2 : INT ; (* 1334 !display 58 honderdtallen *)
  DSP58_3 : INT ; (* 1335 !display 58 duizendtallen *)
  DSP59_0 : INT ; (* 1336 !display 59 eenheden *)
  DSP59_1 : INT ; (* 1337 !display 59 tientallen *)
  DSP59_2 : INT ; (* 1338 !display 59 honderdtallen *)
  DSP59_3 : INT ; (* 1339 !display 59 duizendtallen *)
  DSP60_0 : INT ; (* 1340 !display 60 eenheden *)
  DSP60_1 : INT ; (* 1341 !display 60 tientallen *)
  DSP60_2 : INT ; (* 1342 !display 60 honderdtallen *)
  DSP60_3 : INT ; (* 1343 !display 60 duizendtallen *)
  DSP61_0 : INT ; (* 1344 !display 61 eenheden *)
  DSP61_1 : INT ; (* 1345 !display 61 tientallen *)
  DSP61_2 : INT ; (* 1346 !display 61 honderdtallen *)
  DSP61_3 : INT ; (* 1347 !display 61 duizendtallen *)
  DSP62_0 : INT ; (* 1348 !display 62 eenheden *)
  DSP62_1 : INT ; (* 1349 !display 62 tientallen *)
  DSP62_2 : INT ; (* 1350 !display 62 honderdtallen *)
  DSP62_3 : INT ; (* 1351 !display 62 duizendtallen *)
  DSP63_0 : INT ; (* 1352 !display 63 eenheden *)
  DSP63_1 : INT ; (* 1353 !display 63 tientallen *)
  DSP63_2 : INT ; (* 1354 !display 63 honderdtallen *)
  DSP63_3 : INT ; (* 1355 !display 63 duizendtallen *)
  DSP64_0 : INT ; (* 1356 !display 64 eenheden *)
  DSP64_1 : INT ; (* 1357 !display 64 tientallen *)
  DSP64_2 : INT ; (* 1358 !display 64 honderdtallen *)
  DSP64_3 : INT ; (* 1359 !display 64 duizendtallen *)
  DSP65_0 : INT ; (* 1360 !display 65 eenheden *)
  DSP65_1 : INT ; (* 1361 !display 65 tientallen *)
  DSP65_2 : INT ; (* 1362 !display 65 honderdtallen *)
  DSP65_3 : INT ; (* 1363 !display 65 duizendtallen *)
  DSP66_0 : INT ; (* 1364 !display 66 eenheden *)
  DSP66_1 : INT ; (* 1365 !display 66 tientallen *)
  DSP66_2 : INT ; (* 1366 !display 66 honderdtallen *)
  DSP66_3 : INT ; (* 1367 !display 66 duizendtallen *)
  DSP67_0 : INT ; (* 1368 !display 67 eenheden *)
  DSP67_1 : INT ; (* 1369 !display 67 tientallen *)
  DSP67_2 : INT ; (* 1370 !display 67 honderdtallen *)
  DSP67_3 : INT ; (* 1371 !display 67 duizendtallen *)
  DSP68_0 : INT ; (* 1372 !display 68 eenheden *)
  DSP68_1 : INT ; (* 1373 !display 68 tientallen *)
  DSP68_2 : INT ; (* 1374 !display 68 honderdtallen *)
  DSP68_3 : INT ; (* 1375 !display 68 duizendtallen *)
  DSP69_0 : INT ; (* 1376 !display 69 eenheden *)
  DSP69_1 : INT ; (* 1377 !display 69 tientallen *)
  DSP69_2 : INT ; (* 1378 !display 69 honderdtallen *)
  DSP69_3 : INT ; (* 1379 !display 69 duizendtallen *)
  DSP70_0 : INT ; (* 1380 !display 70 eenheden *)
  DSP70_1 : INT ; (* 1381 !display 70 tientallen *)
  DSP70_2 : INT ; (* 1382 !display 70 honderdtallen *)
  DSP70_3 : INT ; (* 1383 !display 70 duizendtallen *)
  DSP71_0 : INT ; (* 1384 !display 71 eenheden *)
  DSP71_1 : INT ; (* 1385 !display 71 tientallen *)
  DSP71_2 : INT ; (* 1386 !display 71 honderdtallen *)
  DSP71_3 : INT ; (* 1387 !display 71 duizendtallen *)
  DSP72_0 : INT ; (* 1388 !display 72 eenheden *)
  DSP72_1 : INT ; (* 1389 !display 72 tientallen *)
  DSP72_2 : INT ; (* 1390 !display 72 honderdtallen *)
  DSP72_3 : INT ; (* 1391 !display 72 duizendtallen *)
  DSP73_0 : INT ; (* 1392 !display 73 eenheden *)
  DSP73_1 : INT ; (* 1393 !display 73 tientallen *)
  DSP73_2 : INT ; (* 1394 !display 73 honderdtallen *)
  DSP73_3 : INT ; (* 1395 !display 73 duizendtallen *)
  DSP74_0 : INT ; (* 1396 !display 74 eenheden *)
  DSP74_1 : INT ; (* 1397 !display 74 tientallen *)
  DSP74_2 : INT ; (* 1398 !display 74 honderdtallen *)
  DSP74_3 : INT ; (* 1399 !display 74 duizendtallen *)
  DSP75_0 : INT ; (* 1400 !display 75 eenheden *)
  DSP75_1 : INT ; (* 1401 !display 75 tientallen *)
  DSP75_2 : INT ; (* 1402 !display 75 honderdtallen *)
  DSP75_3 : INT ; (* 1403 !display 75 duizendtallen *)
  DSP76_0 : INT ; (* 1404 !display 76 eenheden *)
  DSP76_1 : INT ; (* 1405 !display 76 tientallen *)
  DSP76_2 : INT ; (* 1406 !display 76 honderdtallen *)
  DSP76_3 : INT ; (* 1407 !display 76 duizendtallen *)
  DSP77_0 : INT ; (* 1408 !display 77 eenheden *)
  DSP77_1 : INT ; (* 1409 !display 77 tientallen *)
  DSP77_2 : INT ; (* 1410 !display 77 honderdtallen *)
  DSP77_3 : INT ; (* 1411 !display 77 duizendtallen *)
  DSP78_0 : INT ; (* 1412 !display 78 eenheden *)
  DSP78_1 : INT ; (* 1413 !display 78 tientallen *)
  DSP78_2 : INT ; (* 1414 !display 78 honderdtallen *)
  DSP78_3 : INT ; (* 1415 !display 78 duizendtallen *)
  DSP79_0 : INT ; (* 1416 !display 79 eenheden *)
  DSP79_1 : INT ; (* 1417 !display 79 tientallen *)
  DSP79_2 : INT ; (* 1418 !display 79 honderdtallen *)
  DSP79_3 : INT ; (* 1419 !display 79 duizendtallen *)
  DSP80_0 : INT ; (* 1420 !display 80 eenheden *)
  DSP80_1 : INT ; (* 1421 !display 80 tientallen *)
  DSP80_2 : INT ; (* 1422 !display 80 honderdtallen *)
  DSP80_3 : INT ; (* 1423 !display 80 duizendtallen *)
  DSP81_0 : INT ; (* 1424 !display 81 eenheden *)
  DSP81_1 : INT ; (* 1425 !display 81 tientallen *)
  DSP81_2 : INT ; (* 1426 !display 81 honderdtallen *)
  DSP81_3 : INT ; (* 1427 !display 81 duizendtallen *)
  DSP82_0 : INT ; (* 1428 !display 82 eenheden *)
  DSP82_1 : INT ; (* 1429 !display 82 tientallen *)
  DSP82_2 : INT ; (* 1430 !display 82 honderdtallen *)
  DSP82_3 : INT ; (* 1431 !display 82 duizendtallen *)
  DSP83_0 : INT ; (* 1432 !display 83 eenheden *)
  DSP83_1 : INT ; (* 1433 !display 83 tientallen *)
  DSP83_2 : INT ; (* 1434 !display 83 honderdtallen *)
  DSP83_3 : INT ; (* 1435 !display 83 duizendtallen *)
  DSP84_0 : INT ; (* 1436 !display 84 eenheden *)
  DSP84_1 : INT ; (* 1437 !display 84 tientallen *)
  DSP84_2 : INT ; (* 1438 !display 84 honderdtallen *)
  DSP84_3 : INT ; (* 1439 !display 84 duizendtallen *)
  DSP85_0 : INT ; (* 1440 !display 85 eenheden *)
  DSP85_1 : INT ; (* 1441 !display 85 tientallen *)
  DSP85_2 : INT ; (* 1442 !display 85 honderdtallen *)
  DSP85_3 : INT ; (* 1443 !display 85 duizendtallen *)
  DSP86_0 : INT ; (* 1444 !display 86 eenheden *)
  DSP86_1 : INT ; (* 1445 !display 86 tientallen *)
  DSP86_2 : INT ; (* 1446 !display 86 honderdtallen *)
  DSP86_3 : INT ; (* 1447 !display 86 duizendtallen *)
  DSP87_0 : INT ; (* 1448 !display 87 eenheden *)
  DSP87_1 : INT ; (* 1449 !display 87 tientallen *)
  DSP87_2 : INT ; (* 1450 !display 87 honderdtallen *)
  DSP87_3 : INT ; (* 1451 !display 87 duizendtallen *)
  DSP88_0 : INT ; (* 1452 !display 88 eenheden *)
  DSP88_1 : INT ; (* 1453 !display 88 tientallen *)
  DSP88_2 : INT ; (* 1454 !display 88 honderdtallen *)
  DSP88_3 : INT ; (* 1455 !display 88 duizendtallen *)
  DSP89_0 : INT ; (* 1456 !display 89 eenheden *)
  DSP89_1 : INT ; (* 1457 !display 89 tientallen *)
  DSP89_2 : INT ; (* 1458 !display 89 honderdtallen *)
  DSP89_3 : INT ; (* 1459 !display 89 duizendtallen *)
  DSP90_0 : INT ; (* 1460 !display 90 eenheden *)
  DSP90_1 : INT ; (* 1461 !display 90 tientallen *)
  DSP90_2 : INT ; (* 1462 !display 90 honderdtallen *)
  DSP90_3 : INT ; (* 1463 !display 90 duizendtallen *)
  DSP91_0 : INT ; (* 1464 !display 91 eenheden *)
  DSP91_1 : INT ; (* 1465 !display 91 tientallen *)
  DSP91_2 : INT ; (* 1466 !display 91 honderdtallen *)
  DSP91_3 : INT ; (* 1467 !display 91 duizendtallen *)
  DSP92_0 : INT ; (* 1468 !display 92 eenheden *)
  DSP92_1 : INT ; (* 1469 !display 92 tientallen *)
  DSP92_2 : INT ; (* 1470 !display 92 honderdtallen *)
  DSP92_3 : INT ; (* 1471 !display 92 duizendtallen *)
  DSP93_0 : INT ; (* 1472 !display 93 eenheden *)
  DSP93_1 : INT ; (* 1473 !display 93 tientallen *)
  DSP93_2 : INT ; (* 1474 !display 93 honderdtallen *)
  DSP93_3 : INT ; (* 1475 !display 93 duizendtallen *)
  DSP94_0 : INT ; (* 1476 !display 94 eenheden *)
  DSP94_1 : INT ; (* 1477 !display 94 tientallen *)
  DSP94_2 : INT ; (* 1478 !display 94 honderdtallen *)
  DSP94_3 : INT ; (* 1479 !display 94 duizendtallen *)
  DSP95_0 : INT ; (* 1480 !display 95 eenheden *)
  DSP95_1 : INT ; (* 1481 !display 95 tientallen *)
  DSP95_2 : INT ; (* 1482 !display 95 honderdtallen *)
  DSP95_3 : INT ; (* 1483 !display 95 duizendtallen *)
  DSP96_0 : INT ; (* 1484 !display 96 eenheden *)
  DSP96_1 : INT ; (* 1485 !display 96 tientallen *)
  DSP96_2 : INT ; (* 1486 !display 96 honderdtallen *)
  DSP96_3 : INT ; (* 1487 !display 96 duizendtallen *)
  DSP97_0 : INT ; (* 1488 !display 97 eenheden *)
  DSP97_1 : INT ; (* 1489 !display 97 tientallen *)
  DSP97_2 : INT ; (* 1490 !display 97 honderdtallen *)
  DSP97_3 : INT ; (* 1491 !display 97 duizendtallen *)
  DSP98_0 : INT ; (* 1492 !display 98 eenheden *)
  DSP98_1 : INT ; (* 1493 !display 98 tientallen *)
  DSP98_2 : INT ; (* 1494 !display 98 honderdtallen *)
  DSP98_3 : INT ; (* 1495 !display 98 duizendtallen *)
  DSP99_0 : INT ; (* 1496 !display 99 eenheden *)
  DSP99_1 : INT ; (* 1497 !display 99 tientallen *)
  DSP99_2 : INT ; (* 1498 !display 99 honderdtallen *)
  DSP99_3 : INT ; (* 1499 !display 99 duizendtallen *)
  constante_0 : INT ; (* 1500 !constante 0 *)
  constante_1 : INT ; (* 1501 !constante 1 *)
  constante_2 : INT ; (* 1502 !constante 2 *)
  constante_3 : INT ; (* 1503 !constante 3 *)
  constante_4 : INT ; (* 1504 !constante 4 *)
  constante_5 : INT ; (* 1505 !constante 5 *)
  constante_6 : INT ; (* 1506 !constante 6 *)
  constante_7 : INT ; (* 1507 !constante 7 *)
  constante_8 : INT ; (* 1508 !constante 8 *)
  constante_9 : INT ; (* 1509 !constante 9 *)
  unnamed_1510 : INT ; (* 1510  *)
  unnamed_1511 : INT ; (* 1511  *)
  STP00_0 : INT ; (* 2000 !setpoint 00 eenheden *)
  STP00_1 : INT ; (* 2001 !setpoint 00 tientallen *)
  STP00_2 : INT ; (* 2002 !setpoint 00 honderdtallen *)
  STP00_3 : INT ; (* 2003 !setpoint 00 duizendtallen *)
  STP01_0 : INT ; (* 2004 !setpoint 01 eenheden *)
  STP01_1 : INT ; (* 2005 !setpoint 01 tientallen *)
  STP01_2 : INT ; (* 2006 !setpoint 01 honderdtallen *)
  STP01_3 : INT ; (* 2007 !setpoint 01 duizendtallen *)
  STP02_0 : INT ; (* 2008 !setpoint 02 eenheden *)
  STP02_1 : INT ; (* 2009 !setpoint 02 tientallen *)
  STP02_2 : INT ; (* 2010 !setpoint 02 honderdtallen *)
  STP02_3 : INT ; (* 2011 !setpoint 02 duizendtallen *)
  STP03_0 : INT ; (* 2012 !setpoint 03 eenheden *)
  STP03_1 : INT ; (* 2013 !setpoint 03 tientallen *)
  STP03_2 : INT ; (* 2014 !setpoint 03 honderdtallen *)
  STP03_3 : INT ; (* 2015 !setpoint 03 duizendtallen *)
  STP04_0 : INT ; (* 2016 !setpoint 04 eenheden *)
  STP04_1 : INT ; (* 2017 !setpoint 04 tientallen *)
  STP04_2 : INT ; (* 2018 !setpoint 04 honderdtallen *)
  STP04_3 : INT ; (* 2019 !setpoint 04 duizendtallen *)
  STP05_0 : INT ; (* 2020 !setpoint 05 eenheden *)
  STP05_1 : INT ; (* 2021 !setpoint 05 tientallen *)
  STP05_2 : INT ; (* 2022 !setpoint 05 honderdtallen *)
  STP05_3 : INT ; (* 2023 !setpoint 05 duizendtallen *)
  STP06_0 : INT ; (* 2024 !setpoint 06 eenheden *)
  STP06_1 : INT ; (* 2025 !setpoint 06 tientallen *)
  STP06_2 : INT ; (* 2026 !setpoint 06 honderdtallen *)
  STP06_3 : INT ; (* 2027 !setpoint 06 duizendtallen *)
  STP07_0 : INT ; (* 2028 !setpoint 07 eenheden *)
  STP07_1 : INT ; (* 2029 !setpoint 07 tientallen *)
  STP07_2 : INT ; (* 2030 !setpoint 07 honderdtallen *)
  STP07_3 : INT ; (* 2031 !setpoint 07 duizendtallen *)
  STP08_0 : INT ; (* 2032 !setpoint 08 eenheden *)
  STP08_1 : INT ; (* 2033 !setpoint 08 tientallen *)
  STP08_2 : INT ; (* 2034 !setpoint 08 honderdtallen *)
  STP08_3 : INT ; (* 2035 !setpoint 08 duizendtallen *)
  STP09_0 : INT ; (* 2036 !setpoint 09 eenheden *)
  STP09_1 : INT ; (* 2037 !setpoint 09 tientallen *)
  STP09_2 : INT ; (* 2038 !setpoint 09 honderdtallen *)
  STP09_3 : INT ; (* 2039 !setpoint 09 duizendtallen *)
  STP10_0 : INT ; (* 2040 !setpoint 10 eenheden *)
  STP10_1 : INT ; (* 2041 !setpoint 10 tientallen *)
  STP10_2 : INT ; (* 2042 !setpoint 10 honderdtallen *)
  STP10_3 : INT ; (* 2043 !setpoint 10 duizendtallen *)
  STP11_0 : INT ; (* 2044 !setpoint 11 eenheden *)
  STP11_1 : INT ; (* 2045 !setpoint 11 tientallen *)
  STP11_2 : INT ; (* 2046 !setpoint 11 honderdtallen *)
  STP11_3 : INT ; (* 2047 !setpoint 11 duizendtallen *)
  STP12_0 : INT ; (* 2048 !setpoint 12 eenheden *)
  STP12_1 : INT ; (* 2049 !setpoint 12 tientallen *)
  STP12_2 : INT ; (* 2050 !setpoint 12 honderdtallen *)
  STP12_3 : INT ; (* 2051 !setpoint 12 duizendtallen *)
  STP13_0 : INT ; (* 2052 !setpoint 13 eenheden *)
  STP13_1 : INT ; (* 2053 !setpoint 13 tientallen *)
  STP13_2 : INT ; (* 2054 !setpoint 13 honderdtallen *)
  STP13_3 : INT ; (* 2055 !setpoint 13 duizendtallen *)
  STP14_0 : INT ; (* 2056 !setpoint 14 eenheden *)
  STP14_1 : INT ; (* 2057 !setpoint 14 tientallen *)
  STP14_2 : INT ; (* 2058 !setpoint 14 honderdtallen *)
  STP14_3 : INT ; (* 2059 !setpoint 14 duizendtallen *)
  STP15_0 : INT ; (* 2060 !setpoint 15 eenheden *)
  STP15_1 : INT ; (* 2061 !setpoint 15 tientallen *)
  STP15_2 : INT ; (* 2062 !setpoint 15 honderdtallen *)
  STP15_3 : INT ; (* 2063 !setpoint 15 duizendtallen *)
  STP16_0 : INT ; (* 2064 !setpoint 16 eenheden *)
  STP16_1 : INT ; (* 2065 !setpoint 16 tientallen *)
  STP16_2 : INT ; (* 2066 !setpoint 16 honderdtallen *)
  STP16_3 : INT ; (* 2067 !setpoint 16 duizendtallen *)
  STP17_0 : INT ; (* 2068 !setpoint 17 eenheden *)
  STP17_1 : INT ; (* 2069 !setpoint 17 tientallen *)
  STP17_2 : INT ; (* 2070 !setpoint 17 honderdtallen *)
  STP17_3 : INT ; (* 2071 !setpoint 17 duizendtallen *)
  STP18_0 : INT ; (* 2072 !setpoint 18 eenheden *)
  STP18_1 : INT ; (* 2073 !setpoint 18 tientallen *)
  STP18_2 : INT ; (* 2074 !setpoint 18 honderdtallen *)
  STP18_3 : INT ; (* 2075 !setpoint 18 duizendtallen *)
  STP19_0 : INT ; (* 2076 !setpoint 19 eenheden *)
  STP19_1 : INT ; (* 2077 !setpoint 19 tientallen *)
  STP19_2 : INT ; (* 2078 !setpoint 19 honderdtallen *)
  STP19_3 : INT ; (* 2079 !setpoint 19 duizendtallen *)
  STP20_0 : INT ; (* 2080 !setpoint 20 eenheden *)
  STP20_1 : INT ; (* 2081 !setpoint 20 tientallen *)
  STP20_2 : INT ; (* 2082 !setpoint 20 honderdtallen *)
  STP20_3 : INT ; (* 2083 !setpoint 20 duizendtallen *)
  STP21_0 : INT ; (* 2084 !setpoint 21 eenheden *)
  STP21_1 : INT ; (* 2085 !setpoint 21 tientallen *)
  STP21_2 : INT ; (* 2086 !setpoint 21 honderdtallen *)
  STP21_3 : INT ; (* 2087 !setpoint 21 duizendtallen *)
  STP22_0 : INT ; (* 2088 !setpoint 22 eenheden *)
  STP22_1 : INT ; (* 2089 !setpoint 22 tientallen *)
  STP22_2 : INT ; (* 2090 !setpoint 22 honderdtallen *)
  STP22_3 : INT ; (* 2091 !setpoint 22 duizendtallen *)
  STP23_0 : INT ; (* 2092 !setpoint 23 eenheden *)
  STP23_1 : INT ; (* 2093 !setpoint 23 tientallen *)
  STP23_2 : INT ; (* 2094 !setpoint 23 honderdtallen *)
  STP23_3 : INT ; (* 2095 !setpoint 23 duizendtallen *)
  STP24_0 : INT ; (* 2096 !setpoint 24 eenheden *)
  STP24_1 : INT ; (* 2097 !setpoint 24 tientallen *)
  STP24_2 : INT ; (* 2098 !setpoint 24 honderdtallen *)
  STP24_3 : INT ; (* 2099 !setpoint 24 duizendtallen *)
  STP25_0 : INT ; (* 2100 !setpoint 25 eenheden *)
  STP25_1 : INT ; (* 2101 !setpoint 25 tientallen *)
  STP25_2 : INT ; (* 2102 !setpoint 25 honderdtallen *)
  STP25_3 : INT ; (* 2103 !setpoint 25 duizendtallen *)
  STP26_0 : INT ; (* 2104 !setpoint 26 eenheden *)
  STP26_1 : INT ; (* 2105 !setpoint 26 tientallen *)
  STP26_2 : INT ; (* 2106 !setpoint 26 honderdtallen *)
  STP26_3 : INT ; (* 2107 !setpoint 26 duizendtallen *)
  STP27_0 : INT ; (* 2108 !setpoint 27 eenheden *)
  STP27_1 : INT ; (* 2109 !setpoint 27 tientallen *)
  STP27_2 : INT ; (* 2110 !setpoint 27 honderdtallen *)
  STP27_3 : INT ; (* 2111 !setpoint 27 duizendtallen *)
  STP28_0 : INT ; (* 2112 !setpoint 28 eenheden *)
  STP28_1 : INT ; (* 2113 !setpoint 28 tientallen *)
  STP28_2 : INT ; (* 2114 !setpoint 28 honderdtallen *)
  STP28_3 : INT ; (* 2115 !setpoint 28 duizendtallen *)
  STP29_0 : INT ; (* 2116 !setpoint 29 eenheden *)
  STP29_1 : INT ; (* 2117 !setpoint 29 tientallen *)
  STP29_2 : INT ; (* 2118 !setpoint 29 honderdtallen *)
  STP29_3 : INT ; (* 2119 !setpoint 29 duizendtallen *)
  STP30_0 : INT ; (* 2120 !setpoint 30 eenheden *)
  STP30_1 : INT ; (* 2121 !setpoint 30 tientallen *)
  STP30_2 : INT ; (* 2122 !setpoint 30 honderdtallen *)
  STP30_3 : INT ; (* 2123 !setpoint 30 duizendtallen *)
  STP31_0 : INT ; (* 2124 !setpoint 31 eenheden *)
  STP31_1 : INT ; (* 2125 !setpoint 31 tientallen *)
  STP31_2 : INT ; (* 2126 !setpoint 31 honderdtallen *)
  STP31_3 : INT ; (* 2127 !setpoint 31 duizendtallen *)
  STP32_0 : INT ; (* 2128 !setpoint 32 eenheden *)
  STP32_1 : INT ; (* 2129 !setpoint 32 tientallen *)
  STP32_2 : INT ; (* 2130 !setpoint 32 honderdtallen *)
  STP32_3 : INT ; (* 2131 !setpoint 32 duizendtallen *)
  STP33_0 : INT ; (* 2132 !setpoint 33 eenheden *)
  STP33_1 : INT ; (* 2133 !setpoint 33 tientallen *)
  STP33_2 : INT ; (* 2134 !setpoint 33 honderdtallen *)
  STP33_3 : INT ; (* 2135 !setpoint 33 duizendtallen *)
  STP34_0 : INT ; (* 2136 !setpoint 34 eenheden *)
  STP34_1 : INT ; (* 2137 !setpoint 34 tientallen *)
  STP34_2 : INT ; (* 2138 !setpoint 34 honderdtallen *)
  STP34_3 : INT ; (* 2139 !setpoint 34 duizendtallen *)
  STP35_0 : INT ; (* 2140 !setpoint 35 eenheden *)
  STP35_1 : INT ; (* 2141 !setpoint 35 tientallen *)
  STP35_2 : INT ; (* 2142 !setpoint 35 honderdtallen *)
  STP35_3 : INT ; (* 2143 !setpoint 35 duizendtallen *)
  STP36_0 : INT ; (* 2144 !setpoint 36 eenheden *)
  STP36_1 : INT ; (* 2145 !setpoint 36 tientallen *)
  STP36_2 : INT ; (* 2146 !setpoint 36 honderdtallen *)
  STP36_3 : INT ; (* 2147 !setpoint 36 duizendtallen *)
  STP37_0 : INT ; (* 2148 !setpoint 37 eenheden *)
  STP37_1 : INT ; (* 2149 !setpoint 37 tientallen *)
  STP37_2 : INT ; (* 2150 !setpoint 37 honderdtallen *)
  STP37_3 : INT ; (* 2151 !setpoint 37 duizendtallen *)
  STP38_0 : INT ; (* 2152 !setpoint 38 eenheden *)
  STP38_1 : INT ; (* 2153 !setpoint 38 tientallen *)
  STP38_2 : INT ; (* 2154 !setpoint 38 honderdtallen *)
  STP38_3 : INT ; (* 2155 !setpoint 38 duizendtallen *)
  STP39_0 : INT ; (* 2156 !setpoint 39 eenheden *)
  STP39_1 : INT ; (* 2157 !setpoint 39 tientallen *)
  STP39_2 : INT ; (* 2158 !setpoint 39 honderdtallen *)
  STP39_3 : INT ; (* 2159 !setpoint 39 duizendtallen *)
  STP40_0 : INT ; (* 2160 !setpoint 40 eenheden *)
  STP40_1 : INT ; (* 2161 !setpoint 40 tientallen *)
  STP40_2 : INT ; (* 2162 !setpoint 40 honderdtallen *)
  STP40_3 : INT ; (* 2163 !setpoint 40 duizendtallen *)
  STP41_0 : INT ; (* 2164 !setpoint 41 eenheden *)
  STP41_1 : INT ; (* 2165 !setpoint 41 tientallen *)
  STP41_2 : INT ; (* 2166 !setpoint 41 honderdtallen *)
  STP41_3 : INT ; (* 2167 !setpoint 41 duizendtallen *)
  STP42_0 : INT ; (* 2168 !setpoint 42 eenheden *)
  STP42_1 : INT ; (* 2169 !setpoint 42 tientallen *)
  STP42_2 : INT ; (* 2170 !setpoint 42 honderdtallen *)
  STP42_3 : INT ; (* 2171 !setpoint 42 duizendtallen *)
  STP43_0 : INT ; (* 2172 !setpoint 43 eenheden *)
  STP43_1 : INT ; (* 2173 !setpoint 43 tientallen *)
  STP43_2 : INT ; (* 2174 !setpoint 43 honderdtallen *)
  STP43_3 : INT ; (* 2175 !setpoint 43 duizendtallen *)
  STP44_0 : INT ; (* 2176 !setpoint 44 eenheden *)
  STP44_1 : INT ; (* 2177 !setpoint 44 tientallen *)
  STP44_2 : INT ; (* 2178 !setpoint 44 honderdtallen *)
  STP44_3 : INT ; (* 2179 !setpoint 44 duizendtallen *)
  STP45_0 : INT ; (* 2180 !setpoint 45 eenheden *)
  STP45_1 : INT ; (* 2181 !setpoint 45 tientallen *)
  STP45_2 : INT ; (* 2182 !setpoint 45 honderdtallen *)
  STP45_3 : INT ; (* 2183 !setpoint 45 duizendtallen *)
  STP46_0 : INT ; (* 2184 !setpoint 46 eenheden *)
  STP46_1 : INT ; (* 2185 !setpoint 46 tientallen *)
  STP46_2 : INT ; (* 2186 !setpoint 46 honderdtallen *)
  STP46_3 : INT ; (* 2187 !setpoint 46 duizendtallen *)
  STP47_0 : INT ; (* 2188 !setpoint 47 eenheden *)
  STP47_1 : INT ; (* 2189 !setpoint 47 tientallen *)
  STP47_2 : INT ; (* 2190 !setpoint 47 honderdtallen *)
  STP47_3 : INT ; (* 2191 !setpoint 47 duizendtallen *)
  STP48_0 : INT ; (* 2192 !setpoint 48 eenheden *)
  STP48_1 : INT ; (* 2193 !setpoint 48 tientallen *)
  STP48_2 : INT ; (* 2194 !setpoint 48 honderdtallen *)
  STP48_3 : INT ; (* 2195 !setpoint 48 duizendtallen *)
  STP49_0 : INT ; (* 2196 !setpoint 49 eenheden *)
  STP49_1 : INT ; (* 2197 !setpoint 49 tientallen *)
  STP49_2 : INT ; (* 2198 !setpoint 49 honderdtallen *)
  STP49_3 : INT ; (* 2199 !setpoint 49 duizendtallen *)
  STP50_0 : INT ; (* 2200 !setpoint 50 eenheden *)
  STP50_1 : INT ; (* 2201 !setpoint 50 tientallen *)
  STP50_2 : INT ; (* 2202 !setpoint 50 honderdtallen *)
  STP50_3 : INT ; (* 2203 !setpoint 50 duizendtallen *)
  STP51_0 : INT ; (* 2204 !setpoint 51 eenheden *)
  STP51_1 : INT ; (* 2205 !setpoint 51 tientallen *)
  STP51_2 : INT ; (* 2206 !setpoint 51 honderdtallen *)
  STP51_3 : INT ; (* 2207 !setpoint 51 duizendtallen *)
  STP52_0 : INT ; (* 2208 !setpoint 52 eenheden *)
  STP52_1 : INT ; (* 2209 !setpoint 52 tientallen *)
  STP52_2 : INT ; (* 2210 !setpoint 52 honderdtallen *)
  STP52_3 : INT ; (* 2211 !setpoint 52 duizendtallen *)
  STP53_0 : INT ; (* 2212 !setpoint 53 eenheden *)
  STP53_1 : INT ; (* 2213 !setpoint 53 tientallen *)
  STP53_2 : INT ; (* 2214 !setpoint 53 honderdtallen *)
  STP53_3 : INT ; (* 2215 !setpoint 53 duizendtallen *)
  STP54_0 : INT ; (* 2216 !setpoint 54 eenheden *)
  STP54_1 : INT ; (* 2217 !setpoint 54 tientallen *)
  STP54_2 : INT ; (* 2218 !setpoint 54 honderdtallen *)
  STP54_3 : INT ; (* 2219 !setpoint 54 duizendtallen *)
  STP55_0 : INT ; (* 2220 !setpoint 55 eenheden *)
  STP55_1 : INT ; (* 2221 !setpoint 55 tientallen *)
  STP55_2 : INT ; (* 2222 !setpoint 55 honderdtallen *)
  STP55_3 : INT ; (* 2223 !setpoint 55 duizendtallen *)
  STP56_0 : INT ; (* 2224 !setpoint 56 eenheden *)
  STP56_1 : INT ; (* 2225 !setpoint 56 tientallen *)
  STP56_2 : INT ; (* 2226 !setpoint 56 honderdtallen *)
  STP56_3 : INT ; (* 2227 !setpoint 56 duizendtallen *)
  STP57_0 : INT ; (* 2228 !setpoint 57 eenheden *)
  STP57_1 : INT ; (* 2229 !setpoint 57 tientallen *)
  STP57_2 : INT ; (* 2230 !setpoint 57 honderdtallen *)
  STP57_3 : INT ; (* 2231 !setpoint 57 duizendtallen *)
  STP58_0 : INT ; (* 2232 !setpoint 58 eenheden *)
  STP58_1 : INT ; (* 2233 !setpoint 58 tientallen *)
  STP58_2 : INT ; (* 2234 !setpoint 58 honderdtallen *)
  STP58_3 : INT ; (* 2235 !setpoint 58 duizendtallen *)
  STP59_0 : INT ; (* 2236 !setpoint 59 eenheden *)
  STP59_1 : INT ; (* 2237 !setpoint 59 tientallen *)
  STP59_2 : INT ; (* 2238 !setpoint 59 honderdtallen *)
  STP59_3 : INT ; (* 2239 !setpoint 59 duizendtallen *)
  STP60_0 : INT ; (* 2240 !setpoint 60 eenheden *)
  STP60_1 : INT ; (* 2241 !setpoint 60 tientallen *)
  STP60_2 : INT ; (* 2242 !setpoint 60 honderdtallen *)
  STP60_3 : INT ; (* 2243 !setpoint 60 duizendtallen *)
  STP61_0 : INT ; (* 2244 !setpoint 61 eenheden *)
  STP61_1 : INT ; (* 2245 !setpoint 61 tientallen *)
  STP61_2 : INT ; (* 2246 !setpoint 61 honderdtallen *)
  STP61_3 : INT ; (* 2247 !setpoint 61 duizendtallen *)
  STP62_0 : INT ; (* 2248 !setpoint 62 eenheden *)
  STP62_1 : INT ; (* 2249 !setpoint 62 tientallen *)
  STP62_2 : INT ; (* 2250 !setpoint 62 honderdtallen *)
  STP62_3 : INT ; (* 2251 !setpoint 62 duizendtallen *)
  STP63_0 : INT ; (* 2252 !setpoint 63 eenheden *)
  STP63_1 : INT ; (* 2253 !setpoint 63 tientallen *)
  STP63_2 : INT ; (* 2254 !setpoint 63 honderdtallen *)
  STP63_3 : INT ; (* 2255 !setpoint 63 duizendtallen *)
  STP64_0 : INT ; (* 2256 !setpoint 64 eenheden *)
  STP64_1 : INT ; (* 2257 !setpoint 64 tientallen *)
  STP64_2 : INT ; (* 2258 !setpoint 64 honderdtallen *)
  STP64_3 : INT ; (* 2259 !setpoint 64 duizendtallen *)
  STP65_0 : INT ; (* 2260 !setpoint 65 eenheden *)
  STP65_1 : INT ; (* 2261 !setpoint 65 tientallen *)
  STP65_2 : INT ; (* 2262 !setpoint 65 honderdtallen *)
  STP65_3 : INT ; (* 2263 !setpoint 65 duizendtallen *)
  STP66_0 : INT ; (* 2264 !setpoint 66 eenheden *)
  STP66_1 : INT ; (* 2265 !setpoint 66 tientallen *)
  STP66_2 : INT ; (* 2266 !setpoint 66 honderdtallen *)
  STP66_3 : INT ; (* 2267 !setpoint 66 duizendtallen *)
  STP67_0 : INT ; (* 2268 !setpoint 67 eenheden *)
  STP67_1 : INT ; (* 2269 !setpoint 67 tientallen *)
  STP67_2 : INT ; (* 2270 !setpoint 67 honderdtallen *)
  STP67_3 : INT ; (* 2271 !setpoint 67 duizendtallen *)
  STP68_0 : INT ; (* 2272 !setpoint 68 eenheden *)
  STP68_1 : INT ; (* 2273 !setpoint 68 tientallen *)
  STP68_2 : INT ; (* 2274 !setpoint 68 honderdtallen *)
  STP68_3 : INT ; (* 2275 !setpoint 68 duizendtallen *)
  STP69_0 : INT ; (* 2276 !setpoint 69 eenheden *)
  STP69_1 : INT ; (* 2277 !setpoint 69 tientallen *)
  STP69_2 : INT ; (* 2278 !setpoint 69 honderdtallen *)
  STP69_3 : INT ; (* 2279 !setpoint 69 duizendtallen *)
  STP70_0 : INT ; (* 2280 !setpoint 70 eenheden *)
  STP70_1 : INT ; (* 2281 !setpoint 70 tientallen *)
  STP70_2 : INT ; (* 2282 !setpoint 70 honderdtallen *)
  STP70_3 : INT ; (* 2283 !setpoint 70 duizendtallen *)
  STP71_0 : INT ; (* 2284 !setpoint 71 eenheden *)
  STP71_1 : INT ; (* 2285 !setpoint 71 tientallen *)
  STP71_2 : INT ; (* 2286 !setpoint 71 honderdtallen *)
  STP71_3 : INT ; (* 2287 !setpoint 71 duizendtallen *)
  STP72_0 : INT ; (* 2288 !setpoint 72 eenheden *)
  STP72_1 : INT ; (* 2289 !setpoint 72 tientallen *)
  STP72_2 : INT ; (* 2290 !setpoint 72 honderdtallen *)
  STP72_3 : INT ; (* 2291 !setpoint 72 duizendtallen *)
  STP73_0 : INT ; (* 2292 !setpoint 73 eenheden *)
  STP73_1 : INT ; (* 2293 !setpoint 73 tientallen *)
  STP73_2 : INT ; (* 2294 !setpoint 73 honderdtallen *)
  STP73_3 : INT ; (* 2295 !setpoint 73 duizendtallen *)
  STP74_0 : INT ; (* 2296 !setpoint 74 eenheden *)
  STP74_1 : INT ; (* 2297 !setpoint 74 tientallen *)
  STP74_2 : INT ; (* 2298 !setpoint 74 honderdtallen *)
  STP74_3 : INT ; (* 2299 !setpoint 74 duizendtallen *)
  STP75_0 : INT ; (* 2300 !setpoint 75 eenheden *)
  STP75_1 : INT ; (* 2301 !setpoint 75 tientallen *)
  STP75_2 : INT ; (* 2302 !setpoint 75 honderdtallen *)
  STP75_3 : INT ; (* 2303 !setpoint 75 duizendtallen *)
  STP76_0 : INT ; (* 2304 !setpoint 76 eenheden *)
  STP76_1 : INT ; (* 2305 !setpoint 76 tientallen *)
  STP76_2 : INT ; (* 2306 !setpoint 76 honderdtallen *)
  STP76_3 : INT ; (* 2307 !setpoint 76 duizendtallen *)
  STP77_0 : INT ; (* 2308 !setpoint 77 eenheden *)
  STP77_1 : INT ; (* 2309 !setpoint 77 tientallen *)
  STP77_2 : INT ; (* 2310 !setpoint 77 honderdtallen *)
  STP77_3 : INT ; (* 2311 !setpoint 77 duizendtallen *)
  STP78_0 : INT ; (* 2312 !setpoint 78 eenheden *)
  STP78_1 : INT ; (* 2313 !setpoint 78 tientallen *)
  STP78_2 : INT ; (* 2314 !setpoint 78 honderdtallen *)
  STP78_3 : INT ; (* 2315 !setpoint 78 duizendtallen *)
  STP79_0 : INT ; (* 2316 !setpoint 79 eenheden *)
  STP79_1 : INT ; (* 2317 !setpoint 79 tientallen *)
  STP79_2 : INT ; (* 2318 !setpoint 79 honderdtallen *)
  STP79_3 : INT ; (* 2319 !setpoint 79 duizendtallen *)
  STP80_0 : INT ; (* 2320 !setpoint 80 eenheden *)
  STP80_1 : INT ; (* 2321 !setpoint 80 tientallen *)
  STP80_2 : INT ; (* 2322 !setpoint 80 honderdtallen *)
  STP80_3 : INT ; (* 2323 !setpoint 80 duizendtallen *)
  STP81_0 : INT ; (* 2324 !setpoint 81 eenheden *)
  STP81_1 : INT ; (* 2325 !setpoint 81 tientallen *)
  STP81_2 : INT ; (* 2326 !setpoint 81 honderdtallen *)
  STP81_3 : INT ; (* 2327 !setpoint 81 duizendtallen *)
  STP82_0 : INT ; (* 2328 !setpoint 82 eenheden *)
  STP82_1 : INT ; (* 2329 !setpoint 82 tientallen *)
  STP82_2 : INT ; (* 2330 !setpoint 82 honderdtallen *)
  STP82_3 : INT ; (* 2331 !setpoint 82 duizendtallen *)
  STP83_0 : INT ; (* 2332 !setpoint 83 eenheden *)
  STP83_1 : INT ; (* 2333 !setpoint 83 tientallen *)
  STP83_2 : INT ; (* 2334 !setpoint 83 honderdtallen *)
  STP83_3 : INT ; (* 2335 !setpoint 83 duizendtallen *)
  STP84_0 : INT ; (* 2336 !setpoint 84 eenheden *)
  STP84_1 : INT ; (* 2337 !setpoint 84 tientallen *)
  STP84_2 : INT ; (* 2338 !setpoint 84 honderdtallen *)
  STP84_3 : INT ; (* 2339 !setpoint 84 duizendtallen *)
  STP85_0 : INT ; (* 2340 !setpoint 85 eenheden *)
  STP85_1 : INT ; (* 2341 !setpoint 85 tientallen *)
  STP85_2 : INT ; (* 2342 !setpoint 85 honderdtallen *)
  STP85_3 : INT ; (* 2343 !setpoint 85 duizendtallen *)
  STP86_0 : INT ; (* 2344 !setpoint 86 eenheden *)
  STP86_1 : INT ; (* 2345 !setpoint 86 tientallen *)
  STP86_2 : INT ; (* 2346 !setpoint 86 honderdtallen *)
  STP86_3 : INT ; (* 2347 !setpoint 86 duizendtallen *)
  STP87_0 : INT ; (* 2348 !setpoint 87 eenheden *)
  STP87_1 : INT ; (* 2349 !setpoint 87 tientallen *)
  STP87_2 : INT ; (* 2350 !setpoint 87 honderdtallen *)
  STP87_3 : INT ; (* 2351 !setpoint 87 duizendtallen *)
  STP88_0 : INT ; (* 2352 !setpoint 88 eenheden *)
  STP88_1 : INT ; (* 2353 !setpoint 88 tientallen *)
  STP88_2 : INT ; (* 2354 !setpoint 88 honderdtallen *)
  STP88_3 : INT ; (* 2355 !setpoint 88 duizendtallen *)
  STP89_0 : INT ; (* 2356 !setpoint 89 eenheden *)
  STP89_1 : INT ; (* 2357 !setpoint 89 tientallen *)
  STP89_2 : INT ; (* 2358 !setpoint 89 honderdtallen *)
  STP89_3 : INT ; (* 2359 !setpoint 89 duizendtallen *)
  STP90_0 : INT ; (* 2360 !setpoint 90 eenheden *)
  STP90_1 : INT ; (* 2361 !setpoint 90 tientallen *)
  STP90_2 : INT ; (* 2362 !setpoint 90 honderdtallen *)
  STP90_3 : INT ; (* 2363 !setpoint 90 duizendtallen *)
  STP91_0 : INT ; (* 2364 !setpoint 91 eenheden *)
  STP91_1 : INT ; (* 2365 !setpoint 91 tientallen *)
  STP91_2 : INT ; (* 2366 !setpoint 91 honderdtallen *)
  STP91_3 : INT ; (* 2367 !setpoint 91 duizendtallen *)
  STP92_0 : INT ; (* 2368 !setpoint 92 eenheden *)
  STP92_1 : INT ; (* 2369 !setpoint 92 tientallen *)
  STP92_2 : INT ; (* 2370 !setpoint 92 honderdtallen *)
  STP92_3 : INT ; (* 2371 !setpoint 92 duizendtallen *)
  STP93_0 : INT ; (* 2372 !setpoint 93 eenheden *)
  STP93_1 : INT ; (* 2373 !setpoint 93 tientallen *)
  STP93_2 : INT ; (* 2374 !setpoint 93 honderdtallen *)
  STP93_3 : INT ; (* 2375 !setpoint 93 duizendtallen *)
  STP94_0 : INT ; (* 2376 !setpoint 94 eenheden *)
  STP94_1 : INT ; (* 2377 !setpoint 94 tientallen *)
  STP94_2 : INT ; (* 2378 !setpoint 94 honderdtallen *)
  STP94_3 : INT ; (* 2379 !setpoint 94 duizendtallen *)
  STP95_0 : INT ; (* 2380 !setpoint 95 eenheden *)
  STP95_1 : INT ; (* 2381 !setpoint 95 tientallen *)
  STP95_2 : INT ; (* 2382 !setpoint 95 honderdtallen *)
  STP95_3 : INT ; (* 2383 !setpoint 95 duizendtallen *)
  STP96_0 : INT ; (* 2384 !setpoint 96 eenheden *)
  STP96_1 : INT ; (* 2385 !setpoint 96 tientallen *)
  STP96_2 : INT ; (* 2386 !setpoint 96 honderdtallen *)
  STP96_3 : INT ; (* 2387 !setpoint 96 duizendtallen *)
  STP97_0 : INT ; (* 2388 !setpoint 97 eenheden *)
  STP97_1 : INT ; (* 2389 !setpoint 97 tientallen *)
  STP97_2 : INT ; (* 2390 !setpoint 97 honderdtallen *)
  STP97_3 : INT ; (* 2391 !setpoint 97 duizendtallen *)
  STP98_0 : INT ; (* 2392 !setpoint 98 eenheden *)
  STP98_1 : INT ; (* 2393 !setpoint 98 tientallen *)
  STP98_2 : INT ; (* 2394 !setpoint 98 honderdtallen *)
  STP98_3 : INT ; (* 2395 !setpoint 98 duizendtallen *)
  STP99_0 : INT ; (* 2396 !setpoint 99 eenheden *)
  STP99_1 : INT ; (* 2397 !setpoint 99 tientallen *)
  STP99_2 : INT ; (* 2398 !setpoint 99 honderdtallen *)
  STP99_3 : INT ; (* 2399 !setpoint 99 duizendtallen *)
  EENTIM88 : INT ; (* 2400 !eenh. 1 min. timer in fase 88 *)
  TIETIM88 : INT ; (* 2401 !tient. 1 min. timer in fase 88 *)
  ST2BU01 : INT ; (* 2501 !storingscode lichtkrant *)
  ST3BU01 : INT ; (* 2502 !+ *)
  BD0T00 : INT ; (* 2503  *)
  BD0T01 : INT ; (* 2504  *)
  RE0T00 : INT ; (* 2505 !+ *)
  RE0T01 : INT ; (* 2506 !| uur timer *)
  RE0T02 : INT ; (* 2507 !| *)
  RE0T03 : INT ; (* 2508 !+ *)
  RE1T00 : INT ; (* 2509 !+ *)
  RE1T01 : INT ; (* 2510 !+ tijdvertr. detectieschakelaar CMF gevu *)
  unnamed_2511 : INT ; (* 2511  *)
  ClockState_10s : BOOL ; (* 510.2 Trigger state for 10s. pulse *)

	(* Local variables generated by Rascal *)
  TRIGGER_ClockState_10s : BitTrigger ; (* 00510.2  Trigger state for 10s. pulse *)
END_VAR
%  (* ++Cyan++CodeBlock: 00018-00020 is BitTrigger 00511.2 by 00510.2 => 00001.2  *)
TRIGGER_ClockState_10s
(
  CLK := _CLOCK_10s, (* 10s interval with 50 percent duty cycle *)
  CLK_OUT => ClockState_10s, (* Trigger state for 10s. pulse *)
  Q => S_10SEC (* !triggerpuls 10 sec. *)
);
 
               1   , 88��           PLC_PRG ��q[	��Z      ��������           PROGRAM PLC_PRG
VAR
END_VAR?   ClockCycles();
OptimizedTimer();
PC20_CYCLE();
IO_Mapping();               �   , 4 4 �           TTimer 6$q[	�#q[      ��������        �   FUNCTION_BLOCK TTimer
VAR_INPUT
	Condition : BOOL ; (**< Starts the timer *)
	Setpoint : INT ; (**< Count to start *)
END_VAR

VAR_OUTPUT
	RemainingCount : INT ;
END_VAR�   IF _CLOCK_1S AND Condition THEN
	RemainingCount := RemainingCount -1 ;
	IF(0 > RemainingCount) THEN
		RemainingCount := 9999;
	END_IF;
END_IF;

IF NOT Condition THEN
	RemainingCount := Setpoint;
END_IF;               �   , � � Z           WriteBit ,q[	,q[      ��������        �   FUNCTION WriteBit : BOOL
VAR_INPUT
	pBit : POINTER TO BOOL ; (**< AddressValue of the target *)
	bValue : BOOL ; (**< Value to equalize bit to *)
END_VAR
VAR
END_VAR   pBit^ := bValue;               �   , �        
   WriteValue �q[	��q[      ��������        �   FUNCTION WriteValue : BOOL
VAR_INPUT
	pValue : POINTER TO INT ; (**< Pointer to value to write *)
	Value : INT ; (**< Value to store into the variable *)
END_VAR
VAR
END_VAR   pValue ^ := Value;                �   , � � ��           Sample ��q[
    @�Z$~'�q[   h                                                                                                         
    @        1 ) m� � `   ���      �                                     PC20_CYCLE.FASE_7       Timer enabled @                           ���    	   Arial @                       @                                                                                                           
    @        1 � m� �   ���      �                                  
   ._CLOCK_1S       1 Hz Pulse @                          ���    	   Arial @                       @                                                                                                           
    @        {) ��   ���     ���                                        IO_Mapping.ActualCount	   %i s. @                          ���    	   Arial @0                       @             �   ��   �   ��   � � � ���     �   ��   �   ��   � � � ���                  ����  ��������         #   Standard.lib 2.12.10 14:48:34 @���L)   SYSLIBCALLBACK.LIB 2.12.10 14:48:32 @���L)   WagoLibSockets.lib 14.5.12 12:49:08 @$�O(   SysLibSockets.lib 10.2.11 09:20:54 @֑SM,   NETVARUDP_LIB_V23.LIB 2.12.10 14:48:32 @���L   !   ASCIIBYTE_TO_STRING @                  CONCAT @        	   CTD @        	   CTU @        
   CTUD @           DELETE @           F_TRIG @        
   FIND @           INSERT @        
   LEFT @        	   LEN @        	   MID @           R_TRIG @           REAL_STATE @          REPLACE @           RIGHT @           RS @        	   RTC @        
   SEMA @           SR @           STANDARD_VERSION @          STRING_COMPARE @          STRING_TO_ASCIIBYTE @       	   TOF @        	   TON @           TP @              Global Variables 0 @           b   SysCallbackRegister @   	   RTS_EVENT       RTS_EVENT_FILTER       RTS_EVENT_SOURCE                   SysCallbackUnregister @              Globale_Variablen @           Version @        %   h  SOCK_ABORT @   	   SOCK_ADDR       SOCK_DEVICE       SOCK_FAMILY       SOCK_FCNTL_ARGUMENT       SOCK_FCNTL_COMMAND       SOCK_FD_SET_TYPE       SOCK_HOSTENT       SOCK_IOCTL_COMMAND       SOCK_IOCTL_OPTION       SOCK_IP_MREQ    
   SOCK_LEVEL       SOCK_OPTNAME       SOCK_PROTOCOL       SOCK_RET       SOCK_SOCKADDR    	   SOCK_TYPE                  SOCK_ACCEPT @          SOCK_BIND @          SOCK_CLOSE_SOCKET @          SOCK_CONNECT @          SOCK_DEVICE_UP @          SOCK_FCNTL @          SOCK_FD_CHECK @          SOCK_FD_INIT @          SOCK_FD_RESET @          SOCK_FD_SET @          SOCK_GET_DOMAIN_NAME @          SOCK_GET_HOST_BY_ADDR @          SOCK_GET_HOST_BY_NAME @          SOCK_GET_HOST_NAME @          SOCK_GET_PEER_NAME @          SOCK_GET_SOCK_NAME @          SOCK_GETSOCKOPT @          SOCK_HTONL @          SOCK_HTONS @          SOCK_IOCTL @          SOCK_IS_CONNECTED @          SOCK_LISTEN @          SOCK_NTOHL @          SOCK_NTOHS @          SOCK_PING @          SOCK_RECV @          SOCK_RECV_FROM @          SOCK_RECV_FROM_RAW @          SOCK_SELECT @          SOCK_SEND @          SOCK_SEND_TO @          SOCK_SEND_TO_RAW @          SOCK_SET_DOMAIN_NAME @          SOCK_SET_HOST_NAME @          SOCK_SETSOCKOPT @          SOCK_SOCKET @             Globale_Variablen @          |   SysSockAccept @      INADDR       SOCKADDRESS       SOCKET_FD_SET       SOCKET_LINGER       SOCKET_TIMEVAL                   SysSockBind @           SysSockClose @           SysSockConnect @           SysSockCreate @           SysSockGetHostByName @           SysSockGetHostName @           SysSockGetOption @           SysSockHtonl @           SysSockHtons @           SysSockInetAddr @           SysSockInetNtoa @           SysSockIoctl @           SysSockListen @           SysSockNtohl @           SysSockNtohs @           SysSockRecv @           SysSockRecvFrom @           SysSockSelect @           SysSockSend @           SysSockSendTo @           SysSockSetIPAddress @           SysSockSetOption @           SysSockShutdown @              Globale_Variablen @           *  CallbackNetVar @      CLIENT_ACCEPT       CLIENT_REPLY       NetVarDataItem_Udp       NetVarDataLen_Udp       NetVarOD_Access_Udp       NetVarOD_Service_Udp       NetVarOD_UDP       NetVarTelegramm_Udp       NetVarTlgHeader_Udp       NetVarUDPDiagStruct       NetVarUDPError                   CallbackTaskCodeNC @          GetIPAddress @            NetVarGetConnectStatus_UDP @           NetVarManager_Udp_FB @        '   NetVarManager_Udp_FB.CloseSockets @           NetVarPDO_Rx_Udp @        %   NetVarPDO_Rx_Udp.Get_IP_Address @       !   NetVarPDO_Rx_Udp.NewDataRec @           NetVarPDO_Tx_Udp @        %   NetVarPDO_Tx_Udp.Get_IP_Address @       %   NetVarPDO_Tx_Udp.PDO_TxSendHard @           NetVarSDO_Udp @           NetVarSDO_Udp.CheckMsg @        
   Swap @           UdpGetReceiveDataSize @           UdpOpenReceiveSocket @           UdpOpenSendSocket @           UdpReceiveData @           UdpSendData @           UdpSendTlg @              Globale_Variablen @                          ��������           2 �  �           ����������������  
             ����  ��������        ����  ��������                      POUs            	   Functions              
   ComposeInt  �                   WriteBit  �                
   WriteValue  �   ����              Library              
   BitTrigger  �                   TTimer  �   ����               ClockCycles  /                
   IO_Mapping  ,                   OptimizedTimer  �                
   PC20_CYCLE  �                   PLC_PRG  1   ����          
   Data types  ����              Visualizations                Sample  �   ����              Global Variables                 ClockPulses  2                   Global_Variables                  (   Networkmanagement implicit Variables UDP  �                   Variable_Configuration  	   ����                                         ��������             u�Z�.             �.                	   localhost            P      	   localhost            P      	   localhost            P     '�q[   7��&