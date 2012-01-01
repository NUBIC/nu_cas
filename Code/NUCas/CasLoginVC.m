//
//  CasLoginVC.m
//  NUCas
//
//  Created by John Dzak on 12/29/11.
//  Copyright (c) 2011 Northwestern University. All rights reserved.
//

#import "CasLoginVC.h"
#import "URLHelper.h"
#import "CasServiceTicket.h"
#import "CasConfiguration.h"
#import "CasClient.h"

@interface CasLoginVC()
- (NSURL*) loginURL;
@end

@implementation CasLoginVC

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (NSURL*) loginURL {
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:
                            [self serviceURL], @"service", 
                            @"true", @"renew", nil];
    
    return [[NSURL alloc] initWithString:[URLHelper url:@"http://cas.dev" appendPathComponent:@"login" withParams:params]];
}

- (NSString*) serviceURL {
    return @"http://127.0.0.1";
}

// Intercept request to service URL
- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {

    NSString* requestedNoQuery = [URLHelper stripQueryFromURL:[[request URL] absoluteString]];
    
    if ([URLHelper isURL:requestedNoQuery equalToURL:[self serviceURL]]) {
        
        NSLog(@"Login succesful");
        
        NSString* ticket = [URLHelper valueForKey:@"ticket" inURL:[[request URL] absoluteString]];
        
        if (ticket) {
    
            CasConfiguration* conf = [[CasConfiguration alloc] init];
            
            CasClient* client = [[CasClient alloc] initWithConfiguration:conf];
            
            [client serviceTicket:ticket serviceURL:[self serviceURL]];
            
            return NO;
        }
        
    }
    
    return YES;
}

#pragma mark - UIController methods

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIWebView *wv = [[UIWebView alloc] initWithFrame:self.view.frame];
    wv.delegate = self;
    [self.view addSubview:wv];
    
    NSURL* url = [self loginURL];
    NSLog(@"Logging into: %@", [url absoluteString]);
    [wv loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

@end
