//
//  RodDetailsViewController.m
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 22.12.2012.
//  Copyright (c) 2012 AGDev. All rights reserved.
//

#import "RodDetailsViewController.h"
#import "Rod.h"
#import "EndPoint.h"
#import "ViewController.h"
#import "AppDelegate.h"

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

- (IBAction)done:(id)sender
{
    NSString *massString = self.massTextField.text;
    float mass = 0;
    //mass will remain 0 if text field is empty
    if (![massString isEqualToString:@""])
    {
        mass = [massString floatValue];
    }
    
    //check if mass is not 0 or less
    if (mass > 0)                           
    {
        float aX;
        float aY;
        float bX;
        float bY;
        
        if (![self.aXTextField.text isEqualToString: @""])
        {
            NSString *aXString = self.aXTextField.text;
            aX = [aXString floatValue];
        }
        if (![self.aYTextField.text isEqualToString: @""])
        {
            NSString *aYString = self.aYTextField.text;
            aY = [aYString floatValue];
        }
        if (![self.bXTextField.text isEqualToString: @""])
        {
            NSString *bXString = self.bXTextField.text;
            bX = [bXString floatValue];
        }
        if (![self.bYTextField.text isEqualToString: @""])
        {
            NSString *bYString = self.bYTextField.text;
            bY = [bYString floatValue];
        }
        
        //saving the rod with CoreData
        AppDelegate *appDelegate =
        [[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *context = [appDelegate managedObjectContext];
        Rod *newRod = [NSEntityDescription
                                          insertNewObjectForEntityForName:@"Rod"
                                          inManagedObjectContext:context];
        EndPoint *aPoint = [NSEntityDescription
                                          insertNewObjectForEntityForName:@"EndPoint"
                                          inManagedObjectContext:context];
        aPoint.x = [NSNumber numberWithFloat:aX];
        aPoint.y = [NSNumber numberWithFloat:aY];
        aPoint.rod = newRod;
        EndPoint *bPoint = [NSEntityDescription
                            insertNewObjectForEntityForName:@"EndPoint"
                            inManagedObjectContext:context];
        bPoint.x = [NSNumber numberWithFloat:bX];
        bPoint.y = [NSNumber numberWithFloat:bY];
        bPoint.rod = newRod;
        
        newRod.aPoint = aPoint;
        newRod.bPoint = bPoint;
        newRod.mass = [NSNumber numberWithFloat:mass];
        newRod.mechanism = self.currentMechanism;
        
        [self.currentMechanism addRodsObject:newRod];
        int numberOfRods = [self.currentMechanism.numberOfRods intValue];
        numberOfRods ++;
        self.currentMechanism.numberOfRods = [NSNumber numberWithInt:numberOfRods];
        
        NSError *error;
        if (![context save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
        
//        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Rod"
//                                                  inManagedObjectContext:context];
//        [fetchRequest setEntity:entity];
//        NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
//        for (Rod *rod in fetchedObjects) {
//            NSLog (@"Created new rod with parameters:");
//            NSLog (@"aX: %@", rod.aX);
//            NSLog (@"aY: %@", rod.aY);
//            NSLog (@"bX: %@", rod.bX);
//            NSLog (@"bY: %@", rod.bY);
//            NSLog (@"Mass: %@", rod.mass);
//        }
        
        [self.quartzView setNeedsDisplay];
        [self dismissViewControllerAnimated:YES completion:nil];        
    }
    else
    {
        UIAlertView *noMassAlert = [[UIAlertView alloc] initWithTitle:@"Specify the mass!"
                                                              message:@"Mass must be specified and greater than 0 to continue"
                                                             delegate:self
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil, nil];
        [noMassAlert show];
    }
}

- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
