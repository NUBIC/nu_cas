//
//  CasProxyTicket.m
//  UIWebViewHttpStatusCodeHandling
//
//  Created by John Dzak on 11/1/11.
//  Copyright 2011 SpinningSphere Labs. All rights reserved.
//

#import "CasProxyTicket.h"
#import "cas.h"

@implementation CasProxyTicket

@synthesize proxyTicket = _proxyTicket;
@synthesize message = _message;

- (id) initWithCas:(CAS*)cas proxyURL:(NSString*)proxyURL serviceURL:(NSString*)serviceURL proxyGrantingTicket:(NSString*)pgt {
    self = [super init];
    if (self) {
        _cas = cas;
        _proxyURL = [proxyURL copy];
        _serviceURL = [serviceURL copy];
        _proxyGrantingTicket = [pgt copy];
    }
    return self;
}

- (BOOL) reify:(NSString*)error {
    if (_cas == NULL) { error = @"ERROR: Libcas client is required"; return false; }
    if (_proxyURL == NULL) { error = @"ERROR: Proxy URL is required"; return false; }
    if (_serviceURL == NULL) { error = @"ERROR: Service URL is required"; return false;}
    if (_proxyGrantingTicket == NULL) { error = @"ERROR: Proxy Granting Ticket is required"; return false; }
    
    const char* proxy_c = [_proxyURL UTF8String];
    const char* service_c = [_serviceURL UTF8String];
    const char* pgt_c = [_proxyGrantingTicket UTF8String];
    
    @try {
        CAS_CODE code = cas_cas2_proxy(_cas, proxy_c, service_c, pgt_c);
        if (code == CAS2_PROXY_SUCCESS) {
            char* pt = cas_get_proxy_ticket(_cas);
            if (pt != NULL) {
                _proxyTicket = [[NSString alloc] initWithUTF8String:pt];
            } else {
                error = @"ERROR: Failed to obtain proxy ticket after successful proxy request";
            }
        } else {
            char* m = cas_get_message(_cas);
            error = [[NSString alloc ] initWithUTF8String:m];
        }
    }
    @catch (NSException *exception) {
        error = @"ERROR: Failed to obtain a proxy ticket";
    }
}

- (BOOL) isOk {
    return _message == NULL;
}

@end
