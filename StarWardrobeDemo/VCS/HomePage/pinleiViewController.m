//
//  pinleiViewController.m
//  StarWardrobeDemo
//
//  Created by Mac on 16/7/8.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "pinleiViewController.h"
#import "Tool.h"
#import "UIButton+WebCache.h"
#import "PinPaiModel.h"

@interface pinleiViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,retain)NSMutableArray*datarray;
@property(nonatomic,retain)NSMutableArray * array;

@end

@implementation pinleiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.datarray = [NSMutableArray array];
    [Tool greatepinpaiviewinfo:^(NSArray *arr) {
        [self.datarray addObjectsFromArray:arr];
        [self greatecolltionview];
        NSLog(@"------%ld",arr.count);
    }];
}
-(void)greatecolltionview{
    UICollectionViewFlowLayout * layou = [UICollectionViewFlowLayout new];
    layou.scrollDirection = UICollectionViewScrollDirectionVertical;
    UICollectionView * collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 130, kMainBoundsW, kMainBoundsH-130) collectionViewLayout:layou];
    collection.backgroundColor = [UIColor whiteColor];
    collection.delegate = self;
    collection.dataSource = self;
    [self.view addSubview:collection];
    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    PinPaiModel*model = self.datarray[section];
    NSLog(@"----%ld", model.items.count);
    return model.items.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.datarray.count;

}
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    

    UICollectionViewCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    for (UIView*view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    PinPaiModel*model = self.datarray[indexPath.section];
    UIView*view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 80, 150)];
    
    PinPaiXiaoModel*mode = model.items[indexPath.row];
   
        NSLog(@"%@",mode.picUrl);
        UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 80, 100);
            [button sd_setImageWithURL:[NSURL URLWithString:mode.picUrl] forState:UIControlStateNormal];
        [view addSubview:button];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 80, 50)];
    lable.text = [NSString stringWithFormat:@"%@",mode.word];
    lable.textAlignment = NSTextAlignmentCenter;
    [view addSubview:lable];
    [cell.contentView addSubview:view];
    
    
   
    return cell;

}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{


    return CGSizeMake(80, 150);
}
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    PinPaiModel * modela = self.datarray[indexPath.section];
    UICollectionReusableView * view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
    view.backgroundColor = [UIColor yellowColor];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, kMainBoundsW, 200);
    [button sd_setImageWithURL:[NSURL URLWithString:modela.cateimg] forState:UIControlStateNormal];
    button.tag=indexPath.section+10;
    [button addTarget:self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];
       [view addSubview:button];
    
    return view;

}

-(void)buttonclick:(UIButton*)sender{

    NSLog(@"%ld",sender.tag-10);

}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(200, 200);

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
