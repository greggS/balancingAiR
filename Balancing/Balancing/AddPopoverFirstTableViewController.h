//
//  AddPopoverFirstTableViewController.h
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 16.12.2012.
//  Copyright (c) 2012 AGDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mechanism.h"

@interface AddPopoverFirstTableViewController : UITableViewController
{
    NSArray *tableTitlesArray;
    UIPopoverController *addPopoverController;
    UIView *quartzView;
    Mechanism *currentMechanism;
}

@property (nonatomic, retain) NSArray *tableTitlesArray;
@property (nonatomic, retain) UIPopoverController *addPopoverController;
@property (nonatomic, retain) UIView *quartzView;
@property (nonatomic, retain) Mechanism *currentMechanism;

@end
