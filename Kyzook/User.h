//
//  User.h
//  Kyzook
//
//  Created by Sudhi.S on 08/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * uid;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * fbAccessKey;
@property (nonatomic, retain) NSString * twAccessKey;
@property (nonatomic, retain) NSString * fbId;
@property (nonatomic, retain) NSString * sessionid;
@property (nonatomic, retain) NSString * session_name;
@property (nonatomic, retain) NSString * access;

@end
