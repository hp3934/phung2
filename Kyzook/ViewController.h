//
//  ViewController.h
//  Kyzook
//
//  Created by Sudhi.S on 01/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "PageContentViewController.h"
#import "KYLoginViewController.h"
#import "KYRegisterViewController.h"

@interface ViewController : BaseViewController<UIPageViewControllerDataSource>


@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageImages;

@end

