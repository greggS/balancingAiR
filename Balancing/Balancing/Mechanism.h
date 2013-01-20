//
//  Mechanism.h
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 20.01.2013.
//  Copyright (c) 2013 AGDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Rod;

@interface Mechanism : NSManagedObject

@property (nonatomic, retain) NSNumber * mechanismID;
@property (nonatomic, retain) NSNumber * numberOfRods;
@property (nonatomic, retain) NSSet *rods;
@end

@interface Mechanism (CoreDataGeneratedAccessors)

- (void)addRodsObject:(Rod *)value;
- (void)removeRodsObject:(Rod *)value;
- (void)addRods:(NSSet *)values;
- (void)removeRods:(NSSet *)values;

@end
