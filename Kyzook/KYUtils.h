//
//  KYUtils.h
//  Kyzook
//
//  Created by Sudhi.S on 04/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SocialNetWorkHandlers.h"
#import "SVProgressHUD.h"
#import "JVFloatLabeledTextField.h"
#import "UIColor+BFPaperColors.h"
@interface KYUtils : NSObject



+(KYUtils*)sharedInstance;

-(void)successWithMessage:(NSString *)message;
-(void)errorWithMessage:(NSString *)message;
-(void)blockUI;
-(void)unblockUI;
-(void)signInOrSignUpWithFacebook;
-(void)signInOrSignUpWithTwitter;
-(void)setFieldPrpperties:(NSArray *) textFields placeHolder:(NSArray *)textFieldsValue;
-(BOOL)isAllFeildsAreNotEmpty:(NSArray *)textFeilds andItsValidationMessages:(NSArray *)messages;
-(void)showAlertWithMessage:(NSString *)message andTitle:(NSString *)title;
@end
