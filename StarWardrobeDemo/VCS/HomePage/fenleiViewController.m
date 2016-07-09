//
//  fenleiViewController.m
//  StarWardrobeDemo
//
//  Created by Mac on 16/7/8.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "fenleiViewController.h"
#import "PinPaiViewController.h"
#import "pinleiViewController.h"

@interface fenleiViewController ()
{
    UILabel*lable;
    NSInteger buttonsele;
    NSMutableArray * butarr;
    UIViewController * vc;

}
@property(nonatomic,retain)UIView *myview;

@end

@implementation fenleiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    butarr = [NSMutableArray array];
    buttonsele = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    UIView*view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, 44)];
    
    UITextField * textfield = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    textfield.contentMode = UIViewContentModeScaleAspectFit;
    textfield.borderColor =[UIColor blackColor];
    textfield.borderWidth=1;
    textfield.layer.cornerRadius = 5;
    textfield.clipsToBounds = YES;
    textfield.placeholder = @"伊芙丽";
    [textfield setPlaceholder:@"伊芙丽"];
    [view addSubview:textfield];
self.navigationItem.titleView = view;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ali_feedback_common_back_btn_normal"] style:UIBarButtonItemStylePlain target:self action:@selector(buttonone)];
    [self greatetableview];
    UIButton*button = [self.view viewWithTag:0];
    [self buttonone:button];
    
}
-(void)buttonone{

    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)greatetableview{
    _myview = [[UIView alloc]initWithFrame:CGRectMake(0, 66, kMainBoundsW, 50)];
    _myview.clipsToBounds = YES;
    [self.view addSubview:_myview];
    NSArray*arr = @[@"品类",@"品牌"];
    for (NSInteger j = 0; j < 2; j++) {
        UIButton * butt = [UIButton buttonWithType:UIButtonTypeCustom];
        butt.frame = CGRectMake(kMainBoundsW/2*j, 0, kMainBoundsW/2, 50);
        [butt setTitle:[NSString stringWithFormat:@"%@",[arr objectAtIndex:j]] forState:UIControlStateNormal];
        [butt addTarget:self action:@selector(buttonone:) forControlEvents:UIControlEventTouchUpInside];
        [butt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        butt.tag = j+20;
        if (buttonsele == j) {
            [butt setTitleColor:[UIColor redColor] forState: UIControlStateNormal];
        }else{
        [butt setTitleColor:[UIColor blackColor] forState: UIControlStateNormal];
        
        }
        [butarr addObject:butt];
        [_myview addSubview:butt];
        
       
        
    
    }
     lable = [[UILabel alloc]initWithFrame:CGRectMake(0,116, kMainBoundsW/2, 5)];
    lable.backgroundColor = [UIColor redColor];
    [self.view addSubview:lable];
    
    


}
-(void)buttonone:(UIButton*)sender{
    
    
    
    buttonsele = sender.tag-20;
    for (UIButton*but in butarr) {
        if (but.tag-20==buttonsele) {
            [but setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [vc.view removeFromSuperview];
            [vc removeFromParentViewController];
            pinleiViewController* pinleivc = [pinleiViewController new];
            
            [self.view addSubview:pinleivc.view];
            [self addChildViewController:pinleivc];
            [self.view bringSubviewToFront:_myview];
            vc=pinleivc;
            
            
            
            
        }else{
            [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [vc.view removeFromSuperview];
            [vc removeFromParentViewController];
            PinPaiViewController*pinpaivc = [PinPaiViewController new];
            [self.view addSubview:pinpaivc.view];
            [self addChildViewController:pinpaivc];
            [self.view bringSubviewToFront:_myview];
            vc = pinpaivc
            ;
        }
    }
    [UIView animateWithDuration:0.3 animations:^{
        lable.frame = CGRectMake(sender.frame.origin.x, 116, kMainBoundsW/2, 5);
    }];
    
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
