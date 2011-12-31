//
//  CasLoginVC.m
//  NUCas
//
//  Created by John Dzak on 12/29/11.
//  Copyright (c) 2011 Northwestern University. All rights reserved.
//

#import "CasLoginVC.h"
#import "NSURL-Additions.h"
#import "URLHelper.h"

@interface CasLoginVC()
- (NSURL*) loginURL;
@end
@implementation CasLoginVC

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
    [self.view addSubview:wv];
    
//    NSURL *casURL = [[NSURL alloc]initWithString:@"http://cas.dev/login?renew=true"];
//    NSURL *loginURL = [casURL URLByAppendingPathComponent:@"login"];
//    loginURL = [casURL URLByAppendingQueryString:@"service=127.0.0.1"];
    NSURL* url = [self loginURL];
    NSLog(@"URL: %@", [url absoluteString]);
    [wv loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (NSURL*) loginURL {
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:[self serviceURL], @"service", @"true", @"renew", nil];
    NSString* loginURL = [URLHelper url:@"http://cas.dev" appendPathComponent:@"login" withParams:params];
    return [[NSURL alloc] initWithString:loginURL];
}

- (NSString*) serviceURL {
    return @"127.0.0.1";
}
@end
