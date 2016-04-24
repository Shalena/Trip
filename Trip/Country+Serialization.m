//
//  Country+Serialization.m
//  Trip
//
//  Created by helena on 24.04.16.
//  Copyright © 2016 shustreek. All rights reserved.
//

#import "Country+Serialization.h"
#import "CoreDataStack.h"

@implementation Country (Serialization)

+ (NSArray *)countryArrayFromJsonArray:(NSArray *)array{
    NSMutableArray *result = [NSMutableArray array];
    NSManagedObjectContext *context = [CoreDataStack defaultCoreDataStack].managedObjectContext;
    for (NSDictionary *dictionary in array) {
        Country * country = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([self class]) inManagedObjectContext:context];
        country.countryName = dictionary [@"countryName"];
        country.geonameId = dictionary [@"geonameId"];
        
        [result addObject:country];
    }
    [context save:nil];
    return result;
}
@end
