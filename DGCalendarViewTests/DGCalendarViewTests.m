//
//  DGCalendarTests.m
//  DGCalendarTests
//
//  Created by Diana Gren on 11/18/13.
//  Copyright (c) 2013 Diana Gren. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "DGCalendarView.h"

@interface DGCalendarViewTests : XCTestCase

@end

@implementation DGCalendarViewTests

- (void)testIndexPath {
    NSIndexPath *indexPath = [NSIndexPath indexPathForEvent:0 inDay:1];
    XCTAssertEqual(0, indexPath.event, @"Index for event not returning 0.");
    XCTAssertEqual(1, indexPath.day, @"Index for day not returning 1.");
}

@end
