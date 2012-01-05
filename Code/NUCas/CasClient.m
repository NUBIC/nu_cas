//
//  CasClient.m
//  UIWebViewHttpStatusCodeHandling
//
//  Created by John Dzak on 11/1/11.
//  Copyright 2011 Northwestern University. All rights reserved.
//

#import "CasClient.h"
#import "cas.h"
#import "CasConfiguration.h"
#import "CasServiceTicket.h"
#import "CasProxyTicket.h"
#import "URLHelper.h"

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

- (NSString*) loginURLWithServiceURL:(NSString*)serviceURL renew:(BOOL)renew {
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:
                            serviceURL, @"service", 
                            renew ? @"true" : @"false", @"renew", nil];
    return [URLHelper url:self.config.casURL appendPathComponent:@"login" withParams:params];
}

- (NSString*) serviceValidateURL {
    return [URLHelper url:self.config.casURL appendPathComponent:@"serviceValidate"];
}

- (NSString*) proxyURL {
    return [URLHelper url:self.config.casURL appendPathComponent:@"proxy"];
}

- (CasServiceTicket*) serviceTicket:(NSString*)ticket serviceURL:(NSString*) serviceURL {
    return [[CasServiceTicket alloc] initWithCas:_cas serviceValidateURL:[self serviceValidateURL] serviceURL:serviceURL ticket:ticket pgtReceiveURL:self.config.receiveURL pgtRetrieveURL:self.config.retrieveURL];
}

- (CasProxyTicket*) proxyTicket:(NSString*)ticket serviceURL:(NSString*)serviceURL proxyGrantingTicket:(NSString*)pgt {
    return [[CasProxyTicket alloc] initWithCas:_cas proxyURL:[self proxyURL] serviceURL:serviceURL proxyGrantingTicket:pgt];
}


@end
