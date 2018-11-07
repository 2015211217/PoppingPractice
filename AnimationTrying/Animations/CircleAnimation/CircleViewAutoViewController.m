//
//  CircleViewAutoViewController.m
//  AnimationTrying
//
//  Created by JiangXuanke on 2018/11/5.
//  Copyright © 2018 JiangXuanke. All rights reserved.
//
//  有时间可以研究一下动画的制作，反正以后肯定会接触到的

#import "CircleViewAutoViewController.h"
#import "CircleView.h"

@interface CircleViewAutoViewController ()

@property (nonatomic, strong)CircleView *circleView;

@end

@implementation CircleViewAutoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildView];
}

- (void)buildView {
    _circleView = [[CircleView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
    [self.view addSubview:self.circleView];
    [self.circleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(200);
        make.centerX.equalTo(self.view.mas_left).offset(self.view.frame.size.width / 2 - 100.0f);
    }];
    
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:startBtn];
    [startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(500);
        make.width.offset(200);
        make.height.offset(100);
    }];
    [startBtn addTarget:self
                 action:@selector(startAnimating:)
       forControlEvents:UIControlEventTouchUpInside];
    [startBtn setTitle:@"Let's rock!!!" forState:UIControlStateNormal];
    [startBtn.titleLabel setFont:[UIFont fontWithName:@"PingFangSC-Medium" size:25.0f]];
    [startBtn.layer setBorderColor:kFaceIDColorWithRGB(0x444444).CGColor];
    [startBtn.layer setBorderWidth:5.0f];
    [startBtn setTitleColor:kFaceIDColorWithRGB(0x444444) forState:UIControlStateNormal];
    [self.circleView setStrokeEnd:0.0f animated:NO];
}
#pragma mark - Operations
- (void)startAnimating:(UIButton *)sender{
    [self.circleView setStrokeEnd:1.0f animated:YES];
}

@end
