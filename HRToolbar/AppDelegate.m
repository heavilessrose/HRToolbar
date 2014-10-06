//
//  AppDelegate.m
//  HRToolbar
//
//  Created by 0xFF on 10/5/14.
//  Copyright (c) 2014 0xFF. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    //[self.topToolbar setStartColor:[NSColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0]];
}

-(NSInteger)numberOfGroup:(HRToolbar *)toolbar
{
    return 2;
}
-(NSInteger)numberOfItemInGroup:(HRToolbar *)toolbar group:(NSInteger)groupIndex
{
    if(groupIndex == 0)
        return 2;
    return 3;
}
-(NSImage *)iconForItem:(HRToolbar *)toolbar group:(NSInteger)groupIndex item:(NSInteger)itemIndex
{
    switch (itemIndex)
    {
        case 0:
            if(groupIndex==0)
                return [NSImage imageNamed:@"new"];
            return [NSImage imageNamed:@"createTable"];
            break;
        case 1:
                return [NSImage imageNamed:@"open"];
            break;
        case 2:
                return [NSImage imageNamed:@"save"];
            break;
        default:
            break;
    }
    return nil;
}
-(BOOL)shouldSeperatorAfterGroup:(HRToolbar *)toolbar group:(NSInteger)groupIndex
{
    return YES;
}
-(BOOL)shouldEnableItem:(HRToolbar *)toolbar group:(NSInteger)groupIndex item:(NSInteger)itemIndex
{
    return YES;
}
-(void)toolbarItemSelected:(HRToolbar *)toolbar group:(NSInteger)groupIndex item:(NSInteger)itemIndex
{
    NSLog(@"Group %ld - Item %ld",groupIndex,itemIndex);
}

@end
