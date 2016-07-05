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
#import "BaseModel.h"

#import "QiModel/tableviewModel.h"

@interface ViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>{
    UIPageControl*_pagcontrol;
    UIScrollView * _TOPscroll;
    UIScrollView*_scrollview;
    NSInteger count;
    UITableView * _tableview;
    CGFloat Wheight;

    NSMutableArray * dataArr;
}
//头数据源
@property(nonatomic,retain) NSMutableArray * datarray;
//特价数据源
@property(nonatomic,strong)NSMutableArray*arraya;
//韩国馆
@property(nonatomic,strong)NSMutableArray*_namearray;
@property(nonatomic,strong)NSMutableArray*region_brandsarray;
@property(nonatomic,strong)NSMutableArray*region_picturesarray;
@property(nonatomic,strong)NSMutableArray*region_skusarray;
@property(nonatomic,retain)NSMutableArray*array;
// 低部视图数据
@property(nonatomic,retain)NSMutableArray*basearray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

#pragma 请求头数据源
    [Tool initwithrequestdata:^(NSArray *arr)
    {
        [self.datarray addObjectsFromArray:arr];
        count = 9;
        }];
#pragma 中间特价数据源
    [Tool initwithtejiadata:^(NSArray *arr)
    {
        [self.arraya addObjectsFromArray:arr];
        }];

    self.array = [NSMutableArray array];
    //尾部cell数据
    self.basearray = [NSMutableArray array];
    //特价数据
    self.arraya = [NSMutableArray array];
    //头数据
    self.datarray = [NSMutableArray array];
   
#pragma mark 请求尾部cell数据
    [Tool greatetableviewinfor:^(NSArray *arr)
    {
        
        [self.basearray addObjectsFromArray:arr];
        }];
#pragma mark===调用总tableview上的数据
    [self greatetopimage];
}
#pragma mark-----个个scrollview调用的方法；
- ( UIView * )greatetabviewcollverarray:( NSArray * ) arr
{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, 300)];
  
    UIScrollView * TOPscroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, 300)];
    TOPscroll.backgroundColor = [UIColor redColor];
    TOPscroll.delegate = self;
    [view addSubview:TOPscroll];
    TOPscroll.clipsToBounds = YES;
    _TOPscroll = TOPscroll;
   
    if ( count  == 9 )
    {
        for ( NSInteger i = 0 ; i < arr.count ; i ++ )
        {
            QiTopModel * model = arr[i];
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            
            button.frame = CGRectMake( kMainBoundsW * i, 0, kMainBoundsW, TOPscroll.frame.size.height );
            [button sd_setBackgroundImageWithURL:[NSURL URLWithString:model.picUrl] forState:UIControlStateNormal];
            
            [button addTarget:self action:@selector( buttonclick: ) forControlEvents:UIControlEventTouchUpInside];
            [TOPscroll addSubview:button];
            
       }

    }
    if (count == 10)
    {
      for (NSInteger i = 0 ; i < arr.count ; i ++ )
      {
         qitableviewmodel * moderl = arr[i];
          
          UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            
            button.frame = CGRectMake( kMainBoundsW * i , 0 , kMainBoundsW ,300 );
            [button sd_setImageWithURL:[NSURL URLWithString:moderl.picUrl] forState:UIControlStateNormal];
            
            
            [button addTarget: self action: @selector ( buttonclick: ) forControlEvents:UIControlEventTouchUpInside];
            [TOPscroll addSubview:button];
            }
            }
    TOPscroll.pagingEnabled = YES;
    TOPscroll.contentSize = CGSizeMake( arr.count * kMainBoundsW, 0);
    TOPscroll.delegate = self;
    _TOPscroll = TOPscroll;
    
    UIPageControl * pagcontrol = [[UIPageControl alloc]init];
    pagcontrol.center = CGPointMake( kMainBoundsW / 2, TOPscroll.frame.size.height -  30);
    pagcontrol.bounds = CGRectMake( 0 , 0 , 200 , 30 );
    pagcontrol.currentPageIndicatorTintColor = [UIColor magentaColor];
    pagcontrol.pageIndicatorTintColor = [UIColor whiteColor];
    [pagcontrol addTarget: self action: @selector( pageclick ) forControlEvents:UIControlEventValueChanged];
    
    [view addSubview:pagcontrol];
  
    _pagcontrol = pagcontrol;
    pagcontrol.numberOfPages = arr.count;
   
    return view;
}

- ( void )buttonclick:( UIButton * )sender
{
}
#pragma mark---page代理调用方法
- ( void )pageclick
{
    
    _TOPscroll.contentOffset = CGPointMake( _pagcontrol.currentPage * _TOPscroll.frame.size.width , 0);
}
#pragma scrollview代理调用方法
- ( void )scrollViewDidEndDecelerating:( UIScrollView * )scrollView
{
_pagcontrol.currentPage = _TOPscroll.contentOffset.x / _TOPscroll.frame.size.width ;
    
}
#pragma mark 特价区执行事件
- ( UIView * )createimageview
    {
    UIView * viewb = [[UIView alloc]initWithFrame:CGRectMake ( 0 ,  0 , kMainBoundsW , 200 )];
    viewb.backgroundColor = [UIColor yellowColor];
    viewb.clipsToBounds = YES;
    
    for ( NSInteger i = 0 ; i < self.arraya.count ;  i++ )
    {
        topimagemodel * model = self.arraya[i];
        UIButton * buttona = [UIButton buttonWithType:UIButtonTypeCustom] ;
        
        buttona.frame = CGRectMake( 10 + (( kMainBoundsW - 30 )/2 + 10 ) * i , 0 , ( kMainBoundsW - 30 )/2 , 200 );
        
        [buttona sd_setBackgroundImageWithURL:[NSURL URLWithString:model.img_index] forState:UIControlStateNormal];
        [buttona addTarget:self action: @selector( buttontopimage: ) forControlEvents:UIControlEventTouchUpInside];
        [viewb addSubview:buttona];
    }
    
    return viewb;
    
    }
//特价区点击事件
- ( void ) buttontopimage:( UIButton * )sender
{
    
   // NSLog(@"456");
}

#pragma mark --tableview调用6个执行滚动事件
- ( void ) greatetopimage
     {
    self._namearray = [ NSMutableArray array];
    for ( NSInteger j = 0 ; j < 6 ; j++ )
      {
        NSString * str = [NSString stringWithFormat: @"http://api-v2.mall.hichao.com/mall/region/new?region_id=%ld&ga=%2Fmall%2Fregion%2Fnew",j + 1 ];
        [Tool initWithGreateurl:str tableviewinfo:^(NSArray *arr)
        {
        tableviewModel * model = [ arr objectAtIndex: 0 ];
        [self._namearray addObject: model ];
        }];
        }
    
    [self greatetabviewcollver];
        }
#pragma mark ---开始画表；
-(void)greatetabviewcollver
  {
     UITableView * tableview = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped] ;
    tableview.delegate = self ;
    tableview.dataSource = self ;
    [self.view addSubview:tableview] ;
    _tableview = tableview;
    [tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"] ;
    }
//tableview的区数
- ( NSInteger ) numberOfSectionsInTableView:( UITableView * )tableView
  {
   
    return  self._namearray.count + 2 ;
    
   }
//tableview de  行数；
- ( NSInteger )tableView:( UITableView * )tableView numberOfRowsInSection:( NSInteger )section
    {
    if ( section == 0 )
    {
        return 1;
    } else if ( section < self._namearray.count + 1 ){
        return 3;
    } else {
        return self.basearray.count/2+1;
    }
    }
#pragma mark  绘制cell
- ( UITableViewCell * ) tableView:( UITableView * )tableView cellForRowAtIndexPath:( NSIndexPath * )indexPath
       {
    UITableViewCell * cell = [ tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath ] ;
    // 移除视图
    for ( UIView * view in cell.contentView.subviews )
        {
        [ view removeFromSuperview ] ;
        }
    if (indexPath.section == 0&&indexPath.row == 0)
        {
        UIView * viewb = [ self createimageview ];
        [ cell.contentView addSubview:viewb] ;
        }
        else if (indexPath.section < self._namearray.count + 1 )
        {
        for ( NSInteger j = 0 ; j < self._namearray.count ; j++ )
        {
        if ( indexPath.section == j + 1 && indexPath.row == 0 )
        {
            UIView * view = [ self greatecellview: j ] ;
            [ cell.contentView  addSubview: view ] ;
         }
        else if ( indexPath.section == j + 1 && indexPath.row == 1)
        {
            count = 10;
            tableviewModel * model = self._namearray[j] ;
            NSArray * arr = model.region_pictures ;
            NSMutableArray * arr0 = [ NSMutableArray array ];
            for ( NSDictionary * dic in arr)
        {
                qitableviewmodel * modelQi = [qitableviewmodel greatinitWithqimodelinfodata:dic ] ;
               [ arr0 addObject:modelQi ];
        }
            [ cell.contentView addSubview:[self greatetabviewcollverarray:arr0]];
        }else if ( indexPath.section == j + 1 && indexPath.row == 2)
        {
            
            [ cell.contentView addSubview:[self greatethirdsellview:j]];
        }
        }
        }else{
        UIView * view = [ self greatetbaseview:indexPath.row ];
        [ cell.contentView addSubview:view ] ;
        }
        return cell ;
        }

#pragma mark - tableview 六个区循环事件 第三行执行
- ( UIView * ) greatethirdsellview:( NSInteger ) datainfo
   {
    UIView * view  = [[ UIView alloc ]initWithFrame:CGRectMake( 0 ,  0 , kMainBoundsW , 150 )];
    view.clipsToBounds = YES;
    UIScrollView * scrollview0 = [[UIScrollView alloc]initWithFrame:view.frame];
    scrollview0.backgroundColor = [ UIColor yellowColor ] ;
    [ view addSubview:scrollview0 ] ;
    tableviewModel * model = self._namearray[datainfo];
    NSArray * arr = model.region_skus ;
    NSMutableArray * arr0 =[NSMutableArray array];
    for ( NSDictionary * dic in arr ) {
        qitableviewmodel * modelQi = [ qitableviewmodel greatinitWithqimodelinfodata:dic ] ;
        [ arr0 addObject: modelQi ];
    }
    for ( NSInteger i = 0 ; i < arr0.count ; i ++ )
      {
        qitableviewmodel * moderl = arr0[i] ;
        UIButton * button = [ UIButton buttonWithType:UIButtonTypeCustom ] ;
        button.frame = CGRectMake(100 * i , 0 , 100 , 100 ) ;
        [ button sd_setImageWithURL:[ NSURL URLWithString:moderl.picUrl ] forState:UIControlStateNormal ] ;
        [ button addTarget:self action: @selector( buttonclick: ) forControlEvents:UIControlEventTouchUpInside ] ;
        [ scrollview0 addSubview:button ];
        UILabel * lable = [[UILabel alloc]initWithFrame:CGRectMake( 100 * i , 100 , 100 , 50 ) ] ;
        lable.backgroundColor = [UIColor whiteColor] ;
        lable.text = [ NSString stringWithFormat:@"%@\n¥%@", moderl.title , moderl.price ] ;
        lable.font = [ UIFont systemFontOfSize:12 ] ;
        lable.numberOfLines = 0;
        lable.textAlignment = NSTextAlignmentCenter;
        [ scrollview0 addSubview:lable ] ;
        }
    scrollview0.delegate = self ;
    scrollview0.pagingEnabled = YES ;
    scrollview0.contentSize = CGSizeMake( 100 * arr.count , 0 ) ;
    return view;
    }
    
#pragma mark - tableview 六个区循环事件 第一行执行
- ( UIView * ) greatecellview:( NSInteger )infodata
    {
    UIView * view  = [[ UIView alloc ]initWithFrame:CGRectMake( 0 , 0 , kMainBoundsW , 80 )];
    view.clipsToBounds = YES;
    UIScrollView * scrollview0 = [[ UIScrollView alloc ]initWithFrame: view.frame ] ;
    scrollview0.backgroundColor = [UIColor yellowColor] ;
    [ view addSubview:scrollview0 ] ;
    tableviewModel * model = self._namearray[infodata] ;
    NSArray * arr = model.region_brands ;
    NSMutableArray * arr0 = [ NSMutableArray array ] ;
    for ( NSDictionary * dic in arr ) {
    qitableviewmodel * modelQi = [ qitableviewmodel greatinitWithqimodelinfodata: dic ] ;
       [ arr0 addObject: modelQi ] ;
    }
    
    for ( NSInteger i = 0 ; i < arr0.count ; i++ )
       {
        qitableviewmodel * moderl = arr0[i];
        UIButton * button = [ UIButton buttonWithType:UIButtonTypeCustom ] ;
        button.frame = CGRectMake( 100 * i , 0 , 100 , 80 ) ;
        [ button sd_setImageWithURL: [ NSURL URLWithString: moderl.picUrl ] forState:UIControlStateNormal ] ;
        [ button addTarget: self action: @selector( buttonclick: ) forControlEvents:UIControlEventTouchUpInside] ;
        [ scrollview0 addSubview:button ] ;
        }
       scrollview0.delegate = self ;
       scrollview0.pagingEnabled = YES ;
       scrollview0.contentSize = CGSizeMake( 100 * arr.count , 0 ) ;
       return view ;
}
// 行高
- ( CGFloat )tableView:( UITableView * )tableView heightForRowAtIndexPath: ( NSIndexPath * )indexPath
    {
    if ( indexPath.section == 0)
    {
        return 200 ;
    } else if ( indexPath.section < self._namearray.count + 1 ) {
    if ( indexPath.row == 0)
    {
        return 80 ;
    } else if ( indexPath.row == 1 )
    {
        return 300 ;
    } else if ( indexPath.row == 2 )
    {
        return 150 ;
    }
    } else
    {
        return 300;
    }
       return 0;
    }
//区头高度
- ( CGFloat ) tableView:( UITableView * )tableView heightForHeaderInSection:( NSInteger )section
   {
   if ( section == 0 )
   {
        Wheight = 10 ;
        return 300 ;
    }
   else if ( section < self._namearray.count + 1 )
   {
       return 100 ;
   } else {
       return 30;
    }
    }
#pragma mark --- 设置区头数据
- ( UIView * ) tableView:( UITableView * )tableView viewForHeaderInSection:( NSInteger)section
    {

    if ( section == 0 )
    {
          return [ self greatetabviewcollverarray:self.datarray ] ;
    }else
    {
        if ( section < self._namearray.count + 1 )
        {
            return [ self getdataFromNet:section - 1 ] ;
        }else
        {
        if ( section == self._namearray.count + 1 ) {
                return [ self greatetopqu ] ;
            }
            return nil ;
        }
     return nil ;
        }
     }
#pragma mark ---设置尾部区头数据
- ( UIView * ) greatetopqu {
    UIView * view = [ [UIView alloc]initWithFrame:CGRectMake( 0 , 0 , kMainBoundsW , 30) ] ;
    NSArray * arr = @[ @"今日上新" ,@"上装" ,@"裙装" ,@"裤装" ] ;
    UISegmentedControl * segment = [ [UISegmentedControl alloc]initWithItems:arr ] ;
    segment.center = view.center ;
    segment.bounds = CGRectMake(0 , 0 , kMainBoundsW , 30 ) ;
    segment.tintColor = [UIColor magentaColor] ;
    segment.selectedSegmentIndex = 0 ;
    [ view addSubview:segment ] ;
    return view ;
}
#pragma mark ===设置六个区头的视图（中国馆....）
-( UIView * ) getdataFromNet : ( NSInteger ) section {
    tableviewModel * model = self._namearray [ section ] ;
        NSArray * arr = model.region_name ;
        NSMutableArray * arr0 = [ NSMutableArray array ] ;
        for ( NSDictionary * dic in arr ) {
            qitableviewmodel * modela = [ qitableviewmodel greatinitWithqimodelinfodata: dic ] ;
            [ arr0 addObject: modela ] ;
        }
        qitableviewmodel * modelb = arr0[ 0 ] ;
        UIButton * button = [UIButton buttonWithType: UIButtonTypeCustom] ;
        button.frame = CGRectMake( 0 ,  0 , 300 , 100 ) ;
        [ button sd_setImageWithURL: [ NSURL URLWithString: modelb.picUrl ] forState:UIControlStateNormal ] ;
        [ button addTarget: self action:@selector( qibutton: ) forControlEvents:UIControlEventTouchUpInside ] ;
        [ dataArr addObject: button ] ;
        return button ;
       }
- ( void ) qibutton:( UIButton * )sender
{

}
#pragma mark --- 尾部数据视图
- ( UIView * ) greatetbaseview:( NSInteger ) data {
        UIView * view = [ [ UIView alloc ]initWithFrame: CGRectMake( 0 , 0 , kMainBoundsW , 300 ) ] ;
        view.backgroundColor = [ UIColor whiteColor ] ;
        [ _scrollview addSubview: view ] ;
    for ( NSInteger j = 0 ; j < 2 ; j++ ) {
        BaseModel * model = self.basearray[ data * 2 ] ;
        UIButton * button = [ [ UIButton alloc ]initWithFrame: CGRectMake( ( kMainBoundsW/2 ) * ( j % 2 ) , 0 , kMainBoundsW/2 - 10 , 230 ) ] ;
        if ( j == 0 )
        {
            [ button sd_setImageWithURL:[ NSURL URLWithString: model.picUrl ] forState:UIControlStateNormal ] ;
            UILabel * lable = [ [ UILabel alloc ]initWithFrame: CGRectMake( ( kMainBoundsW/2 ) * ( j % 2 ) , button.frame.size.height , button.frame.size.width , view.frame.size.height - button.frame.size.height )] ;
            lable.text = [ NSString stringWithFormat:@"%@\n%@\n%@" , model.country,model.descriptiona , model.price ] ;
            lable.font = [ UIFont systemFontOfSize: 13 ] ;
            lable.numberOfLines = 0 ;
            [ view addSubview: lable ] ;
        } else if ( j == 1 )
        {
            if ( data < self.basearray.count/2)
            {
                BaseModel * model = self.basearray[2*data+1];
                [ button sd_setBackgroundImageWithURL:[ NSURL URLWithString:model.picUrl ] forState:UIControlStateNormal ] ;
                UILabel * lable = [ [ UILabel alloc ]initWithFrame: CGRectMake( ( kMainBoundsW/2 ) * ( j % 2 ) , button.frame.size.height , button.frame.size.width , view.frame.size.height - button.frame.size.height ) ] ;
                lable.text = [ NSString stringWithFormat:@"%@\n%@\n%@" , model.country, model.descriptiona , model.price ] ;
                lable.font = [ UIFont systemFontOfSize: 13 ] ;
                lable.numberOfLines = 0 ;
                [ view addSubview:lable ] ;
            }
            }
        
        [view addSubview:button];
            }
        return view;
            }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
