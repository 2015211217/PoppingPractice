//
//  CircleViewController.m
//  AnimationTrying
//
//  Created by JiangXuanke on 2018/10/21.
//  Copyright © 2018 JiangXuanke. All rights reserved.
//

#import "CircleViewController.h"
#import "CircleView.h"

@interface CircleViewController ()

@property (nonatomic, strong) CircleView *circleView;

@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildCircleView];
    [self buildSlider];
}

#pragma mark - build Views
- (void)buildCircleView {
    _circleView = [[CircleView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
    [self.view addSubview:self.circleView];
    [self.circleView mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.center.equalTo(self.view);
        //make.width.height.offset(150);
        make.top.equalTo(self.view.mas_top).offset(200);
        make.centerX.equalTo(self.view.mas_left).offset(self.view.frame.size.width / 2 - 100.0f);
    }];
}

- (void)buildSlider {
    UISlider *slider = [[UISlider alloc] init];
    [slider setValue:0.7f];
    [slider setTintColor:[UIColor blueColor]];
    // 使用的不是autolayout，autolayout就是那个图形化的界面
    [slider setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:slider];
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(500);
        make.centerX.equalTo(self.view.mas_left).offset(self.view.frame.size.width / 2 - 100.0f);
    }];
    [slider addTarget:self
               action:@selector(sliderChanged:)
     forControlEvents:UIControlEventValueChanged];
    // 将两个动画关联起来
    // 这两段完全看不懂呢hhhhhhh
    NSDictionary *views = NSDictionaryOfVariableBindings(slider, _circleView);
//    [self.view addConstraint:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[self.circleView] - (40) - [slider]" options:0 metrics:nil views:views]];
//    [self.view addConstraint:[NSLayoutConstraint constraintsWithVisualFormat:@"H: |-[slider]-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_circleView]-(40)-[slider]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[slider]-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    
    
    [self.circleView setStrokeEnd:slider.value animated:NO];
}

- (void)sliderChanged:(UISlider *)slider {
    [self.circleView setStrokeEnd:slider.value animated:YES];
}

@end
