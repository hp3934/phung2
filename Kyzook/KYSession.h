//
//  KYSession.h
//  Kyzook
//
//  Created by Sudhi.S on 06/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface KYSession : NSObject

+(KYSession*)sharedInstance;
@property (strong, nonatomic) User *user;
@end
