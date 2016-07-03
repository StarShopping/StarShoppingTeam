//
//  Tool.m
//  ShopingCar
//
//  Created by Mac on 16/7/2.
//  Copyright © 2016年 qiguohui. All rights reserved.
//

#import "Tool.h"
#import "AFNetworking.h"
#import "QiTopModel.h"
#import "tableviewModel.h"

@implementation Tool
+(void)initwithrequestdata:(void(^)(NSArray*arr))complay{
    AFHTTPSessionManager*mange = [AFHTTPSessionManager manager];
    mange.responseSerializer = [AFHTTPResponseSerializer serializer];
    mange.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    NSString*str = @"http://api-v2.mall.hichao.com/mall/banner?gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=5243F177-D4FD-4E4C-9B60-6E1E954CB1E2&gs=640x1136&gos=8.4&access_token=";
//    NSString*strdata = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
[mange GET:str parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    
    NSArray*array = dic[@"data"][@"items"];
  //  NSLog(@"%@",array);
    NSMutableArray*arr = [NSMutableArray array];
    for (NSDictionary*dictor in array) {
        QiTopModel*model = [QiTopModel greateinitwithstrTOPimageurl:dictor];
        [arr addObject:model];
    }
    if (complay) {
        complay(arr);
        
    }else{
    
        complay(nil);
    }
} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    NSLog(@"%@",error.localizedDescription);
    if (complay) {
        complay(nil);
    }
}];

}
//两个特价数据
+(void)initwithtejiadata:(void(^)(NSArray*arr))complay{
    AFHTTPSessionManager * manage = [AFHTTPSessionManager manager];
    manage.responseSerializer = [AFHTTPResponseSerializer serializer];
    manage.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSString*str = @"http://api-v2.mall.hichao.com/active/flash/list?gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=5243F177-D4FD-4E4C-9B60-6E1E954CB1E2&gs=640x1136&gos=8.4&access_token=";
    NSString*strdata = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [manage POST:strdata parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
       
        NSArray*arr = dic[@"response"][@"data"][@"items"];
   //      NSLog(@"====%@",arr);
        NSMutableArray*array = [NSMutableArray array];
        for (NSDictionary*dic in arr) {
            topimagemodel*modela = [topimagemodel greateinitwithimagetop:dic];
            [array addObject:modela];
      //      NSLog(@"=====%ld",array.count);
        }
        if (complay) {
            complay(array);
        }else{
            if (complay) {
                complay(nil);
            }
        
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.localizedDescription);
        if (complay) {
            complay(nil);
        }
    }];



}
//建立tableview上的数据请求
+(void)initwithgreateurl:(NSString*)str tableviewinfo:(void(^)(NSArray*arr))complay{
    AFHTTPSessionManager*mange = [AFHTTPSessionManager manager];
    mange.responseSerializer = [AFHTTPResponseSerializer serializer];
    mange.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [mange GET:str parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
       
        NSDictionary*dictor = dic[@"data"];
       // NSLog(@"------>>>%@",dic);
       
        NSMutableArray*array = [NSMutableArray array];
        
            tableviewModel*model = [tableviewModel greateinitWithtablemodelinfodata:dictor];
            [array addObject:model];
      //  NSLog(@"%ld",array.count);
        if (complay) {
            complay(array);
            
        }else{
            if (complay) {
                complay(nil);
            }
        
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.localizedDescription);
        if (complay) {
            complay(nil);
        }
    }];
    
    
    
    





}

@end
