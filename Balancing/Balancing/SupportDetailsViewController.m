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
#import "ViewController.h"
#import "AppDelegate.h"

@interface SupportDetailsViewController ()
{
    
}

@end

@implementation SupportDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.rollerSupport = NO;
        self.rodEndPointsArray = [NSMutableArray new];
        
        //fetching Rod coordinates for tableView
        AppDelegate *appDelegate =
        [[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *dataContext = [appDelegate managedObjectContext];
        NSError *error;
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Rod"
                                                  inManagedObjectContext:dataContext];
        [fetchRequest setEntity:entity];
        NSArray *fetchedObjects = [dataContext executeFetchRequest:fetchRequest error:&error];
       
        BOOL isFirstRod = TRUE; //avoid duplication of points in tableView
        for (Rod *rod in fetchedObjects) {
            if (isFirstRod) {
                CGPoint pointA = CGPointMake([rod.aX floatValue], [rod.aY floatValue]);
                NSValue *aValue = [NSValue valueWithCGPoint:pointA];
                [self.rodEndPointsArray  addObject: aValue];
                isFirstRod = FALSE;
            }
            
            CGPoint pointB = CGPointMake([rod.bX floatValue], [rod.bY floatValue]);
            NSValue *bValue = [NSValue valueWithCGPoint:pointB];
            [self.rodEndPointsArray  addObject: bValue];
        }
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    
    CGPoint point = [(NSValue *)[self.rodEndPointsArray objectAtIndex:indexPath.row] CGPointValue];
    cell.textLabel.text = [NSString stringWithFormat: @"x: %0.1f y: %0.1f", point.x, point.y];
    return cell;
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
