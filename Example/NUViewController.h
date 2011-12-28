//
//  NUViewController.h
//  Example
//
//  Created by John Dzak on 12/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NUViewController : UIViewController<UIWebViewDelegate> {
    UIWebView* _webView;
    UITextView* _logsTextView;
    NSString* _url;
    BOOL _sessionChecked;
}

@property(nonatomic,retain) IBOutlet UIWebView* webView;
@property(nonatomic,retain) IBOutlet UITextView* logsTextView;
@property(nonatomic,retain) NSString* url;

- (void) successfulLogin;

@end
