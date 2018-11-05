//
//  MenuTableViewCell.m
//  AnimationTrying
//
//  Created by JiangXuanke on 2018/10/18.
//  Copyright © 2018 JiangXuanke. All rights reserved.
//

#import "MenuTableViewCell.h"

@implementation MenuTableViewCell

// 这应该就是重写cell的部分了
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.textLabel setTextColor:[UIColor grayColor]];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        // 设置AccessoryView后AccessoryType将不起作用
        // 因为Cell重用,所以设置AccessoryType之前需要将AccessoryView设置为nil
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.textLabel setFont:[UIFont fontWithName:@"Avenir-Light" size:20.0f]];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    if (self.highlighted) {
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        [scaleAnimation setDuration:0.1f];
        [scaleAnimation setToValue:[NSValue valueWithCGPoint:CGPointMake(0.95f, 0.95f)]];
        [self.textLabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    } else {
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        [scaleAnimation setToValue:[NSValue valueWithCGPoint:CGPointMake(1.0f, 1.0f)]];
        [scaleAnimation setVelocity:[NSValue valueWithCGPoint:CGPointMake(2.0f, 2.0f)]];
        [scaleAnimation setSpringBounciness:20.0f];
        [self.textLabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    }
}

@end
