//
//  UIViewController-Cas.h
//  UIWebViewHttpStatusCodeHandling
//
//  Created by John Dzak on 10/7/11.
//  Copyright 2011 SpinningSphere Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Cas)<UIWebViewDelegate>
- (void) loginWithCasBaseURL:(NSURL*) casURL webView:(UIWebView *)webView;
- (void) validate:(NSString*) serviceTicket;
@end
