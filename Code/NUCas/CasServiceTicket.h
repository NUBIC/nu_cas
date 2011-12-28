//
//  CasServiceTicket.h
//  UIWebViewHttpStatusCodeHandling
//
//  Created by John Dzak on 11/1/11.
//  Copyright 2011 SpinningSphere Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cas.h"

@interface CasServiceTicket : NSObject {
    CAS* _cas;
    NSString* _ticket;
    NSString* _serviceValidateURL;
    NSString* _serviceURL;
    NSString* _receiveURL;
    NSString* _retrieveURL;
    NSString* _principal;
    NSString* _message;
    NSString* _pgt;
}

#pragma Properties

@property(nonatomic,readonly) NSString* principal;

@property(nonatomic,readonly) NSString* message;

@property(nonatomic,readonly) NSString* pgt;

@property (nonatomic, readonly, getter = isOk) BOOL ok;

#pragma Instance Methods

- (id) initWithCas:(CAS*)cas serviceValidateURL:(NSString*)serviceValidateURL serviceURL:(NSString*)serviceURL ticket:(NSString*)ticket;

- (id) initWithCas:(CAS *)cas serviceValidateURL:(NSString *)serviceValidateURL serviceURL:(NSString *)serviceURL ticket:(NSString*)ticket pgtReceiveURL:(NSString*)pgtReceiveURL pgtRetrieveURL:(NSString*)pgtRetrieveURL;

- (void) present;

@end
