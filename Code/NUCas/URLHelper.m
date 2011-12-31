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

+ (NSString*) url:(NSString*)url appendPathComponent:(NSString*)pathComponent withParams:(NSDictionary*)params {
    NSString* uri = [self url:url appendPathComponent:pathComponent];

    NSMutableString* query = [NSMutableString new];
    for (NSString* key in params) {
        NSString* k = [self encodeString:key];
        NSString* v = [self encodeString:[params objectForKey:key]];
        if ([query length] > 0) {
            [query appendString:@"&"];
        }
        [query appendFormat:@"%@=%@", k, v];
    }
    
    return [query length] > 0 ? [NSString stringWithFormat:@"%@?%@", uri, query] : uri;
}

// Escape reserved characters in rfc3986
+ (NSString*) encodeString:(NSString*)raw {
    return (__bridge NSString*)
        CFURLCreateStringByAddingPercentEscapes(NULL, (__bridge CFStringRef)raw, NULL, (__bridge CFStringRef)@":/?#[]@!$&'()*+,;=", kCFStringEncodingUTF8);
}
@end
