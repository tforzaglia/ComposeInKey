//
//  CIKAppViewController.h
//  ComposeInKey
//
//  Created by Thomas Forzaglia on 8/22/14.
//  Copyright (c) 2014 Thomas Forzaglia. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CIKAppViewController : NSViewController

@property (nonatomic, weak) IBOutlet NSTextField *keyName;
@property (nonatomic, weak) IBOutlet NSImageView *chordImage;

- (void)fillInNoteAndChordListsForKey:(NSString *)key;

@end
