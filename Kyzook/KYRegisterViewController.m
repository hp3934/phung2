//
//  KYRegisterViewController.m
//  Kyzook
//
//  Created by Sudhi.S on 04/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#import "KYRegisterViewController.h"

@interface KYRegisterViewController ()<UITextFieldDelegate>

@end

@implementation KYRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[KYUtils sharedInstance]  setFieldPrpperties:@[_email,_username,_password] placeHolder:@[@"Email",@"Username",@"Password"]];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
}
-(void)dismissKeyboard {
    [self.view endEditing:YES];
}
#pragma mark- Button Clicks
- (IBAction)onForgotPassword:(id)sender {
}

- (IBAction)onSignUpWithFacebook:(id)sender {
     [[KYUtils sharedInstance] signInOrSignUpWithFacebook];
}

- (IBAction)onSignUpWithTwitter:(id)sender {
       [[KYUtils sharedInstance] signInOrSignUpWithTwitter];
}

- (IBAction)onSignUpWithAccount:(id)sender {
   
    if([[KYUtils sharedInstance]isAllFeildsAreNotEmpty:@[_email,_username,_password] andItsValidationMessages:@[@"Email",@"Username",@"Password"]]){
            [[KYRestAPI sharedInstance]registeration:_email.text username:_username.text andPassword:_password.text  success:^(User *user) {
           
                [self showLoginController];
            }];
            
    }
}
-(void)showLoginController{
    [super setRootControllerAs:@"KYLoginViewController"];
}
- (IBAction)onSignIn:(id)sender {
    [super setRootControllerAs:@"KYLoginViewController"];
}

#pragma mark- textField returns
-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    NSInteger nextTag = textField.tag + 1;
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder&&nextTag!=4) {
        [nextResponder becomeFirstResponder];
    }else if (nextTag==4)
    {
        [self.view endEditing:YES];
        [self onSignUpWithAccount:self];
    }else {
        [textField resignFirstResponder];
    }
    return NO;
}


@end
