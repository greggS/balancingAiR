//
//  ModeSelectViewController.m
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 20.01.2013.
//  Copyright (c) 2013 AGDev. All rights reserved.
//

#import "ModeSelectViewController.h"

@interface ModeSelectViewController ()

@end

@implementation ModeSelectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)newMechanism:(id)sender
{
    [self.superViewController createNewMechanism];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)loadMechanism:(id)sender
{
    [self.superViewController presentMechanisms];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
