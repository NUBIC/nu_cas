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

//- (IBAction)va:(id)sender

#pragma mark - Cas Methods

- (void)successfullyObtainedServiceTicket:(CasServiceTicket*)serviceTicket {
    self.stepOneStatus.text = @"Successful obtained service ticket";
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
