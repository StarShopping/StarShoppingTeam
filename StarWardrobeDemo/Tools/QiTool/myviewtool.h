//
//  myviewtool.h
//  ShopingCar
//
//  Created by Mac on 16/7/3.
//  Copyright © 2016年 qiguohui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myviewtool : UIView
-( void ) greateScrollViewDataArray:(NSMutableArray*)arr withScrollView:(UIView *)myView withblock:(void(^)(UIScrollView*scrollview,UIPageControl*page))complay;

@end
