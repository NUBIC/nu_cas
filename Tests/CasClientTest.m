//
//  NUCasConfiguration.m
//  NUCas
//
//  Created by John Dzak on 12/28/11.
//  Copyright (c) 2011 Northwestern University. All rights reserved.
//

#import "CasClientTest.h"
#import "NUCas.h"

@implementation CasClientTest

CasClient* c;
CasConfiguration* conf;

- (void)setUp {
    [super setUp];
    
    conf = [[CasConfiguration alloc] initWithCasURL:@"http://myCAS.test"];
    
    c = [[CasClient alloc] initWithConfiguration:conf];
}

- (void)testServiceValidateURL {
    STAssertEqualObjects(@"http://myCAS.test/serviceValidate", [c serviceValidateURL], nil);
}


- (void)testServiceValidateURLWithPath {  
    conf.casURL = @"http://myCAS.test/cas";
    STAssertEqualObjects(@"http://myCAS.test/cas/serviceValidate", [c serviceValidateURL], nil);
}

@end
