//
//  KYExperienceTableViewCell.h
//  Kyzook
//
//  Created by Sudhi.S on 08/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface KYExperienceTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *bulletIconTwo;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *experienceImage;

@property (strong, nonatomic) NSDictionary *cellData;
@property (strong, nonatomic) NSArray *imageUrls;
-(void)setTableCellData:(NSDictionary *)cellData ;
@end
