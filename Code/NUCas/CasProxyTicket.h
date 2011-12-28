//
//  CasProxyTicket.h
//  UIWebViewHttpStatusCodeHandling
//
//  Created by John Dzak on 11/1/11.
//  Copyright 2011 SpinningSphere Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "cas.h"

@interface CasProxyTicket : NSObject {
    CAS* _cas;
    NSString* _proxyURL;
    NSString* _serviceURL;
    NSString* _proxyGrantingTicket;
    NSString* _proxyTicket;
    NSString* _message;
}

#pragma Properties

@property(nonatomic,readonly) NSString* proxyTicket;

@property(nonatomic,readonly) NSString* message;

@property (nonatomic, readonly, getter = isOk) BOOL ok;

#pragma Instance Methods

- (id) initWithCas:(CAS*)cas proxyURL:(NSString*)proxyURL serviceURL:(NSString*)serviceURL proxyGrantingTicket:(NSString*)pgt;

- (BOOL) reify:(NSString*)error;

@end
