//
//  City.h
//  Trip
//
//  Created by shustreek on 05.04.16.
//  Copyright (c) 2016 shustreek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property (copy, nonatomic) NSString * cityName;

+ (NSArray *)cityArrayFromJsonArray:(NSArray *)array;

@end
