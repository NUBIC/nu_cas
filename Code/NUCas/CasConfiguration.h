//
//  CasConfiguration.h
//  UIWebViewHttpStatusCodeHandling
//
//  Created by John Dzak on 11/1/11.
//  Copyright 2011 SpinningSphere Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CasConfiguration : NSObject {
@private
    NSURL *_casURL;
    NSURL *_receiveURL;
    NSURL *_retrieveURL;
}

@property(nonatomic,retain) NSURL *casURL;
@property(nonatomic,retain) NSURL *receiveURL;
@property(nonatomic,retain) NSURL *retrieveURL;

- (id)initWithCasURL:(NSString*)casURL;

@end
