//
//  MovingViewController.m
//  AnimationTrying
//
//  Created by JiangXuanke on 2018/11/6.
//  Copyright © 2018 JiangXuanke. All rights reserved.
//  move and decay

#import "MovingViewController.h"

@interface MovingViewController ()

@property (nonatomic, strong) UIButton *imageView;

@end

@implementation MovingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildView];
}

#pragma mark - buildView
- (void)buildView {
    self.title = @"Just do it!!";
    _imageView = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.imageView];
    [self.imageView setBackgroundImage:[UIImage imageNamed:@"doge"] forState:UIControlStateNormal];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(200);
        make.height.offset(150);
        make.center.equalTo(self.view);
    }];
    [self.imageView setAdjustsImageWhenHighlighted:NO];
    [self.imageView addTarget:self
                       action:@selector(animationTouchupInside:)
             forControlEvents:UIControlEventTouchUpInside];
    [self.imageView addTarget:self
                       action:@selector(animationWithTouchDown:)
             forControlEvents:UIControlEventTouchDown];
    
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handlePan:)];
    [self.imageView addGestureRecognizer:recognizer];
}

#pragma mark - operation
- (void)animationTouchupInside:(UIButton *)sender {
    
}

- (void)animationWithTouchDown:(UIButton *)sender {
    
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer {
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    // if the movement ends
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint velocity = [recognizer velocityInView:self.view];
        POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation.velocity = [NSValue valueWithCGPoint:velocity];
        positionAnimation.dynamicsTension = 10.0f;
        positionAnimation.springBounciness = 12.0f;
        [recognizer.view.layer pop_addAnimation:positionAnimation forKey:@"layerPositionAnimation"];
    }
}

#pragma mark - animation
- (void)buildAnimation {
    
}


@end
