//
//  ITIntroductionVC.m
//  ChatProject
//
//  Created by Box on 15/9/30.
//  Copyright (c) 2015年 Box. All rights reserved.
//

#import "ITIntroductionVC.h"
#import "ZhouTool.h"
#import "NetRequestClass.h"
@interface ITIntroductionVC ()

@end

@implementation ITIntroductionVC

- (void)dealloc {
    self.block = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView * bgImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1024-768-1-1.jpg"]];
    bgImage.frame = kMainBounds;
    
   UIImageView * introduceImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1136-640-3.png"]];
    introduceImage.frame = kMainBounds;
    [self.view addSubview:bgImage];
    [self.view addSubview:introduceImage];

    
    
    if ([ZhouTool havewifi]) {
        [NetRequestClass netRequestGETWithRequestURL:@"http://api-v2.mall.hichao.com/app/splash?gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=27C3F6CE-7F12-493C-813C-DD71A58525A7&gs=640x1136&gos=9.2.1&access_token=" WithParameter:nil WithReturnValeuBlock:^(id responseObject, NSError *error) {
            NSDictionary * dic =responseObject[@"data"];
            if (!dic) {
                NSLog(@"没有广告页");
                [self.view addSubview:bgImage];
                [self.view addSubview:introduceImage];
            }else {
                
                NSLog(@"%@",dic);
                
            }
        }];
    }else{
        
        NSLog(@"没有网络");
        [self.view addSubview:bgImage];
        [self.view addSubview:introduceImage];
    }
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(enter) userInfo:nil repeats:NO];
    
    
}

- (void)enterRootVC:(DidSelectedEnter)newBlock {
    self.block = newBlock;
}

#pragma mark - 进入主界面
- (void)enter {
    self.block();
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
