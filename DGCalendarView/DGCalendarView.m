//
//  DGCalendar.m
//  DGCalendar
//
//  Created by Diana Gren on 11/18/13.
//  Copyright (c) 2013 Diana Gren. All rights reserved.
//

#import "DGCalendarView.h"

#import "DGCalendarViewCell.h"
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
    _contentView = [[UIView alloc] init];
    [self addSubview:_contentView];

    UIView *yAxis = [[UIView alloc] initWithFrame:CGRectMake(_contentView.frame.origin.x, _contentView.frame.origin.y, 1.0, _contentView.frame.size.height)];
    yAxis.backgroundColor = [UIColor darkGrayColor];
    [self.contentView addSubview:yAxis];

    self.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
}

- (void)layoutSubviews {
    CGFloat y = 10.0;
    CGFloat x = 10.0;

    self.contentView.frame = CGRectMake(self.frame.origin.x + 10, self.frame.origin.y + 20, self.frame.size.width - 20.0, self.frame.size.height - 30.0);
    NSInteger items = [self _numberOfItems];
    for (int i = 0; i < items; ++i) {
        DGCalendarViewCell *cell = [self.dataSource calendarView:self cellForEventAtIndexPath:[NSIndexPath indexPathForEvent:i inDay:0]];
        cell.frame = CGRectMake(x, y, 100, 100);
        [self addSubview:cell];
        y = CGRectGetMaxY(cell.frame) + 10;
    }
}

- (NSInteger)_numberOfItems {
    if ([self.dataSource respondsToSelector:@selector(calendarView:numberOfEventsInDay:)]) {
        return [self.dataSource calendarView:self numberOfEventsInDay:0];
    }
    return 0;
}

- (NSInteger)_numberOfSections {
    if ([self.dataSource respondsToSelector:@selector(numberOfSectionsInCalendarView:)]) {
        return [self.dataSource numberOfSectionsInCalendarView:self];
    }
    return 1;
}
@end
