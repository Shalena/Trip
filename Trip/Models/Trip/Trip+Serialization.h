//
//  Trip+Serialization.h
//  Trip
//
//  Created by helena on 24.04.16.
//  Copyright © 2016 shustreek. All rights reserved.
//

#import "Trip.h"

@interface Trip (Serialization)
+ (Trip *)tripWithCountry:(Country *)country city:(City *)city;
@end
