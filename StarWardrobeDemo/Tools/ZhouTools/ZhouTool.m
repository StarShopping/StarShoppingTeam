//
//  ZhouTool.m
//  StarWardrobeDemo
//
//  Created by Mac on 16/7/3.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "ZhouTool.h"
#import "Reachability.h"
@implementation ZhouTool
+(BOOL)havewifi{
    Reachability * reach=[Reachability reachabilityWithHostName:@"http://www.apple.com"];
    
    if ([reach currentReachabilityStatus]==NotReachable) {
        return  NO;
    }else{
        return YES;
    }
    
    
    
    
    
    
}

@end
