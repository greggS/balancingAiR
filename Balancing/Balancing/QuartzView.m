//
//  QuartzView.m
//  Balancing
//
//  Created by Grzegorz Krukiewicz-Gacek on 15.12.2012.
//  Copyright (c) 2012 AGDev. All rights reserved.
//

#import "QuartzView.h"

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
    CGContextSetLineWidth(context, 2.0);
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
}

@end
