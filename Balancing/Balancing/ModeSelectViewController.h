//
//  ModeSelectViewController.h
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 20.01.2013.
//  Copyright (c) 2013 AGDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface ModeSelectViewController : UIViewController
{
    UIButton *newMechanismButton;
    UIButton *loadMechanismButton;
    ViewController *superViewController;
}

@property (nonatomic, strong) IBOutlet UIButton *newMechanismButton;
@property (nonatomic, strong) IBOutlet UIButton *loadMechanismButton;
@property (nonatomic, strong) ViewController *superViewController;

- (IBAction)newMechanism:(id)sender;
- (IBAction)loadMechanism:(id)sender;

@end
