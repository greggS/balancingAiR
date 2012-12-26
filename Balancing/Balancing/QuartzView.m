//
//  QuartzView.m
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 15.12.2012.
//  Copyright (c) 2012 AGDev. All rights reserved.
//

#import "QuartzView.h"
#import "Rod.h"
#import "AppDelegate.h"

@implementation QuartzView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //drawing x and y axis
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    //y
    CGContextMoveToPoint(context, self.frame.size.width/2, self.frame.size.height/2);
    CGContextAddLineToPoint(context, self.frame.size.width/2, self.frame.size.height/2 -50);
    CGContextAddLineToPoint(context, self.frame.size.width/2 -5, self.frame.size.height/2 -45);
    CGContextAddLineToPoint(context, self.frame.size.width/2 +5, self.frame.size.height/2 -45);
    CGContextAddLineToPoint(context, self.frame.size.width/2, self.frame.size.height/2 -50);
    CGContextStrokePath(context);
    
    //x
    CGContextMoveToPoint(context, self.frame.size.width/2, self.frame.size.height/2);
    CGContextAddLineToPoint(context, self.frame.size.width/2 +50, self.frame.size.height/2);
    CGContextAddLineToPoint(context, self.frame.size.width/2 +45, self.frame.size.height/2 -5);
    CGContextAddLineToPoint(context, self.frame.size.width/2 +45, self.frame.size.height/2 +5);
    CGContextAddLineToPoint(context, self.frame.size.width/2 +50, self.frame.size.height/2);
    CGContextStrokePath(context);
    
    
    //test of drawing rods
    AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *dataContext = [appDelegate managedObjectContext];
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Rod"
                                              inManagedObjectContext:dataContext];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [dataContext executeFetchRequest:fetchRequest error:&error];
    
    CGContextSetLineWidth(context, 4.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    for (Rod *rod in fetchedObjects) {
        NSLog (@"Drawing rod with parameters:");
        NSLog (@"aX: %@", rod.aX);
        NSLog (@"aY: %@", rod.aY);
        NSLog (@"bX: %@", rod.bX);
        NSLog (@"bY: %@", rod.bY);
        NSLog (@"Mass: %@", rod.mass);
        CGPoint Apoint = CGPointMake([rod.aX floatValue] + self.frame.size.width/2, 
                                     -[rod.aY floatValue] + self.frame.size.height/2);   // - is necessary because of Quartz inverted y axis
        CGPoint Bpoint = CGPointMake([rod.bX floatValue] + self.frame.size.width/2,
                                     -[rod.bY floatValue] + self.frame.size.height/2);
        
        CGContextMoveToPoint(context, Apoint.x, Apoint.y);
        CGContextAddLineToPoint(context, Bpoint.x, Bpoint.y);
        CGContextStrokePath(context);
    }

    
    
    
}

@end
