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
 *  @breif 创建方法
 *
 *  @param config 配置
 *  @param superVC 弹窗的s父视图
 *  @param subVC   将要显示的弹窗视图
 */

- (void)dn_popModalControllerWithConfig:(DNPresentationConfig *)config superVC:(UIViewController *)superVC subVC:(UIViewController *)subVC;

@end

NS_ASSUME_NONNULL_END
