//
//  CIKMainWindowController.m
//  ComposeInKey
//
//  Created by Thomas Forzaglia on 8/4/14.
//  Copyright (c) 2014 Thomas Forzaglia. All rights reserved.
//

#import "CIKAppViewController.h"
#import "CIKMainWindowController.h"
#import "CIKWelcomeViewController.h"

@interface CIKMainWindowController ()

/***** IBOutlets *****/

@property (nonatomic, weak) IBOutlet NSView *mainView;
@property (nonatomic, weak) IBOutlet CIKAppViewController *appViewController;

@end

@implementation CIKMainWindowController

- (id)init {
    self = [super initWithWindowNibName:@"CIKMainWindow"];
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    CIKWelcomeViewController *welcomeViewController = [[CIKWelcomeViewController alloc] init];
    [self.mainView addSubview:welcomeViewController.view];
}

- (IBAction)selectKey:(id)sender {
    [self.mainView.subviews[0] removeFromSuperview];
    [self.mainView addSubview:self.appViewController.view];
    [self.appViewController.keyName setStringValue:[sender title]];
    [self.appViewController.chordImage setImage:[NSApp applicationIconImage]];
    [self.appViewController fillInNoteAndChordListsForKey:[sender title]];
}

@end
