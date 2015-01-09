//
//  KYLoginViewController.m
//  Kyzook
//
//  Created by Sudhi.S on 04/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#import "KYLoginViewController.h"



@interface KYLoginViewController ()<UITextFieldDelegate>

@end

@implementation KYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[KYUtils sharedInstance] setFieldPrpperties:@[_username,_password] placeHolder:@[@"Username",@"Password"]];
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
       [self showHomeViewController];
}

- (IBAction)onSignInWithFacebook:(id)sender {
     [[KYUtils sharedInstance] signInOrSignUpWithFacebook];
}

- (IBAction)onSignInWithTwitter:(id)sender {
     [[KYUtils sharedInstance] signInOrSignUpWithFacebook];
}

- (IBAction)onSignInWithAccount:(id)sender {
 
   
    if([[KYUtils sharedInstance]isAllFeildsAreNotEmpty:@[_username,_password] andItsValidationMessages:@[@"Username",@"Password"]]){
        [[KYRestAPI sharedInstance]login:_username.text andPassword:_password.text success:^(User *user) {
        [self showHomeViewController];
        }];
        
 }
}
-(void)showHomeViewController{
   [super setRootControllerAs:@"KYHomeViewController"];
}
- (IBAction)onSignUp:(id)sender {
     [super setRootControllerAs:@"KYRegisterViewController"];
}

#pragma mark- textField returns
-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    NSInteger nextTag = textField.tag + 1;
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder&&nextTag!=3) {
        [nextResponder becomeFirstResponder];
    }else if (nextTag==3)
    {
        [self.view endEditing:YES];
          [self onSignInWithAccount:self];
    }else {
        [textField resignFirstResponder];
    }
    return NO;
}


@end
