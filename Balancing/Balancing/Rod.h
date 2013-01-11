//
//  Rod.h
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 11.01.2013.
//  Copyright (c) 2013 AGDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CorrectionMass;

@interface Rod : NSManagedObject

@property (nonatomic, retain) NSNumber * aX;
@property (nonatomic, retain) NSNumber * aY;
@property (nonatomic, retain) NSNumber * bX;
@property (nonatomic, retain) NSNumber * bY;
@property (nonatomic, retain) NSNumber * mass;
@property (nonatomic, retain) NSNumber * massX;
@property (nonatomic, retain) NSNumber * massY;
@property (nonatomic, retain) CorrectionMass *correctionMass;

@end
