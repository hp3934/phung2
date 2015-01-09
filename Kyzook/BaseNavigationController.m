//
//  BaseNavigationController.m
//  Kyzook
//
//  Created by Sudhi.S on 01/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageWithColor:[UIColor paperColorRed]];
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.topItem.title=@"KYZOOK";
    [self.navigationBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                 [UIColor whiteColor], NSForegroundColorAttributeName,
                                                 nil, NSShadowAttributeName,
                                                 [UIFont fontWithName:@"Hiragino-Mincho-ProN-W3" size:14], NSFontAttributeName, nil]];
    [self.navigationBar  setTintColor:[UIColor whiteColor]];
    [self.navigationBar setTranslucent:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [[KYUtils sharedInstance]showAlertWithMessage:@"Your phone memory is very low" andTitle:@"KYZOOK"];
}



@end
