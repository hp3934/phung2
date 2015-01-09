//
//  SocialNetWorkHandlers.h
//  Kyzook
//
//  Created by Sudhi.S on 06/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <FacebookSDK/FacebookSDK.h>
#import "KYUtils.h"
#import "User.h"

@interface SocialNetWorkHandlers : NSObject
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
-(void)signInOrSignUpWithFacebook;
-(void)signInOrSignUpWithTwitter;

@end
