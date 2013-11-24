//
//  DGCalendar.m
//  DGCalendar
//
//  Created by Diana Gren on 11/18/13.
//  Copyright (c) 2013 Diana Gren. All rights reserved.
//

#import "DGCalendarView.h"

@implementation DGCalendarView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self sharedInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self sharedInit];
    }
    return self;
}

- (id)init {
    if (self = [super init]) {
        [self sharedInit];
    }
    return self;
}

- (void)sharedInit {
    UIView *yAxis = [[UIView alloc] initWithFrame:CGRectMake(self.frame.origin.x+10, self.frame.origin.y + 20.0, 1.0, self.frame.size.height - 30.0)];
    yAxis.backgroundColor = [UIColor darkGrayColor];
    [self addSubview:yAxis];
}


@end
