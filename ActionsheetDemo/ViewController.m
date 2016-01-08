//
//  ViewController.m
//  ActionsheetDemo
//
//  Created by L on 16/1/7.
//  Copyright © 2016年 L. All rights reserved.
//

#import "ViewController.h"
#import "MessagePopView.h"
#define SCREEN_WIDTH                    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT                   ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()
@property (strong, nonatomic) MessagePopView *MessagePopView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setTitle:@"点我" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)show{
    _MessagePopView = [MessagePopView new];
    [_MessagePopView setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _MessagePopView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:_MessagePopView];
    [_MessagePopView showPopView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
