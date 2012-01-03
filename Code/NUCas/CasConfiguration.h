//
//  CasConfiguration.h
//  UIWebViewHttpStatusCodeHandling
//
//  Created by John Dzak on 11/1/11.
//  Copyright 2011 Northwestern University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CasConfiguration : NSObject

#pragma mark properties

@property(nonatomic,retain) NSString* casURL;

@property(nonatomic,retain) NSString* receiveURL;

@property(nonatomic,retain) NSString* retrieveURL;

#pragma mark methods

- (id)initWithCasURL:(NSString*)casURL;

@end
