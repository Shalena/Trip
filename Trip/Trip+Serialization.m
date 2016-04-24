//
//  Trip+Serialization.m
//  Trip
//
//  Created by helena on 24.04.16.
//  Copyright © 2016 shustreek. All rights reserved.
//

#import "Trip+Serialization.h"
#import "CoreDataStack.h"

@implementation Trip (Serialization)

+ (Trip *)tripWithCountry:(Country *)country city:(City *)city{
    NSManagedObjectContext *context = [CoreDataStack defaultCoreDataStack].managedObjectContext;
    Trip *trip = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([self class]) inManagedObjectContext:context];
    trip.country = country;
    trip.city = city;
    [context save:nil];
    return trip;
}



@end
