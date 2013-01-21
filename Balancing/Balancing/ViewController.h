//
//  ViewController.h
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 15.12.2012.
//  Copyright (c) 2012 AGDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mechanism.h"

@interface ViewController : UIViewController 
{
    UIPopoverController *addPopoverController;
    Mechanism *currentMechanism;
}

@property (nonatomic, retain) UIPopoverController *addPopoverController;
@property (nonatomic, strong) Mechanism *currentMechanism;

- (void)createNewMechanism;
- (void)presentMechanisms;

@end
