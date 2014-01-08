//
//  NSIndexPath+DGCalendarView.h
//  DGCalendarView
//
//  Created by Diana Gren on 1/7/14.
//  Copyright (c) 2014 Diana Gren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSIndexPath (DGCalendarView)

@property (readonly, nonatomic) NSInteger event;
@property (readonly, nonatomic) NSInteger day;

+ (NSIndexPath *)indexPathForEvent:(NSInteger)event inDay:(NSInteger)day;
@end
