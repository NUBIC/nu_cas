//
//  CasClient.h
//  UIWebViewHttpStatusCodeHandling
//
//  Created by John Dzak on 11/1/11.
//  Copyright 2011 Northwestern University. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "cas.h"

@class CasConfiguration;
@class CasServiceTicket;
@class CasProxyTicket;

@interface CasClient : NSObject {
    @private
    CAS *_cas;
    CasConfiguration *_config;
}

#pragma Properties

@property(nonatomic)CAS* cas;

@property(nonatomic,retain)CasConfiguration* config;

#pragma Instance Methods

- (id)initWithConfiguration:(CasConfiguration*)config;

- (NSString*) loginURLWithServiceURL:(NSString*)serviceURL renew:(BOOL)renew;

- (NSString*) serviceValidateURL;

- (CasServiceTicket*) serviceTicket:(NSString*)ticket serviceURL:(NSString*)serviceURL;

- (CasProxyTicket*) proxyTicket:(NSString*)ticket serviceURL:(NSString*)serviceURL proxyGrantingTicket:(NSString*)pgt;

@end
