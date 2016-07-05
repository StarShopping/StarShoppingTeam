//
//  MyselfVC.m
//  StarWardrobeDemo
//
//  Created by Mac on 16/7/3.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "MyselfVC.h"

@interface MyselfVC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MyselfVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [ self greatetableview ] ;
}
#pragma mark ---建立tableview表
- ( void ) greatetableview {
    UITableView * tableview = [ [ UITableView alloc]initWithFrame:[ UIScreen mainScreen].bounds style:UITableViewStyleGrouped ] ;
    tableview.delegate = self ;
    tableview.dataSource = self ;
    [ self.view addSubview: tableview ] ;

    [ tableview registerClass:[ UITableViewCell class ] forCellReuseIdentifier:@"cell" ] ;

}
#pragma mark ====设置区号；
- ( NSInteger )numberOfSectionsInTableView:(UITableView * )tableView {

    return 2;
}
#pragma mark ===== 设置行号；
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0)
    {
        return 3;
    }else
    {
       return 5;
    }

}
#pragma mark ----返回行高
- ( CGFloat )tableView:( UITableView *)tableView heightForRowAtIndexPath:( NSIndexPath * )indexPath {
    return 60 ;
}
#pragma mark-----画表cell
- ( UITableViewCell * ) tableView:( UITableView  * )tableView cellForRowAtIndexPath:( NSIndexPath * )indexPath {
    UITableViewCell * cell = [ tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath ] ;
//移除视图
    for ( UIView * view in cell.contentView.subviews ) {
        [ view removeFromSuperview ] ;
    }
    //整理数据
    NSArray * arry = @[@"icon_my_payment@2x",@"icon_my_send@3x",@"icon_my_collect@2x",@"icon_my_pingjia@3x",@"icon_my_return@3x"] ;
    NSArray * datarray = @[@"待付款",@"待发货",@"待收货",@"待评价",@"退款/退货"] ;
    //整理第一区数据
    if ( indexPath.section == 0 ) {
        if ( indexPath.row == 0 ) {
            NSArray * arr = @[@"120",@"300",@"20"] ;
            UIView * view = [self greateviewcelloncearray:arr] ;
            [cell.contentView addSubview:view];
        } else if ( indexPath.row == 1 ) {
            UILabel * lable = [ [ UILabel alloc]initWithFrame:cell.contentView.frame ] ;
            lable.text = @"明星衣橱订单" ;
            [ cell.contentView addSubview:lable ] ;
            
        } else if ( indexPath.section == 0 && indexPath.row == 2 )
        {
            UIView * view = [ self topviewthirdview:arry withar:datarray ] ;
            [ cell.contentView addSubview:view ] ;
        }
    }
   else
   {
     //第二区数据
        NSArray * array = @[@"我的收货地址",@"我收藏",@"我的发帖",@"帮助与反馈",@"明星衣橱客服：400-650-6468"];
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
       
        button.frame = cell.contentView.frame ;
        [button setTitle:[NSString stringWithFormat:@"%@",[array objectAtIndex:indexPath.row]] forState:UIControlStateNormal] ;
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.titleEdgeInsets = UIEdgeInsetsMake(20, 20, 0, 0) ;
        [button addTarget:self action:@selector(forbutton:) forControlEvents:UIControlEventTouchUpInside] ;
       button.tag = indexPath.row + 50 ;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal] ;
        [cell.contentView addSubview:button] ;
        
   }
    return cell ;

}
#pragma mark ====我的收货地址点击事件
- (void) forbutton:(UIButton * ) sender {

    NSLog( @"%ld", sender.tag - 50 ) ;

}
#pragma mark ---关注人导航创建
- ( UIView * ) greateviewcelloncearray:( NSArray * ) arr
{
 
     UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, 60)];
    for ( NSInteger j = 0 ; j < 3; j++ )
    {
        
         UIButton*button = [ UIButton buttonWithType:UIButtonTypeCustom ];
        button.frame = CGRectMake( ( kMainBoundsW/3 ) * j , 0 , kMainBoundsW/3 , 60 ) ;
        if ( j == 0 )
        {
             [ button setTitle:[NSString stringWithFormat:@"%@\n关注的人",[arr objectAtIndex:j]] forState:UIControlStateNormal ] ;
        }else if ( j == 1 )
        {
        
        [button setTitle:[NSString stringWithFormat:@"%@\n 我的粉丝",[arr objectAtIndex:j]] forState:UIControlStateNormal];
        } else
        {
        [button setTitle:[NSString stringWithFormat:@"%@\n 关注的品牌",[arr objectAtIndex:j]] forState:UIControlStateNormal];
        }
        [button addTarget:self action:@selector(topbutton:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = j+20;
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.titleLabel.numberOfLines = 0 ;
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [view addSubview:button] ;
       
    }
   
    return view;
    }
#pragma mark ----关注点击事件
- ( void ) topbutton:( UIButton * ) sender
{

    NSLog(@"%ld",sender.tag-20);

}
#pragma mark ----- 待收货导航建立
- ( UIView * ) topviewthirdview:( NSArray * ) array withar: ( NSArray * ) datarray {
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake( 0 , 0 , kMainBoundsW , 60)];

   
    for ( NSInteger j = 0 ; j < array.count ; j++ )
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom] ;
        button.frame = CGRectMake((kMainBoundsW/array.count) * j , 0 , kMainBoundsW/array.count , 60 ) ;
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[array objectAtIndex:j]]] forState:UIControlStateNormal] ;
        [button.layer setBorderColor:[UIColor lightGrayColor].CGColor];
        [button.layer setBorderWidth:1];
        [button.layer setMasksToBounds:YES];
        [button setTitle:[NSString stringWithFormat:@"%@",[datarray objectAtIndex:j]] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(daifukuan:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = j+1;
            CGFloat buttonHeight = CGRectGetHeight(button.bounds);
            CGFloat buttonWidth = CGRectGetWidth(button.bounds);
            CGFloat buttonLableWidth = CGRectGetWidth(button.titleLabel.bounds);
            CGFloat buttonImageWidth = CGRectGetWidth(button.imageView.bounds);
            UIEdgeInsets edge = UIEdgeInsetsMake(5,(buttonWidth-buttonImageWidth)/2, 21, (buttonWidth - buttonImageWidth)/2);
            button.imageEdgeInsets = edge;
            
            button.titleEdgeInsets = UIEdgeInsetsMake(buttonHeight-edge.bottom, -(buttonWidth - buttonLableWidth)/2+20, 10, 0);
            [view addSubview:button];
        }

return view;
}
#pragma mark ----待付款触发事件
- ( void ) daifukuan:( UIButton * )sender
{
    NSLog(@"%ld",sender.tag-1);
}
#pragma mark === 设置区头
- ( UIView * )tableView:( UITableView * )tableView viewForHeaderInSection:( NSInteger )section
{
    UIView * view = [[ UIView alloc]init];
    if ( section == 0)
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom] ;
        button.center = CGPointMake(kMainBoundsW/2 , 100 ) ;
        button.bounds = CGRectMake(0, 0, 100, 100);
       [button setBackgroundImage:[UIImage imageNamed:@"0001"] forState:UIControlStateNormal];
         button.layer.cornerRadius = 50;
        button.clipsToBounds = YES;
        [button addTarget:self action:@selector( buttonclick ) forControlEvents:UIControlEventTouchUpInside ];
        [view addSubview:button];
        UILabel * lable = [[UILabel alloc ]init];
        lable.center = CGPointMake(kMainBoundsW/2, button.frame.size.height+button.frame.origin.y+10);
        lable.bounds = CGRectMake(0, 0, 200, 60);
        _labletext=@"13613891401";
        lable.text = [NSString stringWithFormat:@"%@\n会员等级",_labletext];
        lable.numberOfLines = 0;
        lable.textAlignment = NSTextAlignmentCenter;
        [view addSubview:lable];
    }else
    {
        UILabel * lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, 40)];
        lable.text = @"我的福利";
        [view addSubview:lable];
    
        for ( NSInteger j = 0 ; j < 3 ; j ++ )
        {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake((kMainBoundsW/3)*j, 40, kMainBoundsW/3, 100);
            button.backgroundColor = [UIColor whiteColor];
            [button.layer setBorderColor:[UIColor lightGrayColor].CGColor];
            [button.layer setBorderWidth:1];
            [button.layer setMasksToBounds:YES];
         if ( j == 0 )
            {
                [button setImage:[UIImage imageNamed:@"icon_my_vip@2x.png"] forState:UIControlStateNormal];
                [button setTitle:@"会员专区" forState:UIControlStateNormal];
           }else if (j==1)
           {
                [button setImage:[UIImage imageNamed:@"icon_my_coupon@3x.png"] forState:UIControlStateNormal];
                [button setTitle:@"优惠券" forState:UIControlStateNormal];
            
            }else
            {
                [button setImage:[UIImage imageNamed:@"icon_my_red@2x.png"] forState:UIControlStateNormal];
                [button setTitle:@"我的红包" forState:UIControlStateNormal];
            
            }
            
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            [button addTarget:self action:@selector(top:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = j + 10 ;
            
            CGFloat buttonHeight = CGRectGetHeight(button.bounds);
            CGFloat buttonWidth = CGRectGetWidth(button.bounds);
            CGFloat buttonLableWidth = CGRectGetWidth(button.titleLabel.bounds);
            CGFloat buttonImageWidth = CGRectGetWidth(button.imageView.bounds);
            UIEdgeInsets edge = UIEdgeInsetsMake(5,(buttonWidth-buttonImageWidth)/2, 21, (buttonWidth - buttonImageWidth)/2);
            button.imageEdgeInsets = edge;
            
            button.titleEdgeInsets = UIEdgeInsetsMake(buttonHeight-edge.bottom, -(buttonWidth - buttonLableWidth)/2+20, 10, 0);
            [view addSubview:button];
        }
    
    
    }
    
        return view;
    
}
#pragma mark -----第二个区头执行事件

-(void)top:(UIButton*)sender{
    NSLog(@"%ld",(long)sender.tag-10);

}
#pragma mark ---- 区头执行事件
-(void)buttonclick{
    KSLog(@"321");

}
#pragma mark ====区头高度
- ( CGFloat ) tableView:( UITableView * )tableView heightForHeaderInSection:( NSInteger )section
{
    if ( section == 0 )
    {
       
        return 200 ;
    }
    else
    {
        return 140 ;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
