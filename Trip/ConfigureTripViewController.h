//
//  ConfigureTripViewController.h
//  Trip
//
//  Created by shustreek on 08.03.16.
//  Copyright (c) 2016 shustreek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Trip.h"
@protocol ConfigureViewControllerDelegate;
@interface ConfigureTripViewController : UIViewController
@property (weak, nonatomic) id<ConfigureViewControllerDelegate> delegate;

@end

@protocol ConfigureViewControllerDelegate <NSObject>

- (void)configureTripViewControllerDidCreateTrip:(Trip *)trip;
//- (void)configureTripViewControllerDidUpdateTrip;

@end




