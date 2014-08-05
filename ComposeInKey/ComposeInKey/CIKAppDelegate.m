//
//  CIKAppDelegate.m
//  ComposeInKey
//
//  Created by Thomas Forzaglia on 8/4/14.
//  Copyright (c) 2014 Thomas Forzaglia. All rights reserved.
//

#import "CIKAppDelegate.h"
#import "CIKMainWindowController.h"

@interface CIKAppDelegate ()

@property (nonatomic, strong) CIKMainWindowController *mainWindow;

@end

@implementation CIKAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.mainWindow = [[CIKMainWindowController alloc] init];
    self.window = self.mainWindow.window;
}

@end
