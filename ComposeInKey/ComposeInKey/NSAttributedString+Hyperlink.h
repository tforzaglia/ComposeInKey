//
//  NSAttributedString+Hyperlink.h
//  ComposeInKey
//
//  Created by Thomas Forzaglia on 8/23/14.
//  Copyright (c) 2014 Thomas Forzaglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (Hyperlink)

+ (id)hyperlinkFromString:(NSString*)inString withURL:(NSURL*)url;

@end
