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

@implementation CasLoginVC

@synthesize delegate = _delegate;
@synthesize client = _client;

- (id) init {
    if (self = [super init]) {
        CasConfiguration* conf = [[CasConfiguration alloc] init];

        self.client = [[CasClient alloc] initWithConfiguration:conf];
    }
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (NSURL*) loginURL {
    NSString* login = [self.client loginURLWithServiceURL:[self serviceURL] renew:TRUE];
    return [[NSURL alloc] initWithString:login];
}

- (NSString*) serviceURL {
    return @"http://127.0.0.1";
}

// Intercept request to service URL
- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {

    NSString* requestedNoQuery = [URLHelper stripQueryFromURL:[[request URL] absoluteString]];
    
    if ([URLHelper isURL:requestedNoQuery equalToURL:[self serviceURL]]) {
        
        NSLog(@"Login succesful");
        
        NSString* ticketStr = [URLHelper valueForKey:@"ticket" inURL:[[request URL] absoluteString]];
        
        if (ticketStr) {
    
            CasConfiguration* conf = [[CasConfiguration alloc] init];
            
            CasClient* client = [[CasClient alloc] initWithConfiguration:conf];
            
            CasServiceTicket* ticket = [client serviceTicket:ticketStr serviceURL:[self serviceURL]];
            
            [self.delegate successfullyObtainedServiceTicket:ticket];
            
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
