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
}


- (void)successfullyObtainedServiceTicket:(CasServiceTicket*)serviceTicket;

@end
