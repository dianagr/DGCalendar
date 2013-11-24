//
//  DGDay.m
//  DGCalendar
//
//  Created by Diana Gren on 11/18/13.
//  Copyright (c) 2013 Diana Gren. All rights reserved.
//

#import "DGCalendarViewCell.h"

@interface DGCalendarViewCell ()
@property (assign, nonatomic, getter = isMoving) BOOL moving;
@property (assign, nonatomic) CGPoint oldLocation;
@property (assign, nonatomic) NSInteger step;
@end
@implementation DGCalendarViewCell

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
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
    self.step = 1;
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = @"This is a label";
    _titleLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:_titleLabel];

    _subtitleLabel = [[UILabel alloc] init];
    [self addSubview:_subtitleLabel];

    self.backgroundColor = [UIColor lightGrayColor];
    self.layer.cornerRadius = 5.0;
}

- (void)layoutSubviews {
    CGSize labelSize = [self.titleLabel sizeThatFits:self.frame.size];
    _titleLabel.frame = CGRectMake(10, 10, self.frame.size.width - 20, labelSize.height);
    _subtitleLabel.frame = CGRectMake(10, self.frame.size.height - 10, self.frame.size.width - 20, labelSize.height);
}

#pragma mark Touch and Pan

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint touchLocation = [[[event allTouches] anyObject] locationInView:self];
    if (CGRectContainsPoint(self.bounds, touchLocation)) {
        self.moving = YES;
        self.oldLocation = CGPointMake(touchLocation.x, touchLocation.y);
    }
}

- (void)_move:(CGPoint)touchLocation {
    CGPoint newCenter;
    newCenter.x = self.step * floorf((self.center.x + touchLocation.x - self.oldLocation.x) / self.step + 0.5);
    newCenter.y = self.step * floor((self.center.y + touchLocation.y - self.oldLocation.y) / self.step + 0.5);
    self.center = newCenter;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint touchLocation = [[[event allTouches] anyObject] locationInView:self];
    if (self.isMoving) {
        [self _move:touchLocation];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.moving = NO;
}
@end
