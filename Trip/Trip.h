//
//  myTrip.h
//  Trip
//
//  Created by shustreek on 03.04.16.
//  Copyright (c) 2016 shustreek. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Country;
@class City;

@interface Trip : NSObject
@property (strong, nonatomic) Country *country;
@property (strong, nonatomic) City *city;

@end


