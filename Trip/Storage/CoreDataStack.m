//
//  CoreDataStack.m
//  Trip
//
//  Created by helena on 24.04.16.
//  Copyright © 2016 shustreek. All rights reserved.
//

#import "CoreDataStack.h"

@implementation CoreDataStack
+ (instancetype)defaultCoreDataStack{
    static CoreDataStack *stack = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        stack = [[[self class] alloc] init];
        
        NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Trip" withExtension:@"momd"];
        NSURL *storeURL = [documentsURL URLByAppendingPathComponent:@"trip.sqlite"];
        
        [stack setupCoreDataStackWithType:NSSQLiteStoreType modelURL:modelURL storeURL:storeURL];
    });
    
    return stack;
}

- (void)setupCoreDataStackWithType:(NSString *)storeType modelURL:(NSURL *)modelURL storeURL:(NSURL *)storeURL
{
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_managedObjectModel];
    
    NSError *error = nil;
    NSPersistentStore *store = [_persistentStoreCoordinator addPersistentStoreWithType:storeType configuration:nil URL:storeURL options:nil error:&error];
    if (!store) {
        // perform automatic lightweight migration
        NSDictionary *options = @{ NSMigratePersistentStoresAutomaticallyOption: @YES, NSInferMappingModelAutomaticallyOption: @YES };
        store = [_persistentStoreCoordinator addPersistentStoreWithType:storeType configuration:nil URL:storeURL options:options error:&error];
        if (!store) {
            NSLog(@"Error: %@, %@", error.localizedDescription, error.userInfo);
            abort();
        }
    }
    
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    _managedObjectContext.persistentStoreCoordinator = _persistentStoreCoordinator;
}




@end
