//
//  MyCell.m
//  红包倒计时
//
//  Created by 孙云 on 16/3/3.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (void)awakeFromNib {
    _showLabel.layer.cornerRadius = _showLabel.frame.size.width / 2;
    _showLabel.layer.masksToBounds = YES;
    //self.timerString = @"5";
    
    [self initTimer];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
//    self.showLabel.text = [NSString stringWithFormat:@"%ld", self.tag];
}
/**
 *  时间加载
 */
- (void)initTimer{

    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeTimer) userInfo:nil repeats:YES];
}
/**
 *  时间改变
 */
- (void)changeTimer{

    int timerInt = [_timerString intValue];
    if (timerInt > 0) {
        timerInt --;
        self.timerString = [NSString stringWithFormat:@"%i",timerInt];
        self.showLabel.text = _timerString;
    }else
    {
        // 方法二
        NSDictionary *dic = @{@"myCell":self};
       //知道了有一个时间已经到了，发出通知
        [[NSNotificationCenter defaultCenter]postNotificationName:@"dele1" object:nil userInfo:dic];
        [_timer invalidate];
    }
}
@end
