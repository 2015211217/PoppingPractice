//
//  ViewController.m
//  AnimationTrying
//
//  Created by JiangXuanke on 2018/10/17.
//  Copyright © 2018 JiangXuanke. All rights reserved.
//

#import "ViewController.h"
#import <pop/POP.h>
#import <pop/POPAnimatableProperty.h>
//  我觉得可以顺便看一下tableView的使用
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 感觉阅读官方文档就像是在做英语阅读一样,所以每读一次就感觉失去了一点灵魂
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    [button setBackgroundColor:[UIColor grayColor]];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];

    [button addTarget:self
               action:@selector(theSpringAnimation:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Animation
- (void)theSpringAnimation:(UIButton *)sender {
    // 首先，声明一个动画
    POPSpringAnimation *buttonAnimation = [POPSpringAnimation animation];
    // 其次，标明自己想要改变的属性
    buttonAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerSize];
    buttonAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(30, 30)];
    buttonAnimation.springBounciness = 10.0;
    buttonAnimation.springSpeed = 6.0;
    [sender pop_addAnimation:buttonAnimation forKey:@"spring"];
}
@end
