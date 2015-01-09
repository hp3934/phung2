//
//  KYRestAPI.m
//  Kyzook
//
//  Created by Sudhi.S on 02/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#import "KYRestAPI.h"
#import "KYUtils.h"
#import "KYSession.h"
#import "AppDelegate.h"

@implementation KYRestAPI
+(KYRestAPI*)sharedInstance
{
    static KYRestAPI *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[KYRestAPI alloc] init];
    });
    return _sharedInstance;
}


#pragma mark- Login 
//@Parameters username,password
//POST
-(void)login:(NSString  *)username andPassword:(NSString *)password success:(void (^)(User *))callbackBlock
{
   
    [[KYUtils sharedInstance] blockUI];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
     manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager POST:POST_LOGIN
       parameters:@{@"username": username,@"password":password}
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSDictionary *dictionary=responseObject;
             NSDictionary *userDetails=dictionary[@"user"];
              User *user = [KYSession sharedInstance].user;
              user.username=username;
              user.uid=userDetails[@"uid"];
              user.access=userDetails[@"access"];
              user.session_name=dictionary[@"session_name"];
              user.sessionid=dictionary[@"sessionid"];
              AppDelegate *app = [[UIApplication sharedApplication] delegate];
              [app saveContext] ;
               [[KYUtils sharedInstance] unblockUI];
              callbackBlock(user);
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
              [[KYUtils sharedInstance]errorWithMessage:@"Invalid username/Password"];
          }];
    
}
#pragma mark- Registration
//@Parameters name,pass,mail
//POST
-(void)registeration:(NSString *)email username:(NSString *)username andPassword:(NSString *)password success:(void (^)(User *))callbackBlock
{
      [[KYUtils sharedInstance] blockUI];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:POST_REGISTRATION
       parameters:@{@"name":username,@"pass": password,@"mail": email}
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSDictionary *dictionary=responseObject;
              User *user = [KYSession sharedInstance].user;
              user.username=username;
              user.uid=dictionary[@"uid"];
                     [[KYUtils sharedInstance]successWithMessage:@"Registration success.Please login.."];
              callbackBlock(user);
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         
              [[KYUtils sharedInstance]errorWithMessage:@"Server erorr"];
          }];
}
#pragma mark- Create Story
//@Parameters name,pass,mail
//POST
-(void)createStory:(Story *)story
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:CREATE_STORY
       parameters:@{@"type": @"story",@"title": story.title,@"body[und][0][value]": story.body}
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSLog(@"JSON: %@", responseObject);
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
           
              [[KYUtils sharedInstance]errorWithMessage:@"Server erorr"];
          }];
}

#pragma mark- Upload Fiile
//@Parameters name,pass,mail
//POST
-(void)uploadFile:(User *)user
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSURL *filePath = [NSURL fileURLWithPath:@"file://path/to/image.png"];
    [manager POST:@"http://samwize.com/api/poo/"
       parameters:@{@"uid":user.uid}
        constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    [formData appendPartWithFileURL:filePath name:@"image" error:nil];
     } success:^(AFHTTPRequestOperation *operation, id responseObject) {
           NSLog(@"Success: %@", responseObject);
       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

           [[KYUtils sharedInstance]errorWithMessage:@"Server erorr"];
     } ];
}

#pragma mark- Category options
//@Parameters name,pass,mail
//GET
-(void)categoryOptions:(User *)user
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:GET_EXPERIENCE_LIST
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"JSON: %@", responseObject);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

             [[KYUtils sharedInstance]errorWithMessage:@"Server erorr"];
         }];
}
//@Parameters args[0]=55&display_id=page_1
//GET
-(void)getAllPostings:(User *)user
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:GET_EXPERIENCE_LIST
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"JSON: %@", responseObject);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             [[KYUtils sharedInstance]errorWithMessage:@"Server erorr"];
         }];
    
}
//@Parameters
//POST
-(void)follow:(Story *)story
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:CREATE_STORY
       parameters:@{@"type": @"story",@"title": story.title,@"body[und][0][value]": story.body}
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSLog(@"JSON: %@", responseObject);
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              [[KYUtils sharedInstance]errorWithMessage:@"Server erorr"];
          }];
}
//@Parameters args[0]=55&display_id=page_1
//GET
-(void)getExperienceDetils:(User *)user
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:GET_EXPERIENCE_LIST
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"JSON: %@", responseObject);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             [[KYUtils sharedInstance]errorWithMessage:@"Server erorr"];
         }];
    
}
//@Parameters args[0]=55&display_id=page_1
//GET
-(void)getExperienceList:(User *)user success:(void (^)(NSArray *))callbackBlock
{
    [[KYUtils sharedInstance] blockUI];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:GET_EXPERIENCE_LIST
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             [[KYUtils sharedInstance] unblockUI];
             NSArray *array=responseObject;
             callbackBlock(array);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             [[KYUtils sharedInstance]errorWithMessage:@"Server erorr"];
         }];
    
}
//@Parameters args[0]=55&display_id=page_1
//GET
-(void)getUserStories:(User *)user
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:STORIES_OF_USER
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"JSON: %@", responseObject);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             [[KYUtils sharedInstance]errorWithMessage:@"Server erorr"];
         }];
}
@end
