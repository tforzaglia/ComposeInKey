//
//  NSAttributedString+Hyperlink.m
//  ComposeInKey
//
//  Created by Thomas Forzaglia on 8/23/14.
//  Copyright (c) 2014 Thomas Forzaglia. All rights reserved.
//

#import "NSAttributedString+Hyperlink.h"

@implementation NSAttributedString (Hyperlink)

+ (id)hyperlinkFromString:(NSString*)inString withURL:(NSURL*)url {
    NSMutableAttributedString* attrString = [[NSMutableAttributedString alloc] initWithString: inString];
    NSRange range = NSMakeRange(0, [attrString length]);
    
    [attrString beginEditing];
    [attrString addAttribute:NSLinkAttributeName value:[url absoluteString] range:range];
    [attrString addAttribute:NSForegroundColorAttributeName value:[NSColor blueColor] range:range];
    [attrString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:NSSingleUnderlineStyle] range:range];
    [attrString endEditing];
    
    return attrString;
}

@end
