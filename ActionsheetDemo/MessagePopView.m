//
//  ClearMessagePopView.m
//  vvim
//
//  Created by L on 15/11/17.
//  Copyright © 2015年 51vv. All rights reserved.
//

#import "MessagePopView.h"
#define SCREEN_WIDTH   ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT  ([UIScreen mainScreen].bounds.size.height)
@interface MessagePopView ()

@property (strong, nonatomic)UIImageView *imgView;
@property (strong, nonatomic)UIImageView *imgViewMessage;
@property (strong, nonatomic)UILabel *backgroundLabel;
@property (strong, nonatomic)UIView *contentView;
@property (nonatomic, strong)UIButton *clearMessageBtn;
@property (nonatomic, strong)UIButton *cancelBtn;

@end

@implementation MessagePopView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self drawView];
    }
    return self;
}

- (void)drawView{
    
    //半透明背景
    self.imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"show_pop_view_bk"]];
    self.imgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.imgView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidePopView)];//添加手势，点击隐藏
    [self.imgView addGestureRecognizer:tapGesture];
    [self addSubview:self.imgView];
    
    
    //弹层容器视图
    self.contentView = [[UIView alloc]init];
    self.contentView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 100);
    
    //弹层背景图
    self.imgViewMessage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"show_manage_pop_view_bk"]];
    self.imgViewMessage.frame = CGRectMake(0, 0, SCREEN_WIDTH, 100);
    self.imgViewMessage.userInteractionEnabled = YES;
    [self.contentView addSubview:self.imgViewMessage];
    
    self.clearMessageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.clearMessageBtn.frame = CGRectMake(0, 0, SCREEN_WIDTH, 45);
    self.clearMessageBtn.backgroundColor = [UIColor whiteColor];
    [self.clearMessageBtn setTitle:@"确认" forState:UIControlStateNormal];
    [self.clearMessageBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.clearMessageBtn addTarget:self action:@selector(MessageClick) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.clearMessageBtn];
    
    self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelBtn.frame = CGRectMake(0, 55, SCREEN_WIDTH, 45);
    self.cancelBtn.backgroundColor = [UIColor whiteColor];
    [self.cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelBtn addTarget:self action:@selector(hidePopView) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.cancelBtn];
   
    [self.imgView addSubview:self.contentView];
}

//点击确认的事件
- (void)MessageClick{
    /**
     *  这里添加其他操作
     */
    [self hidePopView];
}

//隐藏弹层
-(void) hidePopView
{
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.frame = CGRectMake(0.0f, SCREEN_HEIGHT + 100 , self.frame.size.width, self.contentView.frame.size.height );
    } completion:^(BOOL finished) {
        self.hidden = YES;
        [self removeFromSuperview];
    }];
    
}
//显示弹层
-(void) showPopView
{
    [UIView animateWithDuration:0.5 animations:^{
        self.hidden = NO;
        self.contentView.frame = CGRectMake(0.0f,  SCREEN_HEIGHT - 100, self.frame.size.width, self.contentView.frame.size.height);
    }];
    self.imgView.hidden = NO;
}
@end
