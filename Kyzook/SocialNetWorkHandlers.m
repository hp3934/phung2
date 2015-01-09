//
//  SocialNetWorkHandlers.m
//  Kyzook
//
//  Created by Sudhi.S on 06/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#import "SocialNetWorkHandlers.h"
#import "KYSession.h"

@implementation SocialNetWorkHandlers

-(void)signInOrSignUpWithFacebook
{
    [[KYUtils sharedInstance]blockUI];
    if (FBSession.activeSession.state == FBSessionStateOpen
        || FBSession.activeSession.state == FBSessionStateOpenTokenExtended) {
        [FBSession.activeSession closeAndClearTokenInformation];
         [[KYUtils sharedInstance]unblockUI];
    } else {
        [FBSession openActiveSessionWithReadPermissions: @[@"basic_info", @"email", @"user_birthday"]
                                           allowLoginUI:YES
                                      completionHandler:
         ^(FBSession *session, FBSessionState state, NSError *error) {
             if (!error && state == FBSessionStateOpen){
                 User *user= [KYSession sharedInstance].user;
                 user.fbAccessKey=[[[FBSession activeSession] accessTokenData] accessToken];
                 [[FBRequest requestForMe] startWithCompletionHandler:
                  ^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *fbuser, NSError *error) {
                     if (!error) {
                          user.fbId=fbuser.objectID;
                         NSManagedObjectContext *context = [self managedObjectContext];
                         [context save:&error];
                        [[KYSession sharedInstance]setUser:user];
                        [[KYUtils sharedInstance]unblockUI];
                      }
                      else
                      {
                          [[KYUtils sharedInstance]unblockUI];
                          [[KYUtils sharedInstance]showAlertWithMessage:@"Facebook authentication failed.Please try again." andTitle:@"Authentication Failed!"] ;
                      }
                  }];
                 
          
             }else{
                     [[KYUtils sharedInstance]unblockUI];
                     [[KYUtils sharedInstance]showAlertWithMessage:@"Facebook authentication failed.Please try again." andTitle:@"Authentication Failed!"] ;
             }
         }];
    }
    

}
-(void)signInOrSignUpWithTwitter
{
    
}


@end
