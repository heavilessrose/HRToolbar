//
//  HRToolbar.h
//  HRToolbar
//
//  Created by 0xFF on 10/5/14.
//  Copyright (c) 2014 0xFF. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "HRLineView.h"

@class HRToolbar;

@protocol HRToolbarDelegate <NSObject>


-(NSInteger)numberOfGroup:(HRToolbar*)toolbar;
-(NSInteger)numberOfItemInGroup:(HRToolbar*)toolbar group:(NSInteger)groupIndex;
-(NSImage*)iconForItem:(HRToolbar*)toolbar group:(NSInteger)groupIndex item:(NSInteger)itemIndex;
-(BOOL)shouldEnableItem:(HRToolbar*)toolbar group:(NSInteger)groupIndex item:(NSInteger)itemIndex;
-(BOOL)shouldSeperatorAfterGroup:(HRToolbar*)toolbar group:(NSInteger)groupIndex;
-(void)toolbarItemSelected:(HRToolbar*)toolbar group:(NSInteger)groupIndex item:(NSInteger)itemIndex;
@end

@interface HRToolbar : NSView
@property (nonatomic,weak) IBOutlet id<HRToolbarDelegate> delegate;
@property (nonatomic,strong) NSColor * startColor;
@property (nonatomic,strong) NSColor * endColor;

-(void)reloadItems;
@end

@interface HRToolbarButton : NSButton
@property (nonatomic,assign) NSInteger groupIndex;
@property (nonatomic,assign) NSInteger itemIndex;
@end
