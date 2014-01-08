//
//  DGDay.h
//  DGCalendar
//
//  Created by Diana Gren on 11/18/13.
//  Copyright (c) 2013 Diana Gren. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    DGCalendarViewCellStyleDefault,
} DGCalendarViewCellStyle;

@interface DGCalendarViewCell : UIView

@property (retain, nonatomic) UIView *contentView;

@property (retain, nonatomic) UILabel *titleLabel;
@property (retain, nonatomic) UILabel *subtitleLabel;

@end
