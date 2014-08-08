//
//  CIKMainWindowController.m
//  ComposeInKey
//
//  Created by Thomas Forzaglia on 8/4/14.
//  Copyright (c) 2014 Thomas Forzaglia. All rights reserved.
//

#import "CIKMainWindowController.h"

@interface CIKMainWindowController ()

/***** IBOutlets *****/

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

/***** Properties *****/

@property (nonatomic,strong) NSMutableArray *noteArray;
@property (nonatomic,strong) NSMutableArray *noteTextFieldArray;

/***** Private Methods *****/

- (IBAction)selectKey:(id)sender;
- (void)fillInNoteListForKey:(NSString *)key;

@end

@implementation CIKMainWindowController

- (id)init {
    self = [super initWithWindowNibName:@"CIKMainWindow"];
    self.noteArray = [[NSMutableArray alloc] init];
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    self.noteTextFieldArray = [[NSMutableArray alloc] initWithArray:@[self.note1, self.note2, self.note3, self.note4, self.note5, self.note6, self.note7]];
}

- (IBAction)selectKey:(id)sender {
    [self.keyName setStringValue:[sender title]];
    [self fillInNoteListForKey:[sender title]];
}

- (void)fillInNoteListForKey:(NSString *)key {
    if ([key isEqualToString:@"A"] || [key isEqualToString:@"F#m"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[ @"A", @"B", @"C#", @"D", @"E", @"F#", @"G#"]];
    } else if ([key isEqualToString:@"A#"] || [key isEqualToString:@"Gm"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[ @"A#", @"C", @"D", @"D#", @"F", @"G", @"A"]];
    } else if ([key isEqualToString:@"B"] || [key isEqualToString:@"G#m"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[ @"B", @"C#", @"D#", @"E", @"F#", @"G#", @"A#"]];
    } else if ([key isEqualToString:@"C"] || [key isEqualToString:@"Am"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[ @"C", @"D", @"E", @"F", @"G", @"A", @"B"]];
    } else if ([key isEqualToString:@"C#"] || [key isEqualToString:@"A#m"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[ @"C#", @"D#", @"F", @"F#", @"G#", @"A#", @"C"]];
    } else if ([key isEqualToString:@"D"] || [key isEqualToString:@"Bm"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[ @"D", @"E", @"F#", @"G", @"A", @"B", @"C#"]];
    } else if ([key isEqualToString:@"D#"] || [key isEqualToString:@"Cm"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[ @"D#", @"F", @"G", @"G#", @"A#", @"C", @"D"]];
    } else if ([key isEqualToString:@"E"] || [key isEqualToString:@"C#m"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[ @"E", @"F#", @"G#", @"A", @"B", @"C#", @"D#"]];
    } else if ([key isEqualToString:@"F"] || [key isEqualToString:@"Dm"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[ @"F", @"G", @"A", @"A#", @"C", @"D", @"E"]];
    } else if ([key isEqualToString:@"F#"] || [key isEqualToString:@"D#m"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[ @"F#", @"G#", @"A#", @"B", @"C#", @"D#", @"F"]];
    } else if ([key isEqualToString:@"G"] || [key isEqualToString:@"Em"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[ @"G", @"A", @"B", @"C", @"D", @"E", @"F#"]];
    } else if ([key isEqualToString:@"G#"] || [key isEqualToString:@"Fm"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[ @"G#", @"A#", @"C", @"C#", @"D#", @"F", @"G"]];
    }
    [self updateNoteTextViews];
}

- (void)updateNoteTextViews {
    for (int i = 0; i < [self.noteArray count]; i++) {
        [self.noteTextFieldArray[i] setStringValue:self.noteArray[i]];
    }
}

@end
