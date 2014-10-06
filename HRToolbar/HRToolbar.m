//
//  HRToolbar.m
//  HRToolbar
//
//  Created by 0xFF on 10/5/14.
//  Copyright (c) 2014 0xFF. All rights reserved.
//

#import "HRToolbar.h"

@interface HRToolbar ()
{
    NSMutableArray * _matrices;
}
@end

@implementation HRToolbar
@synthesize startColor = _startColor;
@synthesize endColor = _endColor;
@synthesize delegate = _delegate;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.startColor = [NSColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
        self.endColor = nil;
    }
    return self;
}
-(void)setDelegate:(id<HRToolbarDelegate>)delegate
{
    if(self.delegate != delegate)
    {
        _delegate = delegate;
        [self reloadItems];
    }
}
-(void)setStartColor:(NSColor *)startColor
{
    _startColor = startColor;
    [self setNeedsDisplay:YES];
}
-(void)reloadItems
{
    if(_matrices)
    {
        [_matrices makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [_matrices removeAllObjects];
    }
    _matrices = [[NSMutableArray alloc] init];
    NSInteger groups = [self.delegate numberOfGroup:self];
    
    CGFloat w = 28, h = 25;
    CGFloat x = 10, y = 5;
    CGFloat span = 10;
    
    
    
    for(NSInteger i = 0 ;i  < groups ; ++i)
    {
        NSInteger items = [self.delegate numberOfItemInGroup:self group:i];
        for(NSInteger j = 0; j < items; ++ j)
        {
            NSRect frame = NSMakeRect(x, y, w, h);
            HRToolbarButton * button = [[HRToolbarButton alloc] initWithFrame:frame];
            [button setGroupIndex:i];
            [button setItemIndex:j];
            NSImage * icon = [self.delegate iconForItem:self group:i item:j];
            [button setImage:icon];
            [button setButtonType:NSMomentaryChangeButton];
            [button setBezelStyle:NSTexturedRoundedBezelStyle];
            [button setImagePosition:NSImageOnly];
            [button setBordered:NO];
            [button setTarget:self];
            [button setAction:@selector(buttonClicked:)];
            [self addSubview:button];
            
            [_matrices addObject:button];
            
            x+= w + span;
            
            if(j == items-1 && i != groups-1) // last
            {
                BOOL seperate = [self.delegate shouldSeperatorAfterGroup:self group:i];
                if(seperate)
                {
                    
                    HRLineView * line = [[HRLineView alloc] initWithFrame:NSMakeRect(x, 0, 3, self.bounds.size.height)];
                    [self addSubview:line];
                    [_matrices addObject:line];
                    x+= span;
                    
                }
                
            }
        }
    }
}
-(void)buttonClicked:(HRToolbarButton*)sender
{
    [self.delegate toolbarItemSelected:self group:sender.groupIndex item:sender.itemIndex];
}
- (void)drawRect:(NSRect)dirtyRect
{
    
    if(self.startColor && self.endColor)
    {
        NSGradient* aGradient = [[NSGradient alloc]
                                 initWithStartingColor:self.startColor
                                 endingColor:self.endColor];
        NSBezierPath *bezierPath = [NSBezierPath bezierPathWithRoundedRect: self.bounds xRadius:0.0 yRadius:0.0];
        [aGradient drawInBezierPath:bezierPath angle:270];
    }
    else
    {
        if(self.startColor)
        {
            [self.startColor setFill];
            NSRectFill(dirtyRect);
        }
        [super drawRect:dirtyRect];
    }
}

@end
@implementation HRToolbarButton
@synthesize groupIndex = _groupIndex;
@synthesize itemIndex = _itemIndex;
@end
