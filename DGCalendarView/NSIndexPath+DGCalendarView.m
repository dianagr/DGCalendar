//
//  NSIndexPath+DGCalendarView.m
//  DGCalendarView
//
//  Created by Diana Gren on 1/7/14.
//  Copyright (c) 2014 Diana Gren. All rights reserved.
//

#import "NSIndexPath+DGCalendarView.h"

@implementation NSIndexPath (DGCalendarView)

+ (NSIndexPath *)indexPathForEvent:(NSInteger)event inDay:(NSInteger)day {
    NSUInteger indexes[] = {event, day};
    return [NSIndexPath indexPathWithIndexes:indexes length:2];
}

- (NSInteger)event {
    return [self indexAtPosition:0];
}

- (NSInteger)day {
    return [self indexAtPosition:1];
}

@end
