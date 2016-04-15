//
//  TripCellTableViewCell.m
//  Trip
//
//  Created by shustreek on 12.04.16.
//  Copyright (c) 2016 shustreek. All rights reserved.
//

#import "TripCellTableViewCell.h"
#import "Trip.h"
#import "Country.h"
#import "City.h"


@interface TripCellTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation TripCellTableViewCell
- (void)configureWithTrips:(Trip*)trip {
    self.countryLabel.text = trip.country.countryName;
    self.cityLabel.text = trip.city.cityName;

}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end


