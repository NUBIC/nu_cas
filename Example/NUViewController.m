//
//  NUViewController.m
//  Example
//
//  Created by John Dzak on 12/28/11.
//  Copyright (c) 2011 Northwestern University. All rights reserved.
//

#import "NUViewController.h"
#import "NUCas.h"

@implementation NUViewController

@synthesize stepOneStatus = _stepOneStatus;
@synthesize stepTwoStatus = _stepTwoStatus;
@synthesize stepThreeStatus = _stepThreeStatus;
@synthesize ticket = _ticket;

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void) viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES;
}

#pragma mark - Controller methods

- (IBAction)login {    
    CasLoginVC* clc = [[CasLoginVC alloc] init];
    clc.delegate = self;
    [self presentViewController:clc animated:YES completion:nil];
}

- (IBAction)validate {
    [self.ticket present];
    
    if (self.ticket.ok) {
        self.stepTwoStatus.text = 
            [NSString stringWithFormat:@"Successfully validated service ticket:\nprincipal= %@\npgt= %@", self.ticket.principal, self.ticket.pgt];
    } else {
        self.stepTwoStatus.text = 
            [NSString stringWithFormat:@"Failed to validate service ticket: %@", self.ticket.message];
    }
}

- (IBAction)obtainProxyTicket {
    CasConfiguration* conf = [CasConfiguration new];
    CasClient* client = [[CasClient alloc] initWithConfiguration:conf];
    CasProxyTicket* pt = [client proxyTicket:NULL serviceURL:@"http://targetService.dev/foo" proxyGrantingTicket:self.ticket.pgt];
    
    if ([pt reify]) {
        self.stepThreeStatus.text = 
            [NSString stringWithFormat:@"Successfully obtained proxy ticket:\nproxy ticket= %@", pt.proxyTicket];
    } else {
        self.stepThreeStatus.text =
            [NSString stringWithFormat:@"Failed to obtained proxy ticket: %@", pt.message];
    }
}

//- (IBAction)va:(id)sender

#pragma mark - Cas Methods

- (void)successfullyObtainedServiceTicket:(CasServiceTicket*)serviceTicket {
    self.ticket = serviceTicket;
    self.stepOneStatus.text = @"Successful obtained service ticket";
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
