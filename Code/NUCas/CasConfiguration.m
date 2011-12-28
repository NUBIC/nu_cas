//
//  CasConfiguration.m
//  UIWebViewHttpStatusCodeHandling
//
//  Created by John Dzak on 11/1/11.
//  Copyright 2011 SpinningSphere Labs. All rights reserved.
//

#import "CasConfiguration.h"

@implementation CasConfiguration 

@synthesize casURL=_casURL;
@synthesize receiveURL=_receiveURL;
@synthesize retrieveURL=_retrieveURL;

- (id)init
{
    self = [super init];
    if (self) {
        self.casURL = 
            [NSURL URLWithString:@"http://cas.dev"];
        
        self.receiveURL = 
            [NSURL URLWithString:@"https://cas2.nubic.northwestern.edu/cas-proxy-callback-staging/receive_pgt"];
        
        self.retrieveURL = 
            [NSURL URLWithString:@"https://cas2.nubic.northwestern.edu/cas-proxy-callback-staging/retrieve_pgt"];
    }
    
    return self;
}

- (id)initWithCasURL:(NSString*)casURL {
    self = [self init];
    
    if (self) {
        self.casURL = [NSURL URLWithString:casURL];
    }
    
    return self;
}

- (void) dealloc {
    [_casURL release];
    [_receiveURL release];
    [_retrieveURL release];
}

@end
