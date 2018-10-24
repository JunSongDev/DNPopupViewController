//
//  DNPopupManager.m
//  DNPopupViewController
//
//  Created by zjs on 2018/10/8.
//  Copyright © 2018 zjs. All rights reserved.
//

#import "DNPopupManager.h"
#import "DNPopupConfig.h"

static DNPopupManager *_manager = nil;

@implementation DNPopupManager

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_manager) {
            _manager = [super allocWithZone:zone];
        }
    });
    return _manager;
}

+ (instancetype)defaultManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[self alloc] init];
    });
    return _manager;
}

- (id)copyWithZone:(NSZone *)zone {
    return _manager;
}

@end
