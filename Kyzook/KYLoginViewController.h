//
//  KYLoginViewController.h
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
#import "User.h"


@interface KYLoginViewController : BaseViewController
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *username;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *password;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

- (IBAction)onForgotPassword:(id)sender;
- (IBAction)onSignInWithFacebook:(id)sender;
- (IBAction)onSignInWithTwitter:(id)sender;
- (IBAction)onSignInWithAccount:(id)sender;
- (IBAction)onSignUp:(id)sender;

@end
