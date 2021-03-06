// CocoaUPnP by A&R Cambridge Ltd, http://www.arcam.co.uk
// Copyright 2015 Arcam. See LICENSE file.

#import "UPPBasicService.h"

/**
 This class contains all the network calls needed for the UPnP [AVTransport1
 service](http://upnp.org/specs/av/UPnP-av-RenderingControl-v1-Service.pdf).
 */
@interface UPPRenderingControlService : UPPBasicService

#pragma mark - Mute Status

///-----------------------------------------------------------------------------
/// @name Mute Status
///-----------------------------------------------------------------------------

/**
 Get mute status for a specific channel

 @param instanceId The instance identifier
 @param channel    The channel to retrieve mute status for. Defaults to `Master`.
 @param completion A completion block which returns the parsed response, or an
 */
- (void)muteWithInstanceID:(NSString *)instanceId channel:(NSString *)channel completion:(UPPResponseBlock)completion;

/**
 Set mute status for a specific channel

 @param mute       Set to `YES` to mute, or `NO` to un-mute
 @param instanceId The instance identifier
 @param channel    The channel to retrieve mute status for. Defaults to `Master`.
 @param success    A block which returns the success state of the call, along
     with an error object if the call was unsuccessful.
 */
- (void)setMute:(BOOL)mute withInstanceID:(NSString *)instanceId channel:(NSString *)channel success:(UPPSuccessBlock)successBlock;


#pragma mark - Volume

///-----------------------------------------------------------------------------
/// @name Volume
///-----------------------------------------------------------------------------

/**
 Get volume for a specific channel

 @param instanceId The instance identifier
 @param channel    The channel to retrieve volume status for. Defaults to
     `Master`.
 @param completion A completion block which returns the parsed response, or an
 */
- (void)volumeWithInstanceID:(NSString *)instanceId channel:(NSString *)channel completion:(UPPResponseBlock)completion;

/**
 Set volume for a specific channel

 @param volume     The volume value to send
 @param instanceId The instance identifier
 @param channel    The channel to retrieve volume status for. Defaults to
     `Master`.
 @param success    An optional block which returns the success state of the call,
      along with an error object if the call was unsuccessful.
 */
- (void)setVolume:(NSNumber *)volume withInstanceID:(NSString *)instanceId channel:(NSString *)channel success:(UPPSuccessBlock)successBlock;

@end
