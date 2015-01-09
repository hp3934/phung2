//
//  KYRegisterViewController.h
//  Kyzook
//
//  Created by Sudhi.S on 04/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JVFloatLabeledTextField.h"
#import "AppDelegate.h"
#import "KYUtils.h"
#import "BaseViewController.h"
#import "KYRestAPI.h"
#import "KYSession.h"

@interface KYRegisterViewController : BaseViewController
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *email;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *username;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *password;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;


- (IBAction)onForgotPassword:(id)sender;
- (IBAction)onSignUpWithFacebook:(id)sender;
- (IBAction)onSignUpWithTwitter:(id)sender;
- (IBAction)onSignUpWithAccount:(id)sender;
- (IBAction)onSignIn:(id)sender;


@end
