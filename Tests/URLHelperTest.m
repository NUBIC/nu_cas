//
//  URLHelperTest.m
//  NUCas
//
//  Created by John Dzak on 12/30/11.
//  Copyright (c) 2011 Northwestern University. All rights reserved.
//

#import "URLHelperTest.h"
#import "NUCas.h"

@implementation URLHelperTest

- (void)testEncodeStringGeneralDelimeters {
    STAssertEqualObjects(@"%3A%2F%3F%23%5B%5D%40", [URLHelper encodeString:@":/?#[]@"], @"Wrong encoding");
}

- (void)testEncodeStringSubDelimeters {
    STAssertEqualObjects(@"%21%24%26%27%28%29%2A%2B%2C%3B%3D", [URLHelper encodeString:@"!$&'()*+,;="], @"Wrong encoding");
}

- (void)testAppendURLComponent {
    NSString* u = [URLHelper url:@"http://b.org" appendPathComponent:@"kirk"];
    STAssertEqualObjects(@"http://b.org/kirk", u, @"Wrong URL");
}

- (void)testAppendPathComponentWithParams {
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@"captain", @"role", @"yellow", @"shirt", nil];
    NSString* u = [URLHelper url:@"http://b.org" appendPathComponent:@"kirk" withParams:params];
    NSArray* split = [u componentsSeparatedByString:@"?"];

    // Scheme, host, and path
    STAssertEqualObjects(@"http://b.org/kirk", [split objectAtIndex:0], @"Wrong scheme, host, and path");

    // Params
    NSArray* actualParams = [[split objectAtIndex:1] componentsSeparatedByString:@"&"];
    STAssertTrue(2 == [actualParams count], @"Wrong number of params");
    STAssertTrue([actualParams containsObject:@"role=captain"], @"Missing parameter");
    STAssertTrue([actualParams containsObject:@"shirt=yellow"], @"Missing parameter");
}

- (void)testAppendPathComponentWithEscapedParams {
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@":)", @"escape", nil];
    NSString* u = [URLHelper url:@"http://b.org" appendPathComponent:@"kirk" withParams:params];
    STAssertEqualObjects(@"http://b.org/kirk?escape=%3A%29", u, @"Wrong URL");
}

- (void)testAppendPathComponentWithNullParams {
    NSString* u = [URLHelper url:@"http://b.org" appendPathComponent:@"kirk" withParams:NULL];
    STAssertEqualObjects(@"http://b.org/kirk", u, @"Wrong URL");
}
@end
