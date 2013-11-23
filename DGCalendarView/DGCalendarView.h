//
//  DGCalendar.h
//  DGCalendar
//
//  Created by Diana Gren on 11/18/13.
//  Copyright (c) 2013 Diana Gren. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DGCalendarView;
@class DGCalendarViewCell;
@protocol DGCalendarViewDataSource <NSObject>
@required
- (DGCalendarViewCell *)calendarView:(DGCalendarView *)calendarView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)numberOfSectionsInCalendarView:(DGCalendarView *)calendarView;
- (NSInteger)calendarView:(DGCalendarView *)calendarView numberOfItemsInSection:(NSInteger)section;
@end

@interface DGCalendarView : UIView

@property (weak, nonatomic) id<DGCalendarViewDataSource> dataSource;
@end
