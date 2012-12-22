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
    UITableView *tableView;
    UIButton *rollerSupportButton;
    UIButton *pinnedSupportButton;
    BOOL rollerSupport;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UIButton *rollerSupportButton;
@property (nonatomic, retain) IBOutlet UIButton *pinnedSupportButton;
@property (nonatomic) BOOL rollerSupport;

- (IBAction)rollerSupportButtonTouched:(id)sender;
- (IBAction)pinnedSupportButtonTouched:(id)sender;
- (IBAction)cancel:(id)sender;

@end
