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
    _titleLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:_titleLabel];

    _subtitleLabel = [[UILabel alloc] init];
    _subtitleLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:_subtitleLabel];

    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 5.0;
    self.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.layer.borderWidth = 0.5;
    self.layer.zPosition = 0;
}

- (void)layoutSubviews {
    const CGFloat kSubtitlePaddingX = 20;
    const CGFloat kSubtitlePaddingY = 10;
    CGFloat x = 10, y = 10;

    CGSize titleLabelSize = [self.titleLabel sizeThatFits:self.frame.size];
    self.titleLabel.frame = CGRectMake(x, y, self.frame.size.width - 20, titleLabelSize.height);

    CGSize subtitleLabelSize = [self.subtitleLabel sizeThatFits:self.frame.size];
    y = self.frame.size.height - subtitleLabelSize.height - kSubtitlePaddingY;
    self.subtitleLabel.frame = CGRectMake(x, y, self.frame.size.width - kSubtitlePaddingX, subtitleLabelSize.height);
}

#pragma mark Touch and Pan

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint touchLocation = [[[event allTouches] anyObject] locationInView:self];
    if (CGRectContainsPoint(self.bounds, touchLocation)) {
        self.moving = YES;
        self.oldLocation = CGPointMake(touchLocation.x, touchLocation.y);
        self.layer.zPosition = 1;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint touchLocation = [[[event allTouches] anyObject] locationInView:self];
    if (self.isMoving) {
        CGPoint newCenter = CGPointZero;
        newCenter.x = self.step * floorf((self.center.x + touchLocation.x - self.oldLocation.x) / self.step + 0.5);
        newCenter.y = self.step * floor((self.center.y + touchLocation.y - self.oldLocation.y) / self.step + 0.5);
        self.center = newCenter;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.moving = NO;
    self.layer.zPosition = 0;
}
@end
