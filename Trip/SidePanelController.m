//
//  SidePanelController.m
//  Trip
//
//  Created by shustreek on 09.03.16.
//  Copyright (c) 2016 shustreek. All rights reserved.
//

#import "SidePanelController.h"

@interface SidePanelController ()

@end

@implementation SidePanelController

- (void)awakeFromNib {
    [self setLeftPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"JALeftViewController"]];
    [self setCenterPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"CenterPanel"]];
}
@end
