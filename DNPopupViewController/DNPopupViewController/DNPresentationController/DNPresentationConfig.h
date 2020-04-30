//
//  DNPresentationConfig.h
//  DNPopupViewController
//
//  Created by zjs on 2018/9/30.
//  Copyright © 2018 zjs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DNPresentationController.h"


NS_ASSUME_NONNULL_BEGIN

@interface DNPresentationConfig : NSObject<UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) DNPresentationControllerPosition position;

@property (nonatomic, assign) CGSize  modalSize;

@property (nonatomic, assign) CGPoint modalPoint;

- (instancetype)initWithModalSize:(CGSize)modelSize
                         position:(DNPresentationControllerPosition)position;
@end

NS_ASSUME_NONNULL_END
