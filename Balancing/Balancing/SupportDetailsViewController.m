//
//  SupportDetailsViewController.m
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 22.12.2012.
//  Copyright (c) 2012 AGDev. All rights reserved.
//

#import "SupportDetailsViewController.h"
#import "Support.h"
#import "Rod.h"
#import "EndPoint.h"
#import "ViewController.h"
#import "AppDelegate.h"

@interface SupportDetailsViewController ()
{
    NSInteger selectedCell;
}

@property (nonatomic) NSInteger selectedCell;

@end

@implementation SupportDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.rollerSupport = NO;
        self.selectedCell = -1;
        self.rodEndPointsArray = [NSMutableArray new];
        
        //fetching EndPoint coordinates for tableView
        AppDelegate *appDelegate =
        [[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *dataContext = [appDelegate managedObjectContext];
        NSError *error;
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"EndPoint"
                                                  inManagedObjectContext:dataContext];
        [fetchRequest setEntity:entity];
        NSArray *fetchedObjects = [dataContext executeFetchRequest:fetchRequest error:&error];
       
        BOOL isFirstRod = TRUE; //avoid duplication of points in tableView
        for (Rod *rod in fetchedObjects) {
            if (isFirstRod && rod.mechanism == self.currentMechanism) {
                CGPoint pointA = CGPointMake([rod.aPoint.x floatValue], [rod.aPoint.y floatValue]);
                NSValue *aValue = [NSValue valueWithCGPoint:pointA];
                [self.rodEndPointsArray  addObject: rod.aPoint];
                isFirstRod = FALSE;
            }
            
            CGPoint pointB = CGPointMake([rod.bPoint.x floatValue], [rod.bPoint.y floatValue]);
            NSValue *bValue = [NSValue valueWithCGPoint:pointB];
            [self.rodEndPointsArray  addObject: rod.bPoint];
        }
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self performSelector:@selector(highlightButton:) withObject:nil afterDelay:0.0];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)rollerSupportButtonTouched:(id)sender
{
    self.rollerSupport = YES;
    [self performSelector:@selector(highlightButton:) withObject:nil afterDelay:0.0];
}

- (IBAction)pinnedSupportButtonTouched:(id)sender
{
    self.rollerSupport = NO;
    [self performSelector:@selector(highlightButton:) withObject:nil afterDelay:0.0];
}

- (void)highlightButton:(UIButton *)button
{
    if (self.rollerSupport)
    {
        [self.rollerSupportButton setHighlighted:YES];
        [self.pinnedSupportButton setHighlighted:NO];
    }
    else
    {
        [self.rollerSupportButton setHighlighted:NO];
        [self.pinnedSupportButton setHighlighted:YES];
    }
    
}

- (IBAction)done:(id)sender
{
    if (self.selectedCell != -1)
    {        
        EndPoint *endPoint = [self.rodEndPointsArray objectAtIndex:self.selectedCell];
            
        //saving the support with CoreData
        AppDelegate *appDelegate =
        [[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *context = [appDelegate managedObjectContext];
        Support *newSupport = [NSEntityDescription
                       insertNewObjectForEntityForName:@"Support"
                       inManagedObjectContext:context];
        newSupport.endPoint = endPoint;
        
        if (self.rollerSupport)
            newSupport.type = @"Roller";
        else
            newSupport.type = @"Grounded";
        
        
        
        NSError *error;
        if (![context save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
        
//        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Support"
//                                                  inManagedObjectContext:context];
//        [fetchRequest setEntity:entity];
//        NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
//        for (Support *support in fetchedObjects) {
//            NSLog (@"Created new support with parameters:");
//            NSLog (@"x: %@", support.x);
//            NSLog (@"y: %@", support.y);
//            NSLog (@"%@", support.type);
//        }
        
        [self.quartzView setNeedsDisplay];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else {
        UIAlertView *noSelectedCoordinatesAlert = [[UIAlertView alloc] initWithTitle:@"Select coordinates from the list!"
                                                              message:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil, nil];
        [noSelectedCoordinatesAlert show];

    }
}

- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.rodEndPointsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    EndPoint *endPoint = [self.rodEndPointsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat: @"x: %0.1f y: %0.1f", [endPoint.x floatValue], [endPoint.y floatValue]];
    return cell;
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedCell = indexPath.row;
}


@end
