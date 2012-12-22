//
//  Support.h
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 22.12.2012.
//  Copyright (c) 2012 AGDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Support : NSManagedObject

@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSNumber * x;
@property (nonatomic, retain) NSNumber * y;

@end
