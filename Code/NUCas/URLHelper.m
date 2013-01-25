//
//  URLHelper.m
//  NUCas
//
//  Created by John Dzak on 12/29/11.
//  Copyright (c) 2011 Northwestern University. All rights reserved.
//

#import "URLHelper.h"

#import "NSString+Escaped.h"

@implementation URLHelper
+ (NSString*) url:(NSString*)url appendPathComponent:(NSString*)pathComponent {
    NSURL* base = [[NSURL alloc] initWithString:url];
    return [[base URLByAppendingPathComponent:pathComponent] absoluteString];
}

+ (NSString*) url:(NSString*)url appendPathComponent:(NSString*)pathComponent withParams:(NSDictionary*)params {
    NSString* uri = [self url:url appendPathComponent:pathComponent];

    NSMutableString* query = [NSMutableString new];
    for (NSString* key in params) {
        NSString* k = [key stringByAddingPercentEscapes];
        NSString* v = [[params objectForKey:key] stringByAddingPercentEscapes];
        if ([query length] > 0) {
            [query appendString:@"&"];
        }
        [query appendFormat:@"%@=%@", k, v];
    }
    
    return [query length] > 0 ? [NSString stringWithFormat:@"%@?%@", uri, query] : uri;
}

+ (NSString*) stripQueryFromURL:(NSString*)url {
    return [[url componentsSeparatedByString:@"?"] objectAtIndex:0];

}

+ (BOOL) isURL:(NSString*)one equalToURL:(NSString*)two {
    NSURL* urlOne = [[[NSURL alloc] initWithString:one] absoluteURL];
    NSURL* urlTwo = [[[NSURL alloc] initWithString:two] absoluteURL];
    
    NSString* pathOne = [urlOne.path length] ? urlOne.path : @"/";
    NSString* pathTwo = [urlTwo.path length] ? urlTwo.path : @"/";
    
    return [urlOne.scheme isEqualToString:urlTwo.scheme] &&
           [urlOne.host isEqualToString:urlTwo.host] &&
           [pathOne isEqualToString:pathTwo];
}

+ (NSString*) valueForKey:(NSString*)key inURL:(NSString*)url {
    NSString* query = [[NSURL alloc] initWithString:url].query;

    NSMutableDictionary *dict = [NSMutableDictionary new];
    for (NSString *p in [query componentsSeparatedByString:@"&"]) {
        NSArray *pair = [p componentsSeparatedByString:@"="];
        [dict setObject:[pair objectAtIndex:1]  forKey:[pair objectAtIndex:0]];
    }
    return [dict objectForKey:key];
}

@end
