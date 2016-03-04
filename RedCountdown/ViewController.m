//
//  ViewController.m
//  RedCountdown
//
//  Created by 孙云 on 16/3/4.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"
static NSString * const MYCELL = @"MyCell";
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *myArray;
@property(nonatomic,strong)NSArray *myArray1;
@property(nonatomic,assign)NSInteger myArrayIndex;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backGroud"]];
     _myArrayIndex = 0;
    //注册
    [_collectionView registerNib:[UINib nibWithNibName:MYCELL bundle:nil] forCellWithReuseIdentifier:MYCELL];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(deleCell:) name:@"dele1" object:nil];
    //NSArray *array = @[@"4",@"40",@"400",@"4000",@"300"];
    self.myArray = [NSMutableArray array];
    [self.myArray addObject:@"2"];
    [self.myArray addObject:@"9"];
    [self.myArray addObject:@"16"];
    [self.myArray addObject:@"15"];
    [self.myArray addObject:@"12"];
    
    self.myArray1 = [NSArray arrayWithArray:self.myArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 方法二
- (void)deleCell:(NSNotification *)user{
    
    if (self.myArray.count) {
        // 使用时打开注释，注意：关闭方法一
        NSDictionary *dic = user.userInfo;
        MyCell *cell      = (MyCell *)dic[@"myCell"];
        
        NSInteger index1       = [self.myArray indexOfObject:self.myArray1[cell.tag]];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index1 inSection:0];
        [self.myArray removeObject:self.myArray1[cell.tag]];
        [_collectionView deleteItemsAtIndexPaths:@[indexPath]];
        
        
    }else{
        NSLog(@"self.myArray is nil");
    }
}

#pragma mark- 九宫格代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.myArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MYCELL forIndexPath:indexPath];
    
    cell.tag = indexPath.row;
    cell.timerString = _myArray[indexPath.row];
    cell.indexForCell =  indexPath.row;
    
    return cell;
    
}

@end
