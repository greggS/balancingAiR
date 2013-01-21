//
//  EndPoint.h
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 20.01.2013.
//  Copyright (c) 2013 AGDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Rod, Support;

@interface EndPoint : NSManagedObject

@property (nonatomic, retain) NSNumber * x;
@property (nonatomic, retain) NSNumber * y;
@property (nonatomic, retain) Support *support;
@property (nonatomic, retain) Rod *rod;

@end
