//
//  SupportDetailsViewController.m
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 22.12.2012.
//  Copyright (c) 2012 AGDev. All rights reserved.
//

#import "SupportDetailsViewController.h"

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
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    return cell;
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
