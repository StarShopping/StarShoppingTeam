//
//  Tool.h
//  ShopingCar
//
//  Created by Mac on 16/7/2.
//  Copyright © 2016年 qiguohui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tool : NSObject
//scrollview 头数据
+(void)initwithrequestdata:(void(^)(NSArray*arr))complay;
//两个特价数据
+(void)initwithtejiadata:(void(^)(NSArray*arr))complay;
//建立tableview上的数据请求
+(void)initwithgreateurl:(NSString*)str tableviewinfo:(void(^)(NSArray*arr))complay;

@end
