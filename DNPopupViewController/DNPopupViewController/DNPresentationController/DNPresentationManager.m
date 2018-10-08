//
//  DNPresentationManager.m
//  DNPopupViewController
//
//  Created by zjs on 2018/9/30.
//  Copyright © 2018 zjs. All rights reserved.
//

#import "DNPresentationManager.h"

static DNPresentationManager *_defaultManager = nil;

@interface DNPresentationManager ()

@property (nonatomic, strong) UIViewController * presentingVC;
@end

@implementation DNPresentationManager

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_defaultManager) {
            _defaultManager = [super allocWithZone:zone];
        }
    });
    return _defaultManager;
}

+ (instancetype)defaultManager {
    _defaultManager = [[self alloc] init];
    return _defaultManager;
}

- (id)copyWithZone:(NSZone *)zone {
    return _defaultManager;
}

- (void)dn_popModalControllerWithConfig:(DNPresentationConfig *)config presentingVC:(UIViewController *)presentingVC presentedVC:(UIViewController *)presentedVC {
    
    _config = config;
    presentedVC.transitioningDelegate  = self.config;
    presentedVC.modalPresentationStyle = UIModalPresentationCustom;
    [presentingVC presentViewController:presentedVC animated:YES completion:^{
        
    }];
}

- (void)setConfig:(DNPresentationConfig *)config {
    _config = config;
}

@end
