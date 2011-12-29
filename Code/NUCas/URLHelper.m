//
//  URLHelper.m
//  NUCas
//
//  Created by John Dzak on 12/29/11.
//  Copyright (c) 2011 Northwestern University. All rights reserved.
//

#import "URLHelper.h"

@implementation URLHelper
+ (NSString*) url:(NSString*)url appendPathComponent:(NSString*)pathComponent {
    NSURL* base = [[NSURL alloc] initWithString:url];
    return [[base URLByAppendingPathComponent:pathComponent] absoluteString];
}
@end
