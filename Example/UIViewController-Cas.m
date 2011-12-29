//
//  UIViewController-Cas.m
//  UIWebViewHttpStatusCodeHandling
//
//  Created by John Dzak on 10/7/11.
//  Copyright 2011 SpinningSphere Labs. All rights reserved.
//

#import "UIViewController-Cas.h"
#import "NUCas.h"

@implementation UIViewController (Cas)

- (void) loginWithCasBaseURL:(NSURL*) casURL webView:(UIWebView *)webView {
    NSURL *loginURL = [casURL URLByAppendingPathComponent:@"login"];
    loginURL = [casURL URLByAppendingQueryString:@"service=http%3A%2F%2F127.0.0.1"];
//    NSURL *tmp = [[NSURL alloc] initWithString:@"/Users/johndzak/Code/UIWebViewHttpStatusCodeHandling/UIWebViewHttpStatusCodeHandling/login.html"];
    [webView loadRequest:[NSURLRequest requestWithURL:loginURL]];
}

- (void) validate:(NSString*) serviceTicket {
    CasConfiguration* conf = [CasConfiguration new];
    CasClient* c = [[CasClient alloc] initWithConfiguration:conf];
    CasServiceTicket* st = [c serviceTicket:serviceTicket serviceURL:@"http://127.0.0.1"];
    
    [st present];
    
    if (st.ok) {
        NSLog(@"Successfully validated service ticket: [principal= %@ | pgt= %@]", st.principal, st.pgt);
    } else {
        NSLog(@"Failed to validate service ticket: %@", st.message);
    }
    
    CasProxyTicket* pt = [c proxyTicket:NULL serviceURL:@"http://targetService.dev/foo" proxyGrantingTicket:st.pgt];
    
    if ([pt reify]) {
        NSLog(@"Successfully obtained proxy ticket: [proxy ticket= %@]", pt.proxyTicket);
    } else {
        NSLog(@"Failed to obtained proxy ticket");        
    }
    
}

#pragma UIWebViewDelegate

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *host = [[request URL] host];
    if (host) {
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"127.0.0.1" options:0 error:NULL];
        NSTextCheckingResult *match = [regex firstMatchInString:host options:0 range:NSMakeRange(0, [host length])];
        if (match.numberOfRanges > 0) {
            NSString *params = [[request URL] query];
            NSLog(@"Category SUCCESSFUL LOGIN!!!!");
            NSLog([NSString stringWithFormat:@"Params: %@", params]);
            if ([self respondsToSelector:@selector(successfulLogin)]) {
                [self successfulLogin];
                [self validate:[[request URL] valueForParameter:@"ticket"]];
                return NO;
            }
        }
        
    }
    
    return YES;
}

@end
