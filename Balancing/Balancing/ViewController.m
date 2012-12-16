//
//  ViewController.m
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 15.12.2012.
//  Copyright (c) 2012 AGDev. All rights reserved.
//

#import "ViewController.h"
#import "AddPopoverFirstTableViewController.h"
#import "QuartzView.h"

@interface ViewController ()
{
    UIPopoverController *addPopoverController;
}

@property (nonatomic, retain) UIPopoverController *addPopoverController;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view = [QuartzView new];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(presentAddPopover:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)presentAddPopover:(UIBarButtonItem *)sender
{
    if (!self.addPopoverController.isPopoverVisible)
    {
        AddPopoverFirstTableViewController *addPopoverFTVC = [AddPopoverFirstTableViewController new];
        UIPopoverController *addPopover = [[UIPopoverController alloc]
                                     initWithContentViewController:addPopoverFTVC];
    
        self.addPopoverController = addPopover;
    
        [self.addPopoverController presentPopoverFromBarButtonItem:sender
                                   permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}

@end
