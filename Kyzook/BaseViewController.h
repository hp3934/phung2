//
//  BaseViewController.h
//  Kyzook
//
//  Created by Sudhi.S on 01/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

-(void)textFieldDidBeginEditing:(UITextField *)textField;
-(void)textFieldDidEndEditing:(UITextField *)textField;
-(void)textViewDidBeginEditing:(UITextView *)textView;
-(void)textViewDidEndEditing:(UITextView *)textView;
-(void)setRootControllerAs:(NSString *)controllerId;
@end
