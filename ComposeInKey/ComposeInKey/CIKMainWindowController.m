//
//  CIKMainWindowController.m
//  ComposeInKey
//
//  Created by Thomas Forzaglia on 8/4/14.
//  Copyright (c) 2014 Thomas Forzaglia. All rights reserved.
//

#import "CIKMainWindowController.h"
#import "CIKTextField.h"

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

@property (nonatomic, weak) IBOutlet CIKTextField *chord1;
@property (nonatomic, weak) IBOutlet CIKTextField *chord2;
@property (nonatomic, weak) IBOutlet CIKTextField *chord3;
@property (nonatomic, weak) IBOutlet CIKTextField *chord4;
@property (nonatomic, weak) IBOutlet CIKTextField *chord5;
@property (nonatomic, weak) IBOutlet CIKTextField *chord6;

@property (nonatomic, weak) IBOutlet NSImageView *chordImage;

/***** Properties *****/

@property (nonatomic,strong) NSMutableArray *noteArray;
@property (nonatomic,strong) NSMutableArray *noteTextFieldArray;
@property (nonatomic,strong) NSMutableArray *chordArray;
@property (nonatomic,strong) NSMutableArray *chordTextFieldArray;

/***** Private Methods *****/

- (IBAction)selectKey:(id)sender;
- (void)fillInNoteAndChordListsForKey:(NSString *)key;
- (void)updateNoteTextViews;
- (void)updateChordTextViews;
- (void)addNotificationObserver;
- (void)displayChordPicture:(NSNotification *)notification;

@end

@implementation CIKMainWindowController

- (id)init {
    self = [super initWithWindowNibName:@"CIKMainWindow"];
    self.noteArray = [[NSMutableArray alloc] init];
    self.chordArray = [[NSMutableArray alloc] init];
    [self addNotificationObserver];
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    self.noteTextFieldArray = [[NSMutableArray alloc] initWithArray:@[self.note1, self.note2, self.note3, self.note4, self.note5, self.note6, self.note7]];
    self.chordTextFieldArray = [[NSMutableArray alloc] initWithArray:@[self.chord1, self.chord2, self.chord3, self.chord4, self.chord5, self.chord6]];
    [self.chordImage setImage:[NSImage imageNamed:@"note.jpeg"]];
}

- (IBAction)selectKey:(id)sender {
    [self.keyName setStringValue:[sender title]];
    [self fillInNoteAndChordListsForKey:[sender title]];
}

- (void)fillInNoteAndChordListsForKey:(NSString *)key {
    if ([key isEqualToString:@"A"] || [key isEqualToString:@"F#m"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[@"A", @"B", @"C#", @"D", @"E", @"F#", @"G#"]];
        [self.chordArray replaceObjectsInRange:NSMakeRange(0, [self.chordArray count]) withObjectsFromArray:@[@"A", @"Bm", @"C#m", @"D", @"E", @"F#m"]];
    } else if ([key isEqualToString:@"A#"] || [key isEqualToString:@"Gm"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[@"A#", @"C", @"D", @"D#", @"F", @"G", @"A"]];
        [self.chordArray replaceObjectsInRange:NSMakeRange(0, [self.chordArray count]) withObjectsFromArray:@[@"A#", @"Cm", @"Dm", @"D#", @"F", @"Gm"]];
    } else if ([key isEqualToString:@"B"] || [key isEqualToString:@"G#m"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[@"B", @"C#", @"D#", @"E", @"F#", @"G#", @"A#"]];
        [self.chordArray replaceObjectsInRange:NSMakeRange(0, [self.chordArray count]) withObjectsFromArray:@[@"B", @"C#m", @"D#m", @"E", @"F#", @"G#m"]];
    } else if ([key isEqualToString:@"C"] || [key isEqualToString:@"Am"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[@"C", @"D", @"E", @"F", @"G", @"A", @"B"]];
        [self.chordArray replaceObjectsInRange:NSMakeRange(0, [self.chordArray count]) withObjectsFromArray:@[@"C", @"Dm", @"Em", @"F", @"G", @"Am"]];
    } else if ([key isEqualToString:@"C#"] || [key isEqualToString:@"A#m"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[@"C#", @"D#", @"F", @"F#", @"G#", @"A#", @"C"]];
        [self.chordArray replaceObjectsInRange:NSMakeRange(0, [self.chordArray count]) withObjectsFromArray:@[@"C#", @"D#m", @"E#m", @"F#", @"G#", @"A#m"]];
    } else if ([key isEqualToString:@"D"] || [key isEqualToString:@"Bm"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[@"D", @"E", @"F#", @"G", @"A", @"B", @"C#"]];
        [self.chordArray replaceObjectsInRange:NSMakeRange(0, [self.chordArray count]) withObjectsFromArray:@[@"D", @"Em", @"F#m", @"G", @"A", @"Bm"]];
    } else if ([key isEqualToString:@"D#"] || [key isEqualToString:@"Cm"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[@"D#", @"F", @"G", @"G#", @"A#", @"C", @"D"]];
        [self.chordArray replaceObjectsInRange:NSMakeRange(0, [self.chordArray count]) withObjectsFromArray:@[@"D#", @"Fm", @"Gm", @"G#", @"A#", @"Cm"]];
    } else if ([key isEqualToString:@"E"] || [key isEqualToString:@"C#m"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[@"E", @"F#", @"G#", @"A", @"B", @"C#", @"D#"]];
        [self.chordArray replaceObjectsInRange:NSMakeRange(0, [self.chordArray count]) withObjectsFromArray:@[@"E", @"F#m", @"G#m", @"A", @"B", @"C#m"]];
    } else if ([key isEqualToString:@"F"] || [key isEqualToString:@"Dm"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[@"F", @"G", @"A", @"A#", @"C", @"D", @"E"]];
        [self.chordArray replaceObjectsInRange:NSMakeRange(0, [self.chordArray count]) withObjectsFromArray:@[@"F", @"Gm", @"Am", @"A#", @"C", @"Dm"]];
    } else if ([key isEqualToString:@"F#"] || [key isEqualToString:@"D#m"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[@"F#", @"G#", @"A#", @"B", @"C#", @"D#", @"F"]];
        [self.chordArray replaceObjectsInRange:NSMakeRange(0, [self.chordArray count]) withObjectsFromArray:@[@"F#", @"G#m", @"A#m", @"B", @"C#", @"D#m"]];
    } else if ([key isEqualToString:@"G"] || [key isEqualToString:@"Em"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[@"G", @"A", @"B", @"C", @"D", @"E", @"F#"]];
        [self.chordArray replaceObjectsInRange:NSMakeRange(0, [self.chordArray count]) withObjectsFromArray:@[@"G", @"Am", @"Bm", @"C", @"D", @"Em"]];
    } else if ([key isEqualToString:@"G#"] || [key isEqualToString:@"Fm"]) {
        [self.noteArray replaceObjectsInRange:NSMakeRange(0, [self.noteArray count]) withObjectsFromArray:@[@"G#", @"A#", @"C", @"C#", @"D#", @"F", @"G"]];
        [self.chordArray replaceObjectsInRange:NSMakeRange(0, [self.chordArray count]) withObjectsFromArray:@[@"G#", @"A#m", @"Cm", @"C#", @"D#", @"Fm"]];
    }
    [self updateNoteTextViews];
    [self updateChordTextViews];
}

- (void)updateNoteTextViews {
    for (int i = 0; i < [self.noteArray count]; i++) {
        [self.noteTextFieldArray[i] setStringValue:self.noteArray[i]];
    }
}

- (void)updateChordTextViews {
    for (int i = 0; i < [self.chordArray count]; i++) {
        [self.chordTextFieldArray[i] setStringValue:self.chordArray[i]];
    }
}

- (void)addNotificationObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(displayChordPicture:)
                                                 name:@"DisplayNewChordPic" object:nil];
}

- (void)displayChordPicture:(NSNotification *)notification {
    [self.chordImage setImage:[NSImage imageNamed:[notification object]]];
}

@end
