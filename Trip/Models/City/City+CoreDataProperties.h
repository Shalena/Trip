//
//  City+CoreDataProperties.h
//  Trip
//
//  Created by helena on 24.04.16.
//  Copyright © 2016 shustreek. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "City.h"

NS_ASSUME_NONNULL_BEGIN

@interface City (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) Trip *trip;

@end

NS_ASSUME_NONNULL_END
