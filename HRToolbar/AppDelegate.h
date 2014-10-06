//
//  AppDelegate.h
//  HRToolbar
//
//  Created by 0xFF on 10/5/14.
//  Copyright (c) 2014 0xFF. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "HRToolbar.h"

@interface AppDelegate : NSObject <NSApplicationDelegate,HRToolbarDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet HRToolbar * topToolbar;
@end
