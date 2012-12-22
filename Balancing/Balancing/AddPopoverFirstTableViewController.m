//
//  AddPopoverFirstTableViewController.m
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 16.12.2012.
//  Copyright (c) 2012 AGDev. All rights reserved.
//

#import "AddPopoverFirstTableViewController.h"
#import "AddPopoverSecondTableViewController.h"
#import "RodDetailsViewController.h"
#import "SupportDetailsViewController.h"

@interface AddPopoverFirstTableViewController ()

@end

@implementation AddPopoverFirstTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.tableTitlesArray = [NSArray arrayWithObjects:@"Add rod", @"Add support", @"Set element properties",
                                 nil];
        self.title = @"Schematic Drawing";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableTitlesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if (indexPath.row == 0 || indexPath.row == 1)
        cell.accessoryType = UITableViewCellAccessoryNone;
    else
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.text = [self.tableTitlesArray objectAtIndex:indexPath.row];
    
    return cell;

}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddPopoverSecondTableViewController *addPopoverSTVC = [AddPopoverSecondTableViewController new];
    addPopoverSTVC.contentSizeForViewInPopover = CGSizeMake(320, 132);
    RodDetailsViewController *rdVC = [RodDetailsViewController new];
    rdVC.modalPresentationStyle = UIModalPresentationFormSheet;
    SupportDetailsViewController *sdVC = [SupportDetailsViewController new];
    sdVC.modalPresentationStyle = UIModalPresentationFormSheet;
    
    switch (indexPath.row) {
        case 0:
            [self presentViewController:rdVC animated:YES completion:nil];
            [self.addPopoverController dismissPopoverAnimated:YES];
            break;
        case 1:
            [self presentViewController:sdVC animated:YES completion:nil];
            [self.addPopoverController dismissPopoverAnimated:YES];
//            addPopoverSTVC.tableTitlesArray = [NSArray arrayWithObjects:@"Przegubowa przesówna", @"Przegubowa nieprzesówna", @"Płaska przesówna", @"Płaska nieprzesówna", nil];
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:addPopoverSTVC animated:YES];
}

@end
