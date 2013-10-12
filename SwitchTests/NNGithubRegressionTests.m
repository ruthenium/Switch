//
//  NNGithubRegressionTests.m
//  Switch
//
//  Created by Scott Perry on 10/11/13.
//  Copyright © 2013 Scott Perry.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//  This file tests for regressions concerning Github, which does not name its main window.
//

#import <XCTest/XCTest.h>

#import "NNWindowFilteringTests.h"


@interface NNGithubRegressionTests : XCTestCase

@end


@implementation NNGithubRegressionTests

- (void)testUnnamedGithubWindow;
{
    NSOrderedSet *windows = [NSOrderedSet orderedSetWithObject:[NNWindow windowWithDescription:@{
        NNWindowAlpha : @1,
        NNWindowBounds : DICT_FROM_RECT(((CGRect){
            .size.height = 742,
            .size.width = 1311,
            .origin.x = 28,
            .origin.y = 22
        })),
        NNWindowIsOnscreen : @1,
        NNWindowLayer : @0,
        NNWindowMemoryUsage : @4804660,
        NNWindowNumber : @93247,
        NNWindowOwnerName : @"GitHub",
        NNWindowOwnerPID : @23598,
        NNWindowSharingState : @1,
        NNWindowStoreType : @2,
    }]];
    
    XCTAssertEqualObjects(windows, [NNWindow filterInvalidWindowsFromSet:windows], @"Github was incorrectly filtered out");
}

@end
