//
//  Rod.h
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 22.12.2012.
//  Copyright (c) 2012 AGDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Rod : NSManagedObject

@property (nonatomic, retain) NSNumber * aX;
@property (nonatomic, retain) NSNumber * aY;
@property (nonatomic, retain) NSNumber * bX;
@property (nonatomic, retain) NSNumber * bY;
@property (nonatomic, retain) NSNumber * mass;
@property (nonatomic, retain) NSNumber * massX;
@property (nonatomic, retain) NSNumber * massY;

@end
