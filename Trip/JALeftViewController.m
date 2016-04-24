//
//  JALeftViewController.m
//  Trip
//
//  Created by shustreek on 09.03.16.
//  Copyright (c) 2016 shustreek. All rights reserved.
//

#import "JALeftViewController.h"
#import "ConfigureTripViewController.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"

@interface JALeftViewController ()<UITableViewDataSource>

@end

@implementation JALeftViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row ==0) {
       [self.sidePanelController showCenterPanelAnimated:YES];
    } else if (indexPath.row ==1) {
        [self.sidePanelController showCenterPanelAnimated:YES];
        UINavigationController *navigationController = (UINavigationController *)self.sidePanelController.centerPanel;
        
        ConfigureTripViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ConfigureTripViewController"];
        [navigationController showViewController:controller sender:self];
        
    }
}

@end




