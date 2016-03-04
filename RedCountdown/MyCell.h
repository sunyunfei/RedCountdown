//
//  MyCell.h
//  红包倒计时
//
//  Created by 孙云 on 16/3/3.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyCell;
@interface MyCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *showLabel;
@property (weak, nonatomic) IBOutlet UIImageView *redImage;
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,copy)NSString *timerString;

@property(nonatomic,assign)NSInteger indexForCell;

- (void)initTimer;
@end
