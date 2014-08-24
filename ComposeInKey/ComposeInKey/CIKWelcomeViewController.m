//
//  CIKWelcomeViewController.m
//  ComposeInKey
//
//  Created by Thomas Forzaglia on 8/22/14.
//  Copyright (c) 2014 Thomas Forzaglia. All rights reserved.
//

#import "CIKWelcomeViewController.h"

#import "NSAttributedString+Hyperlink.h"

@interface CIKWelcomeViewController ()

@property IBOutlet NSTextField *creditTextField;

@end

@implementation CIKWelcomeViewController

- (id)init {
    return [super initWithNibName:@"CIKWelcomeView" bundle:[NSBundle bundleForClass:[self class]]];
}

- (void)awakeFromNib {
    [self setHyperlinkWithTextField:self.creditTextField];
}

-(void)setHyperlinkWithTextField:(NSTextField*)textField {
    [textField setAllowsEditingTextAttributes: YES];
    [textField setSelectable: YES];
    
    NSURL* url = [NSURL URLWithString:@"http://www.jguitar.com"];
    NSMutableAttributedString* string = [[NSMutableAttributedString alloc] init];
    [string appendAttributedString: [NSAttributedString hyperlinkFromString:@"jguitar.com" withURL:url]];
    
    [textField setAttributedStringValue: string];
}

@end
