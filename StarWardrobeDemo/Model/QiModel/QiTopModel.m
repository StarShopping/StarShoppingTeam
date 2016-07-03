//
//  QiTopModel.m
//  ShopingCar
//
//  Created by Mac on 16/7/2.
//  Copyright © 2016年 qiguohui. All rights reserved.
//

#import "QiTopModel.h"

@implementation QiTopModel
-(instancetype)initwithstrTOPimageurl:(NSDictionary*)dic{
    self.picUrl=dic[@"component"][@"picUrl"];
    self.title=dic[@"component"][@"title"];
    self.width=[dic[@"component"][@"width"] integerValue];
    self.height=[dic[@"component"][@"height"] integerValue];
    return self;


}
+(instancetype)greateinitwithstrTOPimageurl:(NSDictionary*)dic{
    return [[self alloc]initwithstrTOPimageurl:dic];

}

@end
@implementation topimagemodel

-(instancetype)initwithimagetop:(NSDictionary*)dic{
    self.img_index = dic[@"component"][@"img_index"];

    return self;
}
+(instancetype)greateinitwithimagetop:(NSDictionary*)dic{
    return [[self alloc]initwithimagetop:dic];


}

@end
