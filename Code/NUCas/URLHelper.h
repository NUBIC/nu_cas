//
//  URLHelper.h
//  NUCas
//
//  Created by John Dzak on 12/29/11.
//  Copyright (c) 2011 Northwestern University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLHelper : NSObject

+ (NSString*) url:(NSString*)url appendPathComponent:(NSString*)pathComponent;

+ (NSString*) url:(NSString*)url appendPathComponent:(NSString*)pathComponent withParams:(NSDictionary*)params;
    
+ (NSString*) encodeString:(NSString*)raw;

+ (NSString*) stripQueryFromURL:(NSString*)url;

+ (NSString*) valueForKey:(NSString*)key inURL:(NSString*)url;

+ (BOOL) isURL:(NSString*)one equalToURL:(NSString*)two;

@end
