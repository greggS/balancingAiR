//
//  Rod.h
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 20.01.2013.
//  Copyright (c) 2013 AGDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CorrectionMass, EndPoint, Mechanism;

@interface Rod : NSManagedObject

@property (nonatomic, retain) NSNumber * mass;
@property (nonatomic, retain) NSNumber * massX;
@property (nonatomic, retain) NSNumber * massY;
@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) EndPoint *aPoint;
@property (nonatomic, retain) EndPoint *bPoint;
@property (nonatomic, retain) CorrectionMass *correctionMass;
@property (nonatomic, retain) Mechanism *mechanism;

@end
