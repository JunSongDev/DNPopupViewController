# DNPopupViewController    
### 这厮一种利用 UIPresentationController 创建的模态弹窗   
##### 一、DNPresentationConfig
1. 在该类中配置一些基本的参数：
```
// 弹窗所在的位置（居中或者在下方）
@property (nonatomic, assign) DNPresentationControllerPosition position;
// 弹窗将要显示的大小
@property (nonatomic, assign) CGSize modalSize;
// config 的创建方法
- (instancetype)initWithModalSize:(CGSize)modelSize position:(DNPresentationControllerPosition)position;   
```     
2. 在该类中实现 UIViewControllerTransitioningDelegate 和 UIViewControllerAnimatedTransitioning 的代理方法
##### 二、DNPresentationManager    
1. 弹窗的创建管理器
```
// 弹窗的配置
@property (nonatomic, strong) DNPresentationConfig * config;
// 单例创建
+ (instancetype)defaultManager;
/**
 *  @breif 创建方法
 *
 *  @param config 配置
 *  @param superVC 弹窗的s父视图
 *  @param subVC   将要显示的弹窗视图
 */
- (void)dn_popModalControllerWithConfig:(DNPresentationConfig *)config superVC:(UIViewController *)superVC subVC:(UIViewController *)subVC;
```    
##### 三、调用    
``` 
TestViewController * viewControl = [[TestViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:viewControl];
    
    DNPresentationConfig * config = [[DNPresentationConfig alloc] initWithModalSize:CGSizeMake(SCREEN_W*0.75, SCREEN_W) position:DNPresentationControllerPositionCenter];
    [[DNPresentationManager defaultManager] dn_popModalControllerWithConfig:config superVC:self subVC:nav];     
 ```
