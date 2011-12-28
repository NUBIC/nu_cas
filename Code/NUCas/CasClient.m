//
//  CasClient.m
//  UIWebViewHttpStatusCodeHandling
//
//  Created by John Dzak on 11/1/11.
//  Copyright 2011 SpinningSphere Labs. All rights reserved.
//

#import "CasClient.h"
#import "cas.h"
#import "CasConfiguration.h"
#import "CasServiceTicket.h"
#import "CasProxyTicket.h"

@implementation CasClient

@synthesize cas=_cas;
@synthesize config=_config;

- (id) init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                reason:@"-init is not a valid initializer for the class CasClient, please use -initWithConfiguration"
                userInfo:nil];
    return nil;

}

- (id)initWithConfiguration:(CasConfiguration*)c {
    self = [super init];
    if (self) {
        cas_init();
        self.cas = cas_new();
        self.config = c;
        
        cas_set_ssl_validate_server([self cas],1);
        cas_set_ssl_ca([self cas],"/Users/johndzak/cacerts/cacert.pem");
    }
    
    return self;
}

- (NSString*) serviceValidateURL {
    return [[self.config.casURL URLByAppendingPathComponent:@"serviceValidate"] absoluteString];
}

- (NSString*) proxyURL {
    return [[self.config.casURL URLByAppendingPathComponent:@"proxy"] absoluteString];    
}

- (CasServiceTicket*) serviceTicket:(NSString*)ticket serviceURL:(NSString*) serviceURL {
    return [[CasServiceTicket alloc] initWithCas:_cas serviceValidateURL:[self serviceValidateURL] serviceURL:serviceURL ticket:ticket pgtReceiveURL:[_config.receiveURL absoluteString] pgtRetrieveURL:[_config.retrieveURL absoluteString]];
}

- (CasProxyTicket*) proxyTicket:(NSString*)ticket serviceURL:(NSString*)serviceURL proxyGrantingTicket:(NSString*)pgt {
    return [[CasProxyTicket alloc] initWithCas:_cas proxyURL:[self proxyURL] serviceURL:serviceURL proxyGrantingTicket:pgt];
}


@end
