//
//  Trip+FetchRequests.m
//  Trip
//
//  Created by helena on 24.04.16.
//  Copyright © 2016 shustreek. All rights reserved.
//

#import "Trip+FetchRequests.h"
#import "CoreDataStack.h"

@implementation Trip (FetchRequests)
+ (NSArray *)getAllTrips{
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Trip"];
    return [[CoreDataStack defaultCoreDataStack].managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
}
@end
