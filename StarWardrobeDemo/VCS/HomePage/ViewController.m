//
//  ViewController.m
//  ShopingCar
//
//  Created by Mac on 16/7/2.
//  Copyright © 2016年 qiguohui. All rights reserved.
//

#import "ViewController.h"
#import "Tool.h"
#import "UIButton+WebCache.h"
#import "QiTopModel.h"
#import "tableviewModel.h"
#import "myviewtool.h"

@interface ViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>{
    UIPageControl*_pagcontrol;
    UIScrollView * _TOPscroll;
    UIScrollView*_scrollview;


}
//头数据源
@property(nonatomic,retain) NSMutableArray * datarray;
//特价数据源
@property(nonatomic,strong)NSMutableArray*arraya;
//韩国馆
@property(nonatomic,strong)NSMutableArray*namearray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.namearray = [NSMutableArray array];
    
    self.arraya = [NSMutableArray array];
    self.datarray = [NSMutableArray array];
    self.view.backgroundColor = [UIColor yellowColor];
    UIScrollView*scrollview = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    scrollview.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:scrollview];
    _scrollview = scrollview;
    scrollview.contentSize = CGSizeMake(0, kMainBoundsH*2);
    scrollview.pagingEnabled = YES;
    //头scrollview数据
    //头scrollview 文本
    UIView*view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, 500)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];

    [Tool initwithrequestdata:^(NSArray *arr) {
        [self.datarray addObjectsFromArray:arr];
     //   NSLog(@"===%ld",self.datarray.count);
        
        [[myviewtool new]greateScrollViewDataArray:self.datarray withScrollView:view withblock:^(UIScrollView *scrollview, UIPageControl *page) {
            scrollview.delegate = self;
            _TOPscroll = scrollview;
            [page addTarget:self action:@selector(pageclick) forControlEvents:UIControlEventValueChanged];
            _pagcontrol = page;
        }];
    }];
     //特价商品view数据
    [Tool initwithtejiadata:^(NSArray *arr) {
        [self.arraya addObjectsFromArray:arr];
       // NSLog(@"===>>>%ld",self.arraya.count);
        [self createimageview];
    }];
    [self greatetabviewcollver];
    NSString*str = @"http://api-v2.mall.hichao.com/mall/region/new?region_id=1&ga=%2Fmall%2Fregion%2Fnew";
    
    [Tool initwithgreateurl:str tableviewinfo:^(NSArray *arr) {
        
        //tableviewModel * model = arr[0];
       // NSLog(@"----%ld",[[arr[0] allKeys] count]);
        [self.namearray addObjectsFromArray:arr];
        [self greatetabviewcollver];
        
    }];
}
-(void)pageclick{
    NSLog(@"===123");
    _TOPscroll.contentOffset = CGPointMake(_pagcontrol.currentPage*_TOPscroll.frame.size.width, 0);
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"456");
    _pagcontrol.currentPage = _TOPscroll.contentOffset.x/_TOPscroll.frame.size.width;
    
}
//特价区执行
-(void)createimageview{
    
    for (NSInteger i=0; i<self.arraya.count; i++) {
        topimagemodel*model = self.arraya[i];
        UIButton *buttona = [UIButton buttonWithType:UIButtonTypeCustom];
        //        buttona.frame = CGRectMake(5+(kMainBoundsW/2-10)*i, kMainBoundsH+10, kMainBoundsW/2-10, 300);
        buttona.frame = CGRectMake(10+((kMainBoundsW-30)/2+10)*i, 310, (kMainBoundsW-30)/2, 200);
        buttona.backgroundColor = [UIColor yellowColor];
        [buttona sd_setBackgroundImageWithURL:[NSURL URLWithString:model.img_index] forState:UIControlStateNormal];
        [buttona addTarget:self action:@selector(buttontopimage:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollview addSubview:buttona];
    }
    
    
    
}
//特价区执行事件
-(void)buttontopimage:(UIButton*)sender{
    
   // NSLog(@"456");
    
}



//建立中间的tableview展示区
-(void)greatetabviewcollver{
    UITableView * tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, kMainBoundsH-200, kMainBoundsW, kMainBoundsH)];
    
    tableview.delegate = self;
    tableview.dataSource = self;
    [_scrollview addSubview:tableview];
    
    [tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   // NSLog(@"++++++%ld",self.namearray.count) ;
    return self.namearray.count;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 3;

}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //[self Greatescroolview];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 100;
}
//-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//
//
//}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
