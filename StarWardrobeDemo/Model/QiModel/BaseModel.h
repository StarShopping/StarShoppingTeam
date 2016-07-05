//
//  BaseModel.h
//  StarWardrobeDemo
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
@property(nonatomic,copy)NSString*picUrl;
@property(nonatomic,copy)NSString*price;
@property(nonatomic,copy)NSString*descriptiona;
@property(nonatomic,copy)NSString*country;
@property(nonatomic,copy)NSString*width;
@property(nonatomic,copy)NSString*height;
-(instancetype)initWithbasedatainfodiction:(NSDictionary*)dic;
+(instancetype)greateinitWithbasedatainfodiction:(NSDictionary*)dic;


@end
