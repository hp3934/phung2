//
//  PageContentViewController.h
//  Kyzook
//
//  Created by Sudhi.S on 04/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "BaseViewController.h"

@interface PageContentViewController : BaseViewController


@property (weak, nonatomic) IBOutlet UIImageView *themeImage;
@property NSUInteger pageIndex;
@property NSString *imageFile;
@property (weak, nonatomic) IBOutlet UILabel *swipeDownImg;
@property (weak, nonatomic) IBOutlet UIImageView *downImg;

@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
- (IBAction)onNextButtonClick:(id)sender;
@end
