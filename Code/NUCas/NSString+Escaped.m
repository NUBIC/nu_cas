//
//  NSString+Escaped.m
//  NUCas
//
//  Created by Jacob Van Order on 1/24/13.
//  Copyright (c) 2013 Northwestern University. All rights reserved.
//

#import "NSString+Escaped.h"

@implementation NSString (Escaped)

- (NSString*)stringByAddingPercentEscapes {
    NSString *escapedString = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)self, NULL,CFSTR(":/?#[]@!$&'()*+,;="),kCFStringEncodingUTF8));
    return escapedString;
}

@end
