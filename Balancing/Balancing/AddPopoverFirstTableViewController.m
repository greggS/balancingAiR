//
//  AddPopoverFirstTableViewController.m
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 16.12.2012.
//  Copyright (c) 2012 AGDev. All rights reserved.
//

#import "AddPopoverFirstTableViewController.h"
#import "AddPopoverSecondTableViewController.h"

@interface AddPopoverFirstTableViewController ()

@end

@implementation AddPopoverFirstTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.tableTitlesArray = [NSArray arrayWithObjects:@"Dodaj pręt", @"Dodaj podporę", @"Ustaw właściwości elementu",
                                 nil];
        self.title = @"Tworzenie schematu";
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
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = [self.tableTitlesArray objectAtIndex:indexPath.row];
    
    return cell;

}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddPopoverSecondTableViewController *addPopoverSTVC = [AddPopoverSecondTableViewController new];
    addPopoverSTVC.contentSizeForViewInPopover = CGSizeMake(320, 132);
    
    switch (indexPath.row) {
        case 0:
            addPopoverSTVC.tableTitlesArray = [NSArray arrayWithObjects:@"Wprowadzanie współrzędnych", @"Zaznaczanie punktów", nil];
            break;
        case 1:
            addPopoverSTVC.tableTitlesArray = [NSArray arrayWithObjects:@"Przegubowa przesówna", @"Przegubowa nieprzesówna", @"Płaska przesówna", @"Płaska nieprzesówna", nil];
            addPopoverSTVC.contentSizeForViewInPopover = CGSizeMake(320, 176);
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:addPopoverSTVC animated:YES];
}

@end
