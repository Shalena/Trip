//
//  Country.m
//  Trip
//
//  Created by shustreek on 08.03.16.
//  Copyright (c) 2016 shustreek. All rights reserved.
//

#import "Country.h"

@implementation Country
+ (NSArray *)coutryArrayFromJsonArray:(NSArray *)array{
    NSMutableArray *result = [NSMutableArray array];
    
    for (NSDictionary *dictionary in array) {
        Country * country = [Country new];
        country.coutryName = dictionary [@"countryName"];
        country.geonameId = dictionary [@"geonameId"];
        
        
       [result addObject:country];
    }
    
    return result;
}



@end
