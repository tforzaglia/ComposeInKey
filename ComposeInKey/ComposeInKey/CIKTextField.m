//
//  CIKTextField.m
//  ComposeInKey
//
//  Created by Thomas Forzaglia on 8/9/14.
//  Copyright (c) 2014 Thomas Forzaglia. All rights reserved.
//

#import "CIKMainWindowController.h"
#import "CIKTextField.h"

@interface CIKTextField ()

@property (nonatomic, strong) NSTrackingArea *trackingArea;

- (void)createTrackingArea;

@end

@implementation CIKTextField

- (void)awakeFromNib {
    [self createTrackingArea];
}

- (void)createTrackingArea {
    self.trackingArea = [ [NSTrackingArea alloc] initWithRect:[self bounds]
                                                      options:(NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways)
                                                        owner:self
                                                     userInfo:nil];
    [self addTrackingArea:self.trackingArea];
    
    NSPoint mouseLocation = [[self window] mouseLocationOutsideOfEventStream];
    mouseLocation = [self convertPoint: mouseLocation fromView: nil];
    
    if (NSPointInRect(mouseLocation, [self bounds])) {
        [self mouseEntered: nil];
    }
    else {
        [self mouseExited: nil];
    }
}

- (void)mouseEntered:(NSEvent *)theEvent {
    NSString *chordImageToLoad = [NSString stringWithFormat:@"%@.gif", [self stringValue]];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"DisplayNewChordPic" object:chordImageToLoad];
}

@end
