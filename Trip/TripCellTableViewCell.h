//
//  TripCellTableViewCell.h
//  Trip
//
//  Created by shustreek on 12.04.16.
//  Copyright (c) 2016 shustreek. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Trip.h"



@interface TripCellTableViewCell : UITableViewCell

- (void)configureWithTrips:(Trip*)trip;
@end



//#import <UIKit/UIKit.h>
//#import "OSNominees.h"
//
//@interface OSNomineesTableViewCell : UITableViewCell
//- (void)configureWithNominees:(OSNominees *)nominees;
//@end
//
