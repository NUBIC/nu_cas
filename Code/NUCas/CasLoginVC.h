//
//  CasLoginVC.h
//  NUCas
//
//  Created by John Dzak on 12/29/11.
//  Copyright (c) 2011 Northwestern University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CasLoginDelegate.h"

@interface CasLoginVC : UIViewController<UIWebViewDelegate> {
    id<CasLoginDelegate> _delegate;
}

#pragma mark - properties

@property(nonatomic,retain) id<CasLoginDelegate> delegate;

#pragma mark - methods

- (NSURL*) loginURL;

- (NSString*) serviceURL;

@end
