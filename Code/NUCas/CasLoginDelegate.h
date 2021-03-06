//
//  CasLoginDelegate.h
//  NUCas
//
//  Created by John Dzak on 12/29/11.
//  Copyright (c) 2011 Northwestern University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CasServiceTicket.h"

@protocol CasLoginDelegate <NSObject>
- (void)successfullyObtainedServiceTicket:(CasServiceTicket*)serviceTicket;
@end
