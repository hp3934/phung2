//
//  KYRestAPI.h
//  Kyzook
//
//  Created by Sudhi.S on 02/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestURLs.h"
#import "User.h"
#import "Story.h"
#import "AFNetworking.h"

@interface KYRestAPI : NSObject
+(KYRestAPI*)sharedInstance;


-(void)login:(NSString  *)username andPassword:(NSString *)password success:(void (^)(User *))callbackBlock;
-(void)registeration:(NSString *)email username:(NSString *)username andPassword:(NSString *)password success:(void (^)(User *))callbackBlock;
-(void)getExperienceList:(User *)user success:(void (^)(NSArray *))callback;

-(void)createStory:(User *)user;
-(void)uploadFile:(User *)user;
-(void)categoryOptions:(User *)user;
-(void)getAllPostings:(User *)user;
-(void)follow:(Story *)story;
-(void)getExperienceDetils:(User *)user;
-(void)getUserStories:(User *)user;
@end
