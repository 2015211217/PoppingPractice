//
//  CircleView.m
//  AnimationTrying
//
//  Created by JiangXuanke on 2018/10/21.
//  Copyright © 2018 JiangXuanke. All rights reserved.
//  如何画一个圈圈

#import "CircleView.h"

@interface CircleView ()

@property (nonatomic, strong)CAShapeLayer *circleLayer;

@end

@implementation CircleView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildCircleLayer];
    }
    return self;
}

- (void)buildCircleLayer {
    CGFloat lineWidth = 4.0f;
    CGFloat radius = CGRectGetWidth(self.bounds)/2 - lineWidth / 2;
    self.circleLayer = [CAShapeLayer layer];
    CGRect rect = CGRectMake(lineWidth / 2, lineWidth / 2, radius * 2, radius * 2);
    self.circleLayer.path = [UIBezierPath bezierPathWithRoundedRect:rect
                                                       cornerRadius:radius].CGPath;
    self.circleLayer.strokeColor = [UIColor grayColor].CGColor;
    self.circleLayer.fillColor = nil;
    self.circleLayer.lineWidth = lineWidth;
    self.circleLayer.lineCap = kCALineCapRound;
    self.circleLayer.lineJoin = kCALineJoinRound;
    [self.layer addSublayer:self.circleLayer];
}

#pragma mark - stroke related
- (void)setStrokeEnd:(CGFloat)strokeEnd animated:(BOOL) animated {
    if (animated) {
        [self animateToStrokeEnd:strokeEnd];
        return;
    }
    self.circleLayer.strokeEnd = strokeEnd;
}

- (void)animateToStrokeEnd:(CGFloat)strokeEnd {
    POPSpringAnimation *strokeAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPShapeLayerStrokeEnd];
    strokeAnimation.toValue = @(strokeEnd);
    strokeAnimation.springBounciness = 2.0f;
    strokeAnimation.removedOnCompletion = NO;
    [self.circleLayer pop_addAnimation:strokeAnimation forKey:@"layerStrokeAnimation"];
}

@end

