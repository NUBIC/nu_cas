//
//  CasServiceTicket.m
//  UIWebViewHttpStatusCodeHandling
//
//  Created by John Dzak on 11/1/11.
//  Copyright 2011 Northwestern University. All rights reserved.
//

#import "CasServiceTicket.h"
#import "cas.h"

@implementation CasServiceTicket

@synthesize principal = _principal;
@synthesize message = _message;
@synthesize pgt = _pgt;
@synthesize ok;

- (id) initWithCas:(CAS*)cas serviceValidateURL:(NSString*)serviceValidateURL serviceURL:(NSString*)serviceURL ticket:(NSString*)ticket {
    self = [super init];
    if (self) {
        _cas = cas;
        _serviceValidateURL = [serviceValidateURL copy];
        _serviceURL = [serviceURL copy];
        _ticket = [ticket copy];
    }
    return self;
}

- (id) initWithCas:(CAS *)cas serviceValidateURL:(NSString *)serviceValidateURL serviceURL:(NSString *)serviceURL ticket:(NSString*)ticket pgtReceiveURL:(NSString*)pgtReceiveURL pgtRetrieveURL:(NSString*)pgtRetrieveURL {
    
    self = [self initWithCas:cas serviceValidateURL:serviceValidateURL serviceURL:serviceURL ticket:ticket];
    
    if (self) {
        _receiveURL = pgtReceiveURL;
        _retrieveURL = pgtRetrieveURL; 
    }
    return self;
}

- (void) present {
    if (_cas == NULL) { _message = @"ERROR: Libcas client is required"; return; }
    if (_serviceValidateURL == NULL) { _message = @"ERROR: Service Validate URL is required"; return; }
    if (_serviceURL == NULL) { _message = @"ERROR: Service URL is required"; return; }
    if (_ticket == NULL) { _message = @"ERROR: Service ticket is required"; return; }
    
    const char* validate_c = [_serviceValidateURL UTF8String];
    const char* service_c = [_serviceURL UTF8String];
    const char* ticket_c = [_ticket UTF8String];
    const char* receive_c = [_receiveURL UTF8String];
    const char* retrieve_c = [_retrieveURL UTF8String];

    @try {
        CAS_CODE code = cas_cas2_serviceValidate_proxyTicketing(_cas, 
                   validate_c, service_c, ticket_c, 0,receive_c, retrieve_c);

        if (code == CAS_VALIDATION_SUCCESS) {
            char* p = cas_get_principal(_cas);
            if (p != NULL) {
                _principal = [[NSString alloc] initWithUTF8String:p];
            } else {
                _message = @"ERROR: Failed to obtain principal after successful service ticket validation";
            }
            
            char* pgt = cas_get_pgt(_cas);
            if (pgt != NULL) {
                _pgt = [[NSString alloc] initWithUTF8String:pgt];
            }
        } else {
            char* m = cas_get_message(_cas);
            _message = [[NSString alloc ] initWithUTF8String:m];
        }

    }
    @catch (NSException *exception) {
        _message = @"ERROR: Failed to validate the service ticket";
    }    
}

- (BOOL) isOk {
    return _message == NULL;
}


@end
