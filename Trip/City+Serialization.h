//
//  City+Serialization.h
//  Trip
//
//  Created by helena on 24.04.16.
//  Copyright © 2016 shustreek. All rights reserved.
//

#import "City.h"

@interface City (Serialization)
+ (NSArray *)cityArrayFromJsonArray:(NSArray *)array;
@end
