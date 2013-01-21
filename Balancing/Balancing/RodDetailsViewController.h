//
//  RodDetailsViewController.h
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 22.12.2012.
//  Copyright (c) 2012 AGDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mechanism.h"

@interface RodDetailsViewController : UIViewController
{
    UISwitch *massShiftSwitch;
    UITextField *massShiftTextField;
    UILabel *massShiftLabel;
    UITextField *aXTextField;
    UITextField *aYTextField;
    UITextField *bXTextField;
    UITextField *bYTextField;
    UITextField *massTextField;
    
    UIView *quartzView;
    Mechanism *currentMechanism;
}

@property (nonatomic, retain) IBOutlet UISwitch *massShiftSwitch;
@property (nonatomic, retain) IBOutlet UITextField *massShiftTextField;
@property (nonatomic, retain) IBOutlet UILabel *massShiftLabel;
@property (nonatomic, retain) IBOutlet UITextField *aXTextField;
@property (nonatomic, retain) IBOutlet UITextField *aYTextField;
@property (nonatomic, retain) IBOutlet UITextField *bXTextField;
@property (nonatomic, retain) IBOutlet UITextField *bYTextField;
@property (nonatomic, retain) IBOutlet UITextField *massTextField;
@property (nonatomic, retain) UIView *quartzView;
@property (nonatomic, retain) Mechanism *currentMechanism;


- (IBAction)done:(id)sender;
- (IBAction)switchSwitched:(id)sender;
- (IBAction)cancel:(id)sender;

@end
