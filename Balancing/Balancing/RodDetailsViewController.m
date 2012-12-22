//
//  RodDetailsViewController.m
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 22.12.2012.
//  Copyright (c) 2012 AGDev. All rights reserved.
//

#import "RodDetailsViewController.h"

@interface RodDetailsViewController ()

@end

@implementation RodDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Rod properties";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)switchSwitched:(id)sender
{
    if (self.massShiftSwitch.on)
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.massShiftLabel.alpha = 1;
            self.massShiftTextField.alpha = 1;
        } completion:nil];
        self.massShiftTextField.enabled = YES;
    }
    else
    {
        self.massShiftTextField.enabled = NO;
        [UIView animateWithDuration:0.5 animations:^{
            self.massShiftLabel.alpha = 0.2;
            self.massShiftTextField.alpha = 0.2;
        } completion:nil];
    }
}

- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
