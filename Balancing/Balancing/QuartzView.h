//
//  QuartzView.h
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 15.12.2012.
//  Copyright (c) 2012 AGDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mechanism.h"

@interface QuartzView : UIView
{
    Mechanism *currentMechanism;
}

@property (nonatomic, retain) Mechanism *currentMechanism;

@end
