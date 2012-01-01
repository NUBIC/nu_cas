//
//  NUViewController.m
//  Example
//
//  Created by John Dzak on 12/28/11.
//  Copyright (c) 2011 Northwestern University. All rights reserved.
//

#import "NUViewController.h"
#import "UIViewController-Cas.h"
#import "NUCas.h"

@interface NUViewController(Private)
- (void) log:(NSString *)message;
@end

@implementation NUViewController

@synthesize webView = _webView;
@synthesize logsTextView = _logsTextView;
@synthesize url = _url;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void) viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    CasLoginVC* clc = [[CasLoginVC alloc] init];
    [self presentViewController:clc animated:YES completion:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (void)dealloc {
    [self.webView release];
    [self.logsTextView release];
    [self.url release];
    [super dealloc];
}

#pragma -
#pragma Private Methods

- (void) log:(NSString *)message
{
    NSString *newText = [self.logsTextView.text stringByAppendingFormat:@"> %@\n", message];
    [self.logsTextView setText:newText];
    [self.logsTextView scrollRangeToVisible:NSMakeRange((self.logsTextView.text.length - 2), 1)];
}

#pragma -
#pragma Cas Methods

- (void) successfulLogin {
    NSLog(@"Successful Login!!!");
}

@end
