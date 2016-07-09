//
//  tableviewModel.m
//  ShopingCar
//
//  Created by Mac on 16/7/3.
//  Copyright © 2016年 qiguohui. All rights reserved.
//

#import "tableviewModel.h"

@implementation tableviewModel
- (instancetype)initWithtablemodelinfodata:(NSDictionary*)dic{
//    if (self=[super init]) {
//        
//    
//        self.region_name =dic[@"region_name"];
//        for (NSDictionary * dic0 in self.region_name) {
//            [qitableviewmodel greatinitWithqimodelinfodata:dic0];
//        }
//        
//        
//        self.region_brands = dic[@"region_brands"];
//        for (NSDictionary * dic1 in  self.region_brands) {
//            [qitableviewmodel greatinitWithqimodelinfodata:dic1];
//        }
//        
//        self.region_pictures = dic[@"region_pictures"];
//        for (NSDictionary * dic2 in  self.region_pictures) {
//            [qitableviewmodel greatinitWithqimodelinfodata:dic2];
//        }
//        self.region_skus = dic[@"region_skus"];
//        
//        for (NSDictionary * dic3 in  self.region_skus) {
//            [qitableviewmodel greatinitWithqimodelinfodata:dic3];
//        }
//        }
//
    
    [self setValuesForKeysWithDictionary:dic];
      return self;
  



}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

//-(void)setValue:(id)value forKey:(NSString *)key{
//    
//    if ([key isEqualToString:@"region_name"]) {
//        for (NSDictionary * dic0 in value) {
//            
//            self.region_name = value;
//            self.namemodel =[qitableviewmodel greatinitWithqimodelinfodata:dic0];
//            
//        }
//
//    }else if ([key isEqualToString:@"region_brands"]){
//        self.region_brands = value;
//    for (NSDictionary * dic1 in  value) {
//    self.brandsmodel=[qitableviewmodel greatinitWithqimodelinfodata:dic1];
//        }
//
//    }else if ([key isEqualToString:@"region_pictures"]){
//        self.region_pictures = value;
//        for (NSDictionary * dic2 in  value) {
//       self.region_picturesmodel= [qitableviewmodel greatinitWithqimodelinfodata:dic2];
//        }
//        
//    }else if([key isEqualToString:@"region_skus"]){
//        self.region_skus = value;
//        for (NSDictionary * dic3 in  value) {
//            self.region_skusmodel=[qitableviewmodel greatinitWithqimodelinfodata:dic3];
//        }
//        
//    }else{
//        
//        [super setValue:value forKey:key];
//    }
//}


+(instancetype)greateinitWithtablemodelinfodata:(NSDictionary*)dic{
    return [[self alloc]initWithtablemodelinfodata:dic];


}

@end
@implementation qitableviewmodel

-(instancetype)initWithqimodelinfodata:(NSDictionary*)dic{
    
    self.picUrl = dic[@"component"][@"picUrl"];
    self.height = [dic[@"height"]integerValue];
    self.width = [dic[@"width"]integerValue];
    self.price = dic[@"component"][@"price"];
    self.title = dic[@"component"][@"title"];
   // [self setValuesForKeysWithDictionary:dic];
  
    return self;
}



+(instancetype)greatinitWithqimodelinfodata:(NSDictionary*)dic{

    return  [[self alloc]initWithqimodelinfodata:dic];
}

@end
