//
//  Country.h
//  Trip
//
//  Created by shustreek on 08.03.16.
//  Copyright (c) 2016 shustreek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject
@property (copy, nonatomic) NSNumber * geonameId;
@property (copy, nonatomic) NSString * coutryName;
+ (NSArray *)coutryArrayFromJsonArray:(NSArray *)array;

@end
