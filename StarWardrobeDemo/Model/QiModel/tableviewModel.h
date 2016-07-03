//
//  tableviewModel.h
//  ShopingCar
//
//  Created by Mac on 16/7/3.
//  Copyright © 2016年 qiguohui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class qitableviewmodel;

@interface tableviewModel : NSObject

@property(nonatomic,retain)NSArray*region_brands;
@property(nonatomic,retain)NSArray*region_name;
@property(nonatomic,retain)NSArray*region_pictures;
@property(nonatomic,retain)NSArray*region_skus;
@property (nonatomic,retain) qitableviewmodel * namemodel;
@property(nonatomic,retain) qitableviewmodel* brandsmodel;
@property(nonatomic,retain) qitableviewmodel* region_picturesmodel;
@property(nonatomic,retain) qitableviewmodel* region_skusmodel;

-(instancetype)initWithtablemodelinfodata:(NSDictionary*)dic;
+(instancetype)greateinitWithtablemodelinfodata:(NSDictionary*)dic;

@end
@interface qitableviewmodel : NSObject
@property(nonatomic,copy)NSString*picUrl;
@property(nonatomic,assign)NSInteger width;
@property(nonatomic,assign)NSInteger height;
-(instancetype)initWithqimodelinfodata:(NSDictionary*)dic;
+(instancetype)greatinitWithqimodelinfodata:(NSDictionary*)dic;



@end
