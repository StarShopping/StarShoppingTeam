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
#import "BaseModel.h"
#import "PinPaiModel.h"
#import "PinLeiModel.h"

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
+(void)initWithGreateurl:(NSString*)str tableviewinfo:(void(^)(NSArray*arr))complay{
    AFHTTPSessionManager*mange = [AFHTTPSessionManager manager];
    
    mange.responseSerializer = [AFHTTPResponseSerializer serializer];
    mange.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [mange GET:str parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
       
        NSDictionary*dictor = dic[@"data"];
        NSLog(@"------>>>%@",dic);
       
        NSMutableArray*array = [NSMutableArray array];
        
            tableviewModel*model = [tableviewModel greateinitWithtablemodelinfodata:dictor];
            [array addObject:model];
       NSLog(@"====%ld",array.count);
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
+(void)greatetableviewinfor:(void(^)(NSArray*arr))complay{
    NSLog(@">>>>>>>>>>");
    AFHTTPSessionManager*mange = [AFHTTPSessionManager manager];
    mange.responseSerializer = [AFHTTPResponseSerializer serializer];
    mange.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    NSString*str = @"http://api-v2.mall.hichao.com/sku/list?ga=%2Fsku%2Flist&flag=&more_items=1&type=selection";
    [mange GET:str parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
       
        NSArray*arr = dic[@"data"][@"items"];
         NSLog(@"====bing=%@",arr);
        NSMutableArray*array = [NSMutableArray array];
        for (NSDictionary*dictor in arr) {
            BaseModel*model = [BaseModel greateinitWithbasedatainfodiction:dictor];
            [array addObject:model];
            
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
+(void)greatepinpaiviewinfo:(void(^)(NSArray*arr))complay{
    AFHTTPSessionManager * mange = [AFHTTPSessionManager manager];
    mange.responseSerializer = [AFHTTPResponseSerializer serializer];
    mange.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
[mange GET:@"http://api-v2.mall.hichao.com/category/list?gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=5243F177-D4FD-4E4C-9B60-6E1E954CB1E2&gs=640x1136&gos=8.4&access_token=2fuXENgNoun4DcuCyG9NIeJqnxSWtuQxRgJpmSF_GeU" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
    NSDictionary*dic= [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    NSLog(@">>>>>>>>qi>>>%@",dic);
    NSArray*arr = dic[@"data"][@"items"];
    NSMutableArray * array = [NSMutableArray array];
    for (NSDictionary*dict in arr) {
        PinPaiModel*model = [PinPaiModel greateinitwithmodeldata:dict];
        [array addObject:model];
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
+(void)greatpinleiinfodata:(void(^)(NSArray*arr))complay{
    AFHTTPSessionManager * mange = [AFHTTPSessionManager manager];
    mange.responseSerializer = [AFHTTPResponseSerializer serializer];
    mange.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [mange GET:@"http://api-v2.mall.hichao.com/region/brands/list?gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=5243F177-D4FD-4E4C-9B60-6E1E954CB1E2&gs=640x1136&gos=8.4&access_token=2fuXENgNoun4DcuCyG9NIeJqnxSWtuQxRgJpmSF_GeU" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@">>qi>>%@",dic);
        NSArray*arr = dic[@"data"][@"items"];
        NSMutableArray * array = [NSMutableArray array];
        for (NSDictionary*dic in arr) {
            PinLeiModel*mode = [PinLeiModel greateinitwithgreatepinleimodeldata:dic];
            [array addObject:mode];
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

@end
