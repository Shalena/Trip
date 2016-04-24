//
//  Country+Serialization.h
//  Trip
//
//  Created by helena on 24.04.16.
//  Copyright © 2016 shustreek. All rights reserved.
//

#import "Country.h"

@interface Country (Serialization)

+ (NSArray *)countryArrayFromJsonArray:(NSArray *)array;

@end
