//
//  BaseModel.m
//  StarWardrobeDemo
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
-(instancetype)initWithbasedatainfodiction:(NSDictionary*)dic{
    self = [super init];
    if (self) {
        self.picUrl =dic[@"component"][@"picUrl"];
        self.descriptiona = dic[@"component"][@"description"];
        self.country=dic[@"component"][@"country"];
        self.price=dic[@"component"][@"price"];
        self.width = dic[@"width"];
        self.height = dic[@"height"];
    }
    
    return self;


}
+(instancetype)greateinitWithbasedatainfodiction:(NSDictionary*)dic{

    return [[self alloc]initWithbasedatainfodiction:dic];

}

@end
