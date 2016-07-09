//
//  PinPaiModel.m
//  StarWardrobeDemo
//
//  Created by Mac on 16/7/8.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "PinPaiModel.h"

@implementation PinPaiModel
-(instancetype)initwithmodeldata:(NSDictionary*)dic{
    self.cateimg = dic[@"component"][@"cateimg"];
    
    NSMutableArray * arr = dic[@"component"][@"items"];
    
    self.items = [NSMutableArray array];
    for (NSDictionary * dic in arr) {
        PinPaiXiaoModel * model = [PinPaiXiaoModel greateinitwithxiaomodeldata:dic];
        [self.items addObject:model];
    }
   
    return self;

}
+(instancetype)greateinitwithmodeldata:(NSDictionary*)dic{


    return [[self alloc]initwithmodeldata:dic];

}

@end
@implementation PinPaiXiaoModel

- (instancetype)initwithxiaomodeldata:(NSDictionary*)dic{
    self.picUrl = dic[@"component"][@"picUrl"];
    self.word = dic[@"component"][@"word"];
    return self;

}
+(instancetype)greateinitwithxiaomodeldata:(NSDictionary*)dic{
    return [[self alloc]initwithxiaomodeldata:dic];

}

@end