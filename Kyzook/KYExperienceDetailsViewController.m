//
//  KYExperienceDetailsViewController.m
//  Kyzook
//
//  Created by Sudhi.S on 08/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#import "KYExperienceDetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface KYExperienceDetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *storyTitle;
@property (weak, nonatomic) IBOutlet UILabel *storyBy;
@property (weak, nonatomic) IBOutlet UIButton *posting;
@property (weak, nonatomic) IBOutlet UIButton *ratings;
@property (weak, nonatomic) IBOutlet UIButton *follow;
@property (weak, nonatomic) IBOutlet UIButton *contact;
@property (weak, nonatomic) IBOutlet UIImageView *storyImage;
@property (weak, nonatomic) IBOutlet UILabel *storyDesciption;
@property (strong, nonatomic) NSArray *imageUrls;

@end

@implementation KYExperienceDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageUrls=[_experineceListDetails[@"upload_images"] componentsSeparatedByString:@","];
    _storyTitle.text  = _experineceListDetails[@"node_title"];
    _storyDesciption.text=_experineceListDetails[@"description"];
    if(_imageUrls.count>0){
        [_storyImage setImageWithURL:[NSURL URLWithString:_imageUrls[0] ] placeholderImage:[UIImage imageNamed:@"ic_default"]];
        
    }
  
    CGSize textSize = CGSizeMake(230,9999);
    CGRect textRect = [_experineceListDetails[@"description"]
                       boundingRectWithSize:textSize
                       options:NSStringDrawingUsesLineFragmentOrigin
                       attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}
                       context:nil];
    CGSize size = textRect.size;
        _storyDesciption.frame=CGRectMake(_storyImage.frame.origin.x, _storyImage.frame.origin.y+_storyImage.frame.size.height+8, _storyImage.frame.size.width, size.height);
    _storyDesciption.lineBreakMode = YES;
    _storyDesciption.lineBreakMode = NSLineBreakByWordWrapping;
    _storyDesciption.numberOfLines =size.height;

}


@end
