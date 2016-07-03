//
//  QiTopModel.h
//  ShopingCar
//
//  Created by Mac on 16/7/2.
//  Copyright © 2016年 qiguohui. All rights reserved.
//

#import <Foundation/Foundation.h>
@class topimagemodel;

@interface QiTopModel : NSObject
@property(nonatomic,copy)NSString*picUrl;
@property(nonatomic,copy)NSString*title;
@property(nonatomic,assign)NSInteger width;
@property(nonatomic,assign)NSInteger height;

-(instancetype)initwithstrTOPimageurl:(NSDictionary*)dic;
+(instancetype)greateinitwithstrTOPimageurl:(NSDictionary*)dic;

@end
@interface topimagemodel : NSObject
@property(nonatomic,copy)NSString *img_index;
-(instancetype)initwithimagetop:(NSDictionary*)dic;
+(instancetype)greateinitwithimagetop:(NSDictionary*)dic;

@end
