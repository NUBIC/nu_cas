//
//  NUViewController.h
//  Example
//
//  Created by John Dzak on 12/28/11.
//  Copyright (c) 2011 Northwestern University. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NUCas.h"

@interface NUViewController : UIViewController<UIWebViewDelegate,CasLoginDelegate> {
    
    IBOutlet UILabel* _stepOneStatus;
    
    IBOutlet UILabel* _stepTwoStatus;
    
    IBOutlet UILabel* _stepThreeStatus;
}

#pragma mark - properties

@property(nonatomic,retain) UILabel* stepOneStatus;

@property(nonatomic,retain) UILabel* stepTwoStatus;

@property(nonatomic,retain) UILabel* stepThreeStatus;

#pragma mark - methods

- (IBAction)login;

- (void)successfullyObtainedServiceTicket:(CasServiceTicket*)serviceTicket;

@end