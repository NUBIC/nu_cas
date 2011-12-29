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
    
@end
