//
//  Country.m
//  Trip
//
//  Created by shustreek on 08.03.16.
//  Copyright (c) 2016 shustreek. All rights reserved.
//

#import "Country.h"

@implementation Country
+ (NSArray *)countryArrayFromJsonArray:(NSArray *)array{
    NSMutableArray *result = [NSMutableArray array];
    
    for (NSDictionary *dictionary in array) {
        Country * country = [Country new];
        country.countryName = dictionary [@"countryName"];
        country.geonameId = dictionary [@"geonameId"];
        
        [result addObject:country];
    }
    return result;
}

@end
