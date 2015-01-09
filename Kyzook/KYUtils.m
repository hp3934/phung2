//
//  KYUtils.m
//  Kyzook
//
//  Created by Sudhi.S on 04/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#import "KYUtils.h"

const static CGFloat kJVFieldFontSize = 16.0f;
const static CGFloat kJVFieldFloatingLabelFontSize = 11.0f;

@interface KYUtils ()

@property SocialNetWorkHandlers *socialNetworkHandler;

@end
@implementation KYUtils

+(KYUtils*)sharedInstance
{
    static KYUtils *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[KYUtils alloc] init];
        _sharedInstance.socialNetworkHandler=[[SocialNetWorkHandlers alloc]init];
    });
    return _sharedInstance;
}

-(void)blockUI
{
    [SVProgressHUD showWithStatus:@"Please wait..."];
}
-(void)successWithMessage:(NSString *)message
{
    [SVProgressHUD showSuccessWithStatus:message];
}
-(void)errorWithMessage:(NSString *)message
{
    [SVProgressHUD showErrorWithStatus:message];
}
-(void)unblockUI
{
    [SVProgressHUD dismiss];
}
-(void)signInOrSignUpWithFacebook
{
    [_socialNetworkHandler signInOrSignUpWithFacebook];
}
-(void)signInOrSignUpWithTwitter
{
     [_socialNetworkHandler signInOrSignUpWithTwitter];
}
-(void)setField:(JVFloatLabeledTextField *) textFeild feildName:(NSString *)name
{
    textFeild.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:NSLocalizedString(name, @"")
                                    attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    textFeild.font = [UIFont systemFontOfSize:kJVFieldFontSize];
    textFeild.floatingLabel.font = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    textFeild.floatingLabelTextColor = [UIColor paperColorBlue200];
    textFeild.clearButtonMode = UITextFieldViewModeWhileEditing;
}
-(void)setFieldPrpperties:(NSArray *) textFields placeHolder:(NSArray *)textFieldsValue
{
    for (int i=0;i<textFields.count;i++) {
        [self setField:textFields[i] feildName:textFieldsValue[i]];
        
    }
}
-(BOOL)isAllFeildsAreNotEmpty:(NSArray *)textFeilds andItsValidationMessages:(NSArray *)messages{
    for (int i=0;i<textFeilds.count;i++) {
        JVFloatLabeledTextField *textFeild=textFeilds[i];
        if([[textFeild.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0){
            [self showAlertWithMessage:[NSString stringWithFormat:@"Please fill the %@",messages[i]] andTitle:@"Incomplete submission !"];
            return false;
        }
        
    }
    return true;
}
-(void)showAlertWithMessage:(NSString *)message andTitle:(NSString *)title
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
@end
