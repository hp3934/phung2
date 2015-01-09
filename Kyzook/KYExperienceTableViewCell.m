
//
//  KYExperienceTableViewCell.m
//  Kyzook
//
//  Created by Sudhi.S on 08/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#import "KYExperienceTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation KYExperienceTableViewCell

- (void)awakeFromNib {
    _bulletIconTwo.text=@"\u25CB";
}
-(void)setTableCellData:(NSDictionary *)cellData
{
    _cellData=cellData;
    _imageUrls=[cellData[@"upload_images"] componentsSeparatedByString:@","];
    _title.text  = _cellData[@"node_title"];
    _descriptionLabel.text=_cellData[@"description"];
    if(_imageUrls.count>0){
    [_experienceImage setImageWithURL:[NSURL URLWithString:_imageUrls[0] ] placeholderImage:[UIImage imageNamed:@"ic_default"]];
        
    }
}


@end
