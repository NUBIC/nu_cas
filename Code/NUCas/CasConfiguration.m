//
//  CasConfiguration.m
//  UIWebViewHttpStatusCodeHandling
//
//  Created by John Dzak on 11/1/11.
//  Copyright 2011 Northwestern University. All rights reserved.
//

#import "CasConfiguration.h"

@interface CasConfiguration () {
@private
    NSString* _casURL;
    NSString* _receiveURL;
    NSString* _retrieveURL;
}
@end

@implementation CasConfiguration 

@synthesize casURL=_casURL;
@synthesize receiveURL=_receiveURL;
@synthesize retrieveURL=_retrieveURL;

- (id)init {
    self = [super init];
    if (self) {
        NSString* path = [[NSBundle mainBundle] pathForResource:@"NUCas" ofType:@"plist"];

        if (!path) {
            NSLog(@"NUCas.plist not found at %@/NUCas.plist", [NSBundle mainBundle]);
        }
        
        NSDictionary* settings = [[NSDictionary alloc] initWithContentsOfFile:path];

        self.casURL = [settings objectForKey:@"cas.base.url"];
        
        self.receiveURL = [settings objectForKey:@"cas.receive.url"];
        
        self.retrieveURL = [settings objectForKey:@"cas.retrieve.url"];
    }
    
    return self;
}

- (id)initWithCasURL:(NSString*)casURL {
    self = [super init];
    if (self) {
        self.casURL = casURL;
    }
    
    return self;
}

- (id)initWithCasURL:(NSString*)casURL receiveURL:(NSString*)receiveURL retrieveURL:(NSString*)retrieveURL {
    self = [super init];
    if (self) {
        self.casURL = casURL;
        self.receiveURL = receiveURL;
        self.retrieveURL = retrieveURL;
    }
    
    return self;
}

@end
