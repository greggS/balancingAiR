//
//  Support.h
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 20.01.2013.
//  Copyright (c) 2013 AGDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class EndPoint;

@interface Support : NSManagedObject

@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) EndPoint *endPoint;

@end
