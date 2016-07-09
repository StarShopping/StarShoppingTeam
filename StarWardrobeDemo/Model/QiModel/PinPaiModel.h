//
//  PinPaiModel.h
//  StarWardrobeDemo
//
//  Created by Mac on 16/7/8.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PinPaiXiaoModel;

@interface PinPaiModel : NSObject
@property(nonatomic,copy)NSString*cateimg;
@property(nonatomic,strong)NSMutableArray * items;

-(instancetype)initwithmodeldata:(NSDictionary*)dic;
+(instancetype)greateinitwithmodeldata:(NSDictionary*)dic;


@end
@interface PinPaiXiaoModel : NSObject
@property(nonatomic,copy)NSString*picUrl;
@property(nonatomic,copy)NSString*word;
- (instancetype)initwithxiaomodeldata:(NSDictionary*)dic;
+(instancetype)greateinitwithxiaomodeldata:(NSDictionary*)dic;

@end
