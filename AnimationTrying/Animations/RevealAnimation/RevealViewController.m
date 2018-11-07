//
//  RevealViewController.m
//  AnimationTrying
//
//  Created by JiangXuanke on 2018/10/24.
//  Copyright © 2018 JiangXuanke. All rights reserved.
//

#import "RevealViewController.h"

@interface RevealViewController ()

@property (nonatomic, strong)UIImageView *maskView;

@end

@implementation RevealViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildView];
}
#pragma mark - Build views
- (void)buildView {
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.view addSubview:imageView];
    [imageView setImage:[UIImage imageNamed:@"doge"]];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.offset(200);
        make.height.offset(200);
    }];
    
    _maskView = [[UIImageView alloc] init];
    [self.view addSubview:self.maskView];
    [self.maskView setBackgroundColor:kFaceIDColorWithRGB(0x444444)];
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(imageView);
        make.width.equalTo(imageView.mas_width);
        make.height.equalTo(imageView.mas_height);
    }];
    
    UIButton *revealBtn = [[UIButton alloc] init];
    [self.view addSubview:revealBtn];
    [revealBtn.layer setBorderColor:kFaceIDColorWithRGB(0x444444).CGColor];
    [revealBtn.layer setBorderWidth:4.0f];
    [revealBtn.titleLabel setFont:[UIFont fontWithName:@"PingFangSC-Regular" size:20.0f]];
    [revealBtn setTitle:@"Show me the photo" forState:UIControlStateNormal];
    [revealBtn setTitleColor:kFaceIDColorWithRGB(0x444444) forState:UIControlStateNormal];
    [revealBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(imageView.mas_centerX);
        make.top.equalTo(imageView.mas_bottom).offset(50);
        make.width.offset(300);
        make.height.offset(80);
    }];
    [revealBtn addTarget:self
                  action:@selector(startAnimation:)
        forControlEvents:UIControlEventTouchUpInside];
}

- (void)buildAnimation {
    POPBasicAnimation *animation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    [animation setDuration:5.0f];
    animation.toValue = @(-300);
    [self.maskView pop_addAnimation:animation forKey:@"basicMovingAnimation"];
}

#pragma mark - Operation
- (void)startAnimation:(UIButton *)sender {
    [self buildAnimation];
}

@end
