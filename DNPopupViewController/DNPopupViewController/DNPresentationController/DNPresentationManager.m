//
//  DNPresentationManager.m
//  DNPopupViewController
//
//  Created by zjs on 2018/9/30.
//  Copyright © 2018 zjs. All rights reserved.
//

#import "DNPresentationManager.h"

static DNPresentationManager *_defaultManager = nil;

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

- (void)dn_popModalControllerWithConfig:(DNPresentationConfig *)config superVC:(UIViewController *)superVC subVC:(UIViewController *)subVC {
    
    self.config = config;
    subVC.transitioningDelegate  = self.config;
    subVC.modalPresentationStyle = UIModalPresentationCustom;
    [superVC presentViewController:subVC animated:YES completion:^{
        
    }];
}

- (void)setConfig:(DNPresentationConfig *)config {
    _config = config;
}

@end
