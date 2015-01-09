//
//  BaseViewController.m
//  Kyzook
//
//  Created by Sudhi.S on 01/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)setRootControllerAs:(NSString *)controllerId
{
    AppDelegate *app = [[UIApplication sharedApplication] delegate];
    UIViewController  * controller=[self.storyboard instantiateViewControllerWithIdentifier:controllerId];
    app.window.rootViewController = controller;
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self viewDown];
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
      [self viewUP];
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    [self viewDown];
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
     [self viewUP];
}
-(void)viewUP
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    self.view.frame = CGRectMake(self.view.frame.origin.x , (self.view.frame.origin.y + 80), self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
}
-(void)viewDown
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    self.view.frame = CGRectMake(self.view.frame.origin.x , (self.view.frame.origin.y - 80), self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
}
@end
