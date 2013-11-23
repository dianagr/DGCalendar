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
@property (assign, nonatomic) NSInteger oldX;
@property (assign, nonatomic) NSInteger oldY;
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
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    if (CGRectContainsPoint(self.bounds, touchLocation)) {
        self.moving = YES;
        self.oldX = touchLocation.x;
        self.oldY = touchLocation.y;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    if (self.isMoving) {
        CGRect frame = self.frame;
        frame.origin.x = self.frame.origin.x + touchLocation.x - self.oldX;
        frame.origin.y =  self.frame.origin.y + touchLocation.y - self.oldY;
        self.frame = frame;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.moving = NO;
}
@end
