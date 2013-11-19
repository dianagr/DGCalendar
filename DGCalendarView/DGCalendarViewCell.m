//
//  DGDay.m
//  DGCalendar
//
//  Created by Diana Gren on 11/18/13.
//  Copyright (c) 2013 Diana Gren. All rights reserved.
//

#import "DGCalendarViewCell.h"

@implementation DGCalendarViewCell

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"This is a label";
        [self addSubview:_titleLabel];
        
        _subtitleLabel = [[UILabel alloc] init];
        [self addSubview:_subtitleLabel];
    }
    return self;
}

- (void)layoutSubviews {
    CGSize labelSize = [self.titleLabel sizeThatFits:self.frame.size];
    _titleLabel.frame = CGRectMake(10, 10, self.frame.size.width - 20, labelSize.height);
    _subtitleLabel.frame = CGRectMake(10, self.frame.size.height - 10, self.frame.size.width - 20, labelSize.height);
}

@end
