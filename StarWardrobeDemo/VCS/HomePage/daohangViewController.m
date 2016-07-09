//
//  daohangViewController.m
//  StarWardrobeDemo
//
//  Created by Mac on 16/7/6.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "daohangViewController.h"
#import "textTool.h"

@interface daohangViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UILabel*lable;
    NSInteger selectBtn;
    NSMutableArray * btnArr;
  
    

}

@end

@implementation daohangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UITextField *textfield = [textTool initwithgreatetextfieldnew];
    self.navigationItem.titleView = textfield;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ali_feedback_common_back_btn_normal"] style:UIBarButtonItemStylePlain target:self action:@selector(buttinin)];
    selectBtn = 0;

  
    btnArr = [NSMutableArray array];
    

    
    [self greattableview];

   }
-(void)buttinin{
    [self.navigationController popToRootViewControllerAnimated:YES];


}
-(void)greattableview{


    NSArray* arr = @[@"单品",@"搭配",@"帖子",@"红人"];
    for (NSInteger j = 0; j<4; j++) {
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
       
        button.frame = CGRectMake((kMainBoundsW/4)*j, 70, kMainBoundsW/4, 50);
        [button setTitle:[NSString stringWithFormat:@"%@",[arr objectAtIndex:j]] forState:UIControlStateNormal];
        
        
            [button addTarget:self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];
       
        
        button.tag =j+10;
       
        if (selectBtn == j) {
             [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            
        }else{
        
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
        
        }
        
        
        [btnArr addObject:button];
        
        
        [self.view addSubview:button];
        
      }
   lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 120, kMainBoundsW/4, 5)];
    lable.backgroundColor = [UIColor redColor];
    [self.view addSubview:lable];

    [self greatetableview];
}
-(void)buttonclick:(UIButton*)sender{
    
    selectBtn = sender.tag - 10;
    for (UIButton * btn in btnArr) {
        if (btn.tag-10 == selectBtn) {
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            
        }else{
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
        }
    }
    
    
    [UIView animateWithDuration:0.3 animations:^{
        lable.frame = CGRectMake(sender.frame.origin.x,120, kMainBoundsW/4, 5);}];
    
    
    
    NSLog(@"%ld",sender.tag-10);
    
}

- (void)greatetableview{
//    UITableView * tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, lable.frame.origin.y+10, kMainBoundsW, kMainBoundsH-lable.frame.origin.y-10)];
    UITableView * tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, lable.frame.origin.y+10, kMainBoundsW, kMainBoundsH-lable.frame.origin.y-10) style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    [tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];


}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section ==0) {
        return 1;
    }else{
     return 10;
    }
   
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray*array = @[@"伊芙丽",@"T恤",@"AMLL",@"防嗮",@"牛仔裤",@"半身裙",@"连衣裙",@"休闲",@"面膜",@"寸衫"];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.section==0 && indexPath.row == 0) {
      
        
        for (NSInteger j = 0; j < 10 ; j++) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(20+(kMainBoundsW/5+10)*(j%4), 10+(10+30)*(j/4), kMainBoundsW/5-20, 30);
            [button setTitle:[NSString stringWithFormat:@"%@",[array objectAtIndex:j]] forState:UIControlStateNormal];
            button.backgroundColor = [UIColor lightGrayColor];
            [button addTarget:self action:@selector(recituijian:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = j+10;
            
            [cell.contentView addSubview:button];
        }
    }
    
    
    
   
    
    return cell;

}
- (void)recituijian:(UIButton *)sender {

    NSLog(@"%ld",sender.tag-10);

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 150;
    }else{
    
        return 50;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 50;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel*lableo = [[UILabel alloc]init];
    lableo.backgroundColor = [UIColor whiteColor];
    if (section ==0) {
        lableo.text = @"热词推荐:";
    }else{
    
    lableo.text = @"查找历史:";
    }
    
    return lableo;

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
