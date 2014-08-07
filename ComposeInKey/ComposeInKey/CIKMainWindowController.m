//
//  CIKMainWindowController.m
//  ComposeInKey
//
//  Created by Thomas Forzaglia on 8/4/14.
//  Copyright (c) 2014 Thomas Forzaglia. All rights reserved.
//

#import "CIKMainWindowController.h"

@interface CIKMainWindowController ()

@property (nonatomic, weak) IBOutlet NSTextField *keyName;

@property (nonatomic, weak) IBOutlet NSTextField *note1;
@property (nonatomic, weak) IBOutlet NSTextField *note2;
@property (nonatomic, weak) IBOutlet NSTextField *note3;
@property (nonatomic, weak) IBOutlet NSTextField *note4;
@property (nonatomic, weak) IBOutlet NSTextField *note5;
@property (nonatomic, weak) IBOutlet NSTextField *note6;
@property (nonatomic, weak) IBOutlet NSTextField *note7;

@property (nonatomic, weak) IBOutlet NSTextField *chord1;
@property (nonatomic, weak) IBOutlet NSTextField *chord2;
@property (nonatomic, weak) IBOutlet NSTextField *chord3;
@property (nonatomic, weak) IBOutlet NSTextField *chord4;
@property (nonatomic, weak) IBOutlet NSTextField *chord5;
@property (nonatomic, weak) IBOutlet NSTextField *chord6;

@property (nonatomic, weak) IBOutlet NSImageView *chordImage;

@property (nonatomic,strong) IBOutlet NSMutableArray *notes;

- (IBAction)selectKey:(id)sender;

@end

@implementation CIKMainWindowController

- (id)init {
    self = [super initWithWindowNibName:@"CIKMainWindow"];
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
}

- (IBAction)selectKey:(id)sender {
    [self.keyName setStringValue:[sender title]];
}

- (void)fillInNoteListForKey:(NSString *)key {

}

@end
