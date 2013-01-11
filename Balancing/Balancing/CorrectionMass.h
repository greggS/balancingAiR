//
//  CorrectionMass.h
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 11.01.2013.
//  Copyright (c) 2013 AGDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Rod;

@interface CorrectionMass : NSManagedObject

@property (nonatomic, retain) NSNumber * rodLength;
@property (nonatomic, retain) NSNumber * massValue;
@property (nonatomic, retain) Rod *rod;

@end
