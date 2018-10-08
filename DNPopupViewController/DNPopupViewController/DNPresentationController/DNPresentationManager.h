//
//  DNPresentationManager.h
//  DNPopupViewController
//
//  Created by zjs on 2018/9/30.
//  Copyright © 2018 zjs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DNPresentationConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface DNPresentationManager : NSObject

@property (nonatomic, strong) DNPresentationConfig * config;

+ (instancetype)defaultManager;
/**
 *  @brief 调用方法
 *
 *  @param config 将要弹出的界面的配置
 *  @param presentingVC 弹窗的s父视图
 *  @param presentedVC  将要显示的弹窗视图
 */
- (void)dn_popModalControllerWithConfig:(DNPresentationConfig *)config
                           presentingVC:(UIViewController *)presentingVC
                            presentedVC:(UIViewController *)presentedVC;
@end

NS_ASSUME_NONNULL_END
