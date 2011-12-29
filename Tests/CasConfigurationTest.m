//
//  CasConfigurationTest.m
//  NUCas
//
//  Created by John Dzak on 12/29/11.
//  Copyright (c) 2011 Northwestern University. All rights reserved.
//

#import "CasConfigurationTest.h"
#import "NUCas.h"

@implementation CasConfigurationTest

- (void)testInitWithBaseURL {
    CasConfiguration* c = [[CasConfiguration alloc] initWithCasURL:@"http://cas.test"];
    STAssertEqualObjects(@"http://cas.test", c.casURL, @"Wrong CAS URL");
}

// TODO: Find a way to test NUCas.plist loading
//- (void) testInit {
//    CasConfiguration* c = [[CasConfiguration alloc] init];
//    STAssertEqualObjects(@"http://fake.test", c.casURL, @"Wrong cas URL");
//    STAssertEqualObjects(@"http://fake.test/receive_url", c.receiveURL, @"Wrong receive URL");
//    STAssertEqualObjects(@"http://fake.test/retreive_url", c.retrieveURL, @"Wrong retreive URL");
//}

@end
