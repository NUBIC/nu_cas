//
//  CasProxyTicket.h
//  UIWebViewHttpStatusCodeHandling
//
//  Created by John Dzak on 11/1/11.
//  Copyright 2011 Northwestern University. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "cas.h"

@interface CasProxyTicket : NSObject {
    CAS* _cas;
    NSString* _error;
    NSString* _message;
    NSString* _proxyTicket;
    NSString* _proxyURL;
    NSString* _serviceURL;
    NSString* _proxyGrantingTicket;
}

#pragma Properties

@property(nonatomic,readonly) NSString* error;

@property(nonatomic,readonly) NSString* message;

@property(nonatomic,readonly) NSString* proxyTicket;

@property (nonatomic, readonly, getter = isOk) BOOL ok;

#pragma Instance Methods

- (id) initWithCas:(CAS*)cas proxyURL:(NSString*)proxyURL serviceURL:(NSString*)serviceURL proxyGrantingTicket:(NSString*)pgt;

- (BOOL) reify;

@end
