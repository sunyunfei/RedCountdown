# 红包倒计时
这是一个红包倒计时的dmeo，是我的一个同事问我的一个问题，废了很长时间我用collectionview去实现，我当时写的时候有一个问题卡住了，就是怎么让一个红包消失后从新把红包的排列重新进行。
最后，我师傅给我一个方式解决很好，分享出来大家看一下。
中心代码：
      
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

运行结果：

![](http://ww2.sinaimg.cn/bmiddle/005yPfcfjw1f1kwx13kkdj30hs0vkjx7.jpg)
