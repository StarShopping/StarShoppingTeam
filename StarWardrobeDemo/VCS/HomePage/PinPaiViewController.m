//
//  PinPaiViewController.m
//  StarWardrobeDemo
//
//  Created by Mac on 16/7/8.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "PinPaiViewController.h"
#import "Tool.h"
#import "PinLeiModel.h"
#import "UIButton+WebCache.h"

@interface PinPaiViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,retain)NSMutableArray*datarray;

@end

@implementation PinPaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    self.datarray = [NSMutableArray array];
    [Tool greatpinleiinfodata:^(NSArray *arr) {
        [self.datarray addObjectsFromArray:arr];
         [self greatecollview];
        
    }];
}
-(void)greatecollview{

    UICollectionViewFlowLayout*layou = [UICollectionViewFlowLayout new];
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
    PinLeiModel*mode = self.datarray[section];
    return mode.arr.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return self.datarray.count;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{UICollectionViewCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    for (UIView*view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
     button.frame = CGRectMake(0, 0, 80, 80);
    PinLeiModel*mode = self.datarray[indexPath.section];
    PinLeiXiaoModel*model = mode.arr[indexPath.row];
    
   
    [button sd_setImageWithURL:[NSURL URLWithString:model.picUrl] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = indexPath.row+1000;
    [cell.contentView addSubview:button];
    
    return cell;


}
-(void)buttonclick:(UIButton*)sender{
    NSLog(@"%ld",sender.tag);

}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake(80, 80);

}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

    return CGSizeMake(kMainBoundsW, 50);
}
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView * view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
    for (UIView*viewa in view.subviews) {
        [viewa removeFromSuperview];
    }
   
    UILabel*lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, 50)];
     PinLeiModel*model = self.datarray[indexPath.section];
    lable.text = [NSString stringWithFormat:@"%@",model.title];
    
   
    [view addSubview:lable];
    
    return view;
    
    


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
