//
//  SupportDetailsViewController.h
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 22.12.2012.
//  Copyright (c) 2012 AGDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SupportDetailsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *rodEndPointsArray;
    UITableView *tableView;
    UIButton *rollerSupportButton;
    UIButton *pinnedSupportButton;
    BOOL rollerSupport;
    
    UIView *quartzView;
}

@property (nonatomic, retain) NSMutableArray *rodEndPointsArray;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UIButton *rollerSupportButton;
@property (nonatomic, retain) IBOutlet UIButton *pinnedSupportButton;
@property (nonatomic) BOOL rollerSupport;
@property (nonatomic, retain) UIView *quartzView;

- (IBAction)done:(id)sender;
- (IBAction)rollerSupportButtonTouched:(id)sender;
- (IBAction)pinnedSupportButtonTouched:(id)sender;
- (IBAction)cancel:(id)sender;

@end
