//
//  ViewController.m
//  ShoppingCarDemo
//
//  Created by admin on 17/3/19.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic)UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createCarImage];
    
}

- (void)createCarImage{
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 100, 100, 100)];
    
    _imageView.image = [UIImage imageNamed:@"圣斗士02.jpg"];
    
    [self.view addSubview:_imageView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self starAnima];
}

- (void)starAnima{
    //位置变化
    CAKeyframeAnimation *potionAni = [CAKeyframeAnimation animation];
    potionAni.keyPath = @"position";
//    potionAni.removedOnCompletion = NO;
//    potionAni.fillMode = kCAFillModeBackwards;
    potionAni.duration = 1;
    //绘制贝塞尔路径
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addCurveToPoint:CGPointMake(300, 500) controlPoint1:CGPointMake(300, 30) controlPoint2:CGPointMake(30, 400)];
    potionAni.path = path.CGPath;
    potionAni.repeatCount = 1;
    
    //自身旋转
    CAKeyframeAnimation *anim1 = [CAKeyframeAnimation animation];
    anim1.keyPath = @"transform.rotation";
    //position";//transform.rotation
//    anim1.removedOnCompletion = NO;
//    anim1.fillMode = kCAFillModeBackwards;
    anim1.duration = 0.3;
    anim1.values = @[@(M_PI_2),@(M_PI),@(M_PI_2+M_PI),@(2*M_PI)];
    anim1.repeatCount = MAXFLOAT;
    
    //缩放
    CABasicAnimation *scale = [CABasicAnimation animation];
    scale.keyPath = @"transform.scale";
    scale.toValue = @(0);
    scale.duration = 1;
    
    //创建动画组
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[potionAni,anim1,scale];
    group.repeatCount = 1;
    group.duration = 1;
//    group.removedOnCompletion = NO;
//    group.fillMode = kCAFillModeBackwards;
    
    [self.imageView.layer addAnimation:group forKey:nil];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
