//
//  textTool.m
//  StarWardrobeDemo
//
//  Created by Mac on 16/7/6.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "textTool.h"

@implementation textTool
+(UITextField*)initwithgreatetextfieldnew{
        UITextField * textfield = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
        textfield.contentMode = UIViewContentModeScaleAspectFit;
        textfield.borderColor =[UIColor blackColor];
        textfield.borderWidth=1;
        textfield.layer.cornerRadius = 5;
        textfield.clipsToBounds = YES;
       textfield.placeholder = @"单品/品牌/红人";
        [textfield setPlaceholder:@"单品/品牌/红人"];
        
    return textfield;

}

@end
