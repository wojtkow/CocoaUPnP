// CocoaUPnP by A&R Cambridge Ltd, http://www.arcam.co.uk
// Copyright 2015 Arcam. See LICENSE file.

#import "UPPConnectionManagerService.h"
#import "UPPSessionManager.h"
#import "UPPConstants.h"
#import "UPPParameters.h"

@implementation UPPConnectionManagerService

- (void)protocolInfoWithCompletion:(UPPResponseBlock)completion
{
    if (!completion) { return; }

    [self _sendPostRequestWithParameters:nil
                                  action:@"GetProtocolInfo"
                              completion:completion];
}

- (void)prepareForConnectionWithProtocolInfo:(NSString *)protocolInfo peerConnectionManager:(NSString *)peerConnectionManager peerConnectionID:(NSString *)peerConnectionId direction:(NSString *)direction completion:(UPPResponseBlock)completion
{
    if (!completion) { return; }

    NSArray *k = @[ @"RemoteProtocolInfo",
                    @"PeerConnectionManager",
                    @"PeerConnectionID",
                    @"Direction" ];

    NSArray *v = @[ protocolInfo,
                    peerConnectionManager,
                    peerConnectionId,
                    direction ];

    UPPParameters *params = [UPPParameters paramsWithKeys:k values:v];

    [self _sendPostRequestWithParameters:params
                                  action:@"PrepareForConnection"
                              completion:completion];
}

- (void)connectionCompleteWithConnectionID:(NSString *)connectionId success:(UPPSuccessBlock)successBlock;
{
    UPPParameters *params = [UPPParameters paramsWithKey:@"ConnectionID"
                                                   value:connectionId];

    [self _sendPostRequestWithParameters:params
                                  action:@"ConnectionComplete"
                                 success:successBlock];
}

- (void)currentConnectionIDsWithCompletion:(UPPResponseBlock)completion
{
    if (!completion) { return; }

    [self _sendPostRequestWithParameters:nil
                                  action:@"GetCurrentConnectionIDs"
                              completion:completion];
}

- (void)currentConnectionInfoWithConnectionID:(NSString *)connectionId completion:(UPPResponseBlock)completion
{
    if (!completion) { return; }

    UPPParameters *params = [UPPParameters paramsWithKey:@"ConnectionID" value:connectionId];

    [self _sendPostRequestWithParameters:params
                                  action:@"GetCurrentConnectionInfo"
                              completion:completion];
}

@end
