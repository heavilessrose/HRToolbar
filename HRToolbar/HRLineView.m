//
//  HRLineView.m
//  HRToolbar
//
//  Created by 0xFF on 10/6/14.
//  Copyright (c) 2014 0xFF. All rights reserved.
//

#import "HRLineView.h"

@implementation HRLineView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    NSRect bounds = [self bounds];
    NSSize size = bounds.size;
    CGFloat lineMargin = 5.0;
    NSColor *lineColor = [NSColor textBackgroundColor];
    // Draw the path in white
    NSBezierPath* path = [NSBezierPath bezierPath];
    [path setLineWidth:0.5];
    NSPoint p1,p2;

    p1 = NSMakePoint(size.width/2, size.height-lineMargin);
    p2 = NSMakePoint(size.width/2, lineMargin);

    [path moveToPoint:p1];
    [path lineToPoint:p2];
    
    [path closePath];
    
    [lineColor set];
    [path stroke];
}

@end
