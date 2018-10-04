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

- (void)dn_popModalControllerWithConfig:(DNPresentationConfig *)config superVC:(UIViewController *)superVC subVC:(UIViewController *)subVC;

@end

NS_ASSUME_NONNULL_END
