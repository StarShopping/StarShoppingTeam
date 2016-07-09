//
//  PinLeiModel.m
//  StarWardrobeDemo
//
//  Created by Mac on 16/7/8.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "PinLeiModel.h"

@implementation PinLeiModel
-(instancetype)initwithgreatepinleimodeldata:(NSDictionary*)dic{
    self.title = dic[@"component"][@"title"];
    self.picUrl = dic[@"component"][@"picUrl"];
    NSMutableArray * array = dic[@"component"][@"items"];
    self.arr = [NSMutableArray array];
    for (NSDictionary*dict in array) {
        PinLeiXiaoModel* mode = [PinLeiXiaoModel greateinitwithinfodata:dict];
        [self.arr addObject:mode];
    }
    return self;

}
+(instancetype)greateinitwithgreatepinleimodeldata:(NSDictionary*)dic{
    return [[self alloc]initwithgreatepinleimodeldata:dic];

}

@end
@implementation PinLeiXiaoModel

-(instancetype)initwithinfodata:(NSDictionary*)dic{
    self.picUrl = dic[@"component"][@"picUrl"];
    return self;

}
+(instancetype)greateinitwithinfodata:(NSDictionary*)dic{

    return [[self alloc]initwithinfodata:dic];
}

@end
