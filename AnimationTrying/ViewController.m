//
//  ViewController.m
//  AnimationTrying
//
//  Created by JiangXuanke on 2018/10/17.
//  Copyright © 2018 JiangXuanke. All rights reserved.
//

#import "ViewController.h"
#import "CircleViewController.h"
#import "Cells/MenuTableViewCell.h"
#import "RevealViewController.h"
#import <pop/POP.h>
#import <pop/POPAnimatableProperty.h>
#import "CircleViewAutoViewController.h"
//  我觉得可以顺便看一下tableView的使用
@interface ViewController ()

@property (nonatomic, strong) NSArray *tableViewItems;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

static NSString * const kCellIdentifier = @"cellIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    // 感觉阅读官方文档就像是在做英语阅读一样,所以每读一次就感觉失去了一点灵魂
    [self buildView];
    self.title = @"popping";
    [self buildTableView];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"Avenir" size:20],
                                                           NSForegroundColorAttributeName: [UIColor grayColor]}];
}

- (void)buildView {
    _tableView = [[UITableView alloc] init];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(64);
        make.bottom.left.right.equalTo(self.view);
    }];
    
}


#pragma mark - TableView
- (void)buildTableView {
    //  这里面装的就是各种动画
    self.tableViewItems = @[@[@"Circle Animation", [CircleViewController class]],
                            @[@"Circle Animation(auto)", [CircleViewAutoViewController class]],
                            @[@"Reveal Animation", [RevealViewController class]],
                            ];
    [self.tableView registerClass:[MenuTableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setRowHeight:50.0f];
    
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *viewController = [self viewControllerForRowAtIndexPath:indexPath];
    viewController.title = [self titleForRowAtIndexPath:indexPath];
    [self.navigationController pushViewController:viewController
                                         animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableViewItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier
                                                              forIndexPath:indexPath];
    cell.textLabel.text = [self.tableViewItems[indexPath.row] firstObject];
    return cell;
}

- (NSString *)titleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.tableViewItems[indexPath.row] firstObject];
}

- (UIViewController *)viewControllerForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[self.tableViewItems[indexPath.row] lastObject] new];
}

@end
