//
//  DGCalendar.h
//  DGCalendar
//
//  Created by Diana Gren on 11/18/13.
//  Copyright (c) 2013 Diana Gren. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NSIndexPath+DGCalendarView.h"
#import "DGCalendarViewCell.h"

@class DGCalendarView;
@class DGCalendarViewCell;
@protocol DGCalendarViewDataSource <NSObject>
@optional
- (NSInteger)numberOfSectionsInCalendarView:(DGCalendarView *)calendarView;
@required
- (DGCalendarViewCell *)calendarView:(DGCalendarView *)calendarView cellForEventAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)calendarView:(DGCalendarView *)calendarView numberOfEventsInDay:(NSInteger)section;
@end

@interface DGCalendarView : UIView

@property (weak, nonatomic) id<DGCalendarViewDataSource> dataSource;

@property (strong, nonatomic) UIView *contentView;
@end
