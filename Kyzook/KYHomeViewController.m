//
//  KYHomeViewController.m
//  Kyzook
//
//  Created by Sudhi.S on 07/01/15.
//  Copyright (c) 2015 Lightrains Technolabs. All rights reserved.
//

#import "KYHomeViewController.h"
#import "KYRestAPI.h"
#import "KYExperienceDetailsViewController.h"


@interface KYHomeViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)  NSMutableArray *experineceList;
@end

@implementation KYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title=@"Experiences";
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
     [[KYRestAPI sharedInstance]getExperienceList:nil success:^(NSArray * data) {
         _experineceList =[data copy];
         [_tableView reloadData];
        
    }];
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"exDetails"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        KYExperienceDetailsViewController *detailController =[segue destinationViewController];
        detailController.experineceListDetails=_experineceList[indexPath.row];
        
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 128;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(_experineceList){
        return _experineceList.count;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kExperienceCell =@"ExperienceCell";
    KYExperienceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kExperienceCell];
    [cell setTableCellData:_experineceList[indexPath.row]];
    return cell;
}
@end
