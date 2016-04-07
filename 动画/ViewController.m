//
//  ViewController.m
//  动画
//
//  Created by mac on 16/3/28.
//  Copyright © 2016年 com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAccelerometerDelegate>
@property (weak, nonatomic) IBOutlet UIView *testView;
@property (weak, nonatomic) IBOutlet UIView *myView;

@property (nonatomic, strong) CALayer *myLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self test1];
//    [self test2];
//    [self test3];
    [self test4];
//    [self test5];
}
-(void)test5{
    
    CABasicAnimation *changeColor = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    changeColor.fromValue = (id)[UIColor orangeColor].CGColor;
    changeColor.toValue   = (id)[UIColor blueColor].CGColor;
    changeColor.duration  = 1.0; // For convenience
    
    [self.myView.layer addAnimation:changeColor
                        forKey:@"Change color"];
    
    self.myView.layer.speed = 0.0; // Pause the animation
}
- (IBAction)silderAction:(UISlider *)sender {
    self.myView.layer.timeOffset = sender.value;
}


/**
 基于控件初始位置”的形变
 
 CGAffineTransformMakeTranslation（平移）
 
 CGAffineTransformMakeScale（缩放）
 
 CGAffineTransformMakeRotation（旋转）
 
 
 创建“基于transform参数”的形变
 
 CGAffineTransformTranslate
 
 CGAffineTransformScale
 
 CGAffineTransformRotate
 */
-(void)test1{
    [UIView animateWithDuration:1
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut //设置动画类型
                     animations:^{
                         //旋转
//                        _testView.transform = CGAffineTransformMakeRotation(M_PI / 4);
 
                         
                         //缩放(从原有级别上缩放)
//                         _testView.transform = CGAffineTransformScale(self.testView.transform, 0.3, 0.3);
                         
                         //缩放(从现有级别上缩放)
//                         _testView.transform = CGAffineTransformMakeScale(0.4, 0.4);
                         
                         
                         
                         
                     }
                     completion:^(BOOL finished){
                         // 动画结束时的处理
                     }];
}


-(void)test2{
    //首尾式设置动画效果
    [UIView beginAnimations:nil context:nil];
    self.testView.center = CGPointMake(120, 300);
    //设置时间
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:_testView cache:YES];
    [UIView setAnimationDuration:4.0];
    [UIView commitAnimations];
}

-(void)test3{
    //初始化
    CALayer *scaleLayer = [[CALayer alloc] init];
    scaleLayer.backgroundColor = [UIColor blueColor].CGColor;
    scaleLayer.frame = CGRectMake(60, 20 + 10, 50, 50);
    scaleLayer.cornerRadius = 10;
    [self.view.layer addSublayer:scaleLayer];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];
    scaleAnimation.autoreverses = YES;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.repeatCount = MAXFLOAT;
    scaleAnimation.duration = 0.8;
    
    //开始
    [scaleLayer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}

-(void)test4{
    //初始化
    CALayer *groupLayer = [[CALayer alloc] init];
    groupLayer.frame = CGRectMake(self.view.center.x - 25, self.view.center.y - 25, 50, 50);
    groupLayer.cornerRadius = 10;
    groupLayer.backgroundColor = [[UIColor purpleColor] CGColor];
    [self.view.layer addSublayer:groupLayer];
    
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    // 起始帧和终了帧的设定
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:2.3];
    
     // 设置
    scaleAnimation.autoreverses = YES;
    scaleAnimation.repeatCount = MAXFLOAT;
    scaleAnimation.duration = 0.8;
     // 添加动画
    [groupLayer addAnimation:scaleAnimation forKey:@"groupAnnimation"];

    /* 移动 */
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    // 起始帧和终了帧的设定
    moveAnimation.fromValue = [NSValue valueWithCGPoint:groupLayer.position];
    moveAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(320 - 80,
                                                                  groupLayer.position.y)];
    //设置
    moveAnimation.autoreverses = YES;
    moveAnimation.repeatCount = MAXFLOAT;
    moveAnimation.duration = 2;
    
    // 添加动画

    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:6.0 * M_PI];
    rotateAnimation.autoreverses = YES;
    rotateAnimation.repeatCount = MAXFLOAT;
    rotateAnimation.duration = 2;
    
    
    CAAnimationGroup *groupAnnimation = [CAAnimationGroup animation];
    groupAnnimation.duration = 2;
    groupAnnimation.autoreverses = YES;
    groupAnnimation.animations = @[moveAnimation, scaleAnimation, rotateAnimation];
    groupAnnimation.repeatCount = MAXFLOAT;
    
    // 添加动画
    [groupLayer addAnimation:groupAnnimation forKey:@"groupAnnimation"];
}
@end
