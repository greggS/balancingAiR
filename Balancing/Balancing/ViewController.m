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
#import "Rod.h"
#import "Support.h"
#import "AppDelegate.h"

@interface ViewController ()
{
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view = [QuartzView new];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                             target:self
                                             action:@selector(presentAddPopover:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithTitle:@"Calculate correction masses"
                                              style:UIBarButtonItemStyleBordered
                                              target:self
                                              action:@selector(calculate)];
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
        AddPopoverFirstTableViewController *addPopoverFTVC = [[AddPopoverFirstTableViewController alloc] initWithStyle:UITableViewStylePlain];
        addPopoverFTVC.contentSizeForViewInPopover = CGSizeMake(320, 132);
        UINavigationController *nVC = [[UINavigationController alloc] initWithRootViewController:addPopoverFTVC];
        UIPopoverController *addPopover = [[UIPopoverController alloc]
                                     initWithContentViewController: nVC];

        
        self.addPopoverController = addPopover;
        
        addPopoverFTVC.addPopoverController = self.addPopoverController;
        addPopoverFTVC.quartzView = self.view;
    
        [self.addPopoverController presentPopoverFromBarButtonItem:sender
                                   permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}

- (void)calculate
{
    AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *dataContext = [appDelegate managedObjectContext];
    
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Rod"
                                              inManagedObjectContext:dataContext];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [dataContext executeFetchRequest:fetchRequest error:&error];
    
    for (Rod *rod in fetchedObjects)
    {
        if (rod.correctionMass == NULL) {
            float xEnd;
            float yEnd;
            float mass;
            
            //mathematics
            float p;
            p=sqrtf(abs([rod.aX floatValue] - [rod.bX floatValue])^2 +
                    abs([rod.aY floatValue] - [rod.bY floatValue])^2);
            xEnd = (([rod.bX floatValue] - [rod.aX floatValue]) * (p+50) - [rod.bX floatValue]*p)/p;
            
            
            
        }
    }
}

@end
