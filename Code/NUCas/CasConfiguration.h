//
//  CasConfiguration.h
//  UIWebViewHttpStatusCodeHandling
//
//  Created by John Dzak on 11/1/11.
//  Copyright 2011 SpinningSphere Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CasConfiguration : NSObject

#pragma mark properties

@property(nonatomic,retain) NSURL* casURL;

@property(nonatomic,retain) NSURL* receiveURL;

@property(nonatomic,retain) NSURL* retrieveURL;

#pragma mark methods

- (id)initWithCasURL:(NSString*)casURL;

@end
