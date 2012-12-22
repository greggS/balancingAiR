//
//  AddPopoverFirstTableViewController.h
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 16.12.2012.
//  Copyright (c) 2012 AGDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPopoverFirstTableViewController : UITableViewController
{
    NSArray *tableTitlesArray;
    UIPopoverController *addPopoverController;
}

@property (nonatomic, retain) NSArray *tableTitlesArray;
@property (nonatomic, retain) UIPopoverController *addPopoverController;

@end
