//
//  PageContentViewController.m
//  Kyzook
//
//  Created by Sudhi.S on 04/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#import "PageContentViewController.h"

@implementation PageContentViewController
- (void)viewDidLoad
{
    [super viewDidLoad];   
    self.themeImage.image = [UIImage imageNamed:self.imageFile];
    if(_pageIndex==0){
        [_nextBtn setHidden:YES];
    }else{
        [_swipeDownImg setHidden:YES];
        [_downImg setHidden:YES];
    }
 
}
- (IBAction)onNextButtonClick:(id)sender {
    AppDelegate *app = [[UIApplication sharedApplication] delegate];
    UIViewController  * controller=[self.storyboard instantiateViewControllerWithIdentifier:@"KYLoginViewController"];
    app.window.rootViewController = controller;
}
@end
