//
//  PinLeiModel.h
//  StarWardrobeDemo
//
//  Created by Mac on 16/7/8.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PinLeiXiaoModel;

@interface PinLeiModel : NSObject
@property(nonatomic,copy)NSString * title ;
@property(nonatomic,copy)NSString * picUrl;
@property(nonatomic,strong)NSMutableArray*arr;
-(instancetype)initwithgreatepinleimodeldata:(NSDictionary*)dic;
+(instancetype)greateinitwithgreatepinleimodeldata:(NSDictionary*)dic;

@end
@interface PinLeiXiaoModel : NSObject

@property(nonatomic,copy)NSString*picUrl;
-(instancetype)initwithinfodata:(NSDictionary*)dic;
+(instancetype)greateinitwithinfodata:(NSDictionary*)dic;
@end
