//
//  myviewtool.m
//  ShopingCar
//
//  Created by Mac on 16/7/3.
//  Copyright © 2016年 qiguohui. All rights reserved.
//

#import "myviewtool.h"
#import "QiTopModel.h"
#import "UIButton+WebCache.h"


@interface myviewtool ()<UIScrollViewDelegate>
{
    UIPageControl*_pagcontrol;
    UIScrollView * _TOPscroll;

}

@end

@implementation myviewtool

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-( void ) greateScrollViewDataArray:(NSMutableArray*)arr withScrollView:(UIView *)myView withblock:(void(^)(UIScrollView*scrollview,UIPageControl*page))complay{
    
    //头scrollview 文本
    
    UIScrollView * TOPscroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, 300)];
    TOPscroll.backgroundColor = [UIColor redColor];
    [myView addSubview:TOPscroll];
    
    
    
    for (NSInteger i=0; i<arr.count; i++) {
        QiTopModel*model = arr[i];
        UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.frame = CGRectMake(kMainBoundsW*i, 0, kMainBoundsW, kMainBoundsH);
        [button sd_setBackgroundImageWithURL:[NSURL URLWithString:model.picUrl] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];
        [TOPscroll addSubview:button];
        
    }
   
    
    TOPscroll.pagingEnabled = YES;
    TOPscroll.contentSize = CGSizeMake(arr.count*kMainBoundsW, 0);
   TOPscroll.delegate = self;
    
    
    
    UIPageControl*pagcontrol = [[UIPageControl alloc]init];
    pagcontrol.center = CGPointMake(kMainBoundsW/2, TOPscroll.frame.size.height-30);
    pagcontrol.bounds = CGRectMake(0, 0, 200, 30);
    pagcontrol.currentPageIndicatorTintColor = [UIColor magentaColor];
    pagcontrol.pageIndicatorTintColor = [UIColor whiteColor];
  
    [myView addSubview:pagcontrol];
    pagcontrol.numberOfPages = arr.count;
    if (complay) {
        complay(TOPscroll,pagcontrol);
    }
    

}


- (void)buttonclick:(UIButton*)sender{
    NSLog(@"123");
    
}

@end
