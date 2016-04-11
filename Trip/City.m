//
//  City.m
//  Trip
//
//  Created by shustreek on 05.04.16.
//  Copyright (c) 2016 shustreek. All rights reserved.
//

#import "City.h"

@implementation City
+ (NSArray *)cityArrayFromJsonArray:(NSArray *)array{
    NSMutableArray *result = [NSMutableArray array];
    
    for (NSDictionary *dictionary in array) {
        City * city = [City new];
        city.cityName = dictionary [@"name"];
        
        
        [result addObject:city];
    }
    
    return result;
}



@end








