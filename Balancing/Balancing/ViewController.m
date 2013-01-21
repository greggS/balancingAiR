//
//  ViewController.m
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 15.12.2012.
//  Copyright (c) 2012 AGDev. All rights reserved.
//

#import "ViewController.h"
#import "AddPopoverFirstTableViewController.h"
#import "ModeSelectViewController.h"
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
    QuartzView *quartzView = [QuartzView new];
    quartzView.currentMechanism = self.currentMechanism;
    self.view = quartzView;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                             target:self
                                             action:@selector(presentAddPopover:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithTitle:@"Calculate correction masses"
                                              style:UIBarButtonItemStyleBordered
                                              target:self
                                              action:@selector(calculate)];
    [self performSelector:@selector(modeSelect) withObject:nil afterDelay:5];
    
    self.currentMechanism = nil;
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
        addPopoverFTVC.currentMechanism = self.currentMechanism;
    
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
            
            
        }
    }
}

- (void)modeSelect
{
    ModeSelectViewController *msVC = [ModeSelectViewController new];
    msVC.modalPresentationStyle = UIModalPresentationFormSheet;
    msVC.superViewController = self;
    [self presentViewController:msVC animated:YES completion:nil];
}

- (void)createNewMechanism
{
    AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Rod"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    Mechanism *newMechanism = [NSEntityDescription
                   insertNewObjectForEntityForName:@"Mechanism"
                   inManagedObjectContext:context];
    newMechanism.mechanismID = [NSNumber numberWithInt:[fetchedObjects count] + 1];

    self.currentMechanism = newMechanism;
}

- (void)presentMechanisms
{
    
}

@end
