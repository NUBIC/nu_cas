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

@synthesize client = _client;

- (id) init {
    if (self = [super init]) {
        CasConfiguration* conf = [[CasConfiguration alloc] init];

        self.client = [[CasClient alloc] initWithConfiguration:conf];
    }
    return self;
}

- (id) initWithCasConfiguration:(CasConfiguration*)conf {
    if (self = [super init]) {
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
            
            CasServiceTicket* ticket = [self.client serviceTicket:ticketStr serviceURL:[self serviceURL]];
            
            [self.casLoginDelegate casLoginVC:self didSuccessfullyObtainedServiceTicket:ticket];
            
            return NO;
        }
        
    }
    
    return YES;
}

- (UIView*) toolbarWithFrame:(CGRect)frame {
    UIToolbar* t = [[UIToolbar alloc] initWithFrame:frame];
    t.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    UIBarButtonItem* cancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    
    UIBarButtonItem* flexItem1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:NULL action:NULL];
    
    UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0 , 11.0f, 200.0f, 21.0f)];
    [titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setTextColor:[UIColor colorWithRed:113.0/255.0 green:120.0/255.0 blue:128.0/255.0 alpha:1.0]];
    [titleLabel setText:@"Login"];
    [titleLabel setTextAlignment:UITextAlignmentCenter];
    UIBarButtonItem *toolBarTitle = [[UIBarButtonItem alloc] initWithCustomView:titleLabel];
    
    UIBarButtonItem* flexItem2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:NULL action:NULL];
    
    NSArray* a = [[NSArray alloc] initWithObjects:cancel, flexItem1, toolBarTitle, flexItem2, nil];
    [t setItems:a];
    return t;
}

- (void) cancel {
    [self.casLoginDelegate casLoginVCDidCancel:self];
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

    UIView* toolbar = [self toolbarWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 47)];
    [self.view addSubview:toolbar];
   
    UIWebView *wv = [[UIWebView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height)];
    [wv setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin];
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
