//
//  City+Serialization.m
//  Trip
//
//  Created by helena on 24.04.16.
//  Copyright © 2016 shustreek. All rights reserved.
//

#import "City+Serialization.h"
#import "CoreDataStack.h"

@implementation City (Serialization)

+ (NSArray *)cityArrayFromJsonArray:(NSArray *)array{
    NSMutableArray *result = [NSMutableArray array];
    NSManagedObjectContext *context = [CoreDataStack defaultCoreDataStack].managedObjectContext;
    for (NSDictionary *dictionary in array) {
        City *city = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([self class]) inManagedObjectContext:context];
        city.name = dictionary [@"name"];
        
        [result addObject:city];
    }
    [context save:nil];
    return result;
}


@end
