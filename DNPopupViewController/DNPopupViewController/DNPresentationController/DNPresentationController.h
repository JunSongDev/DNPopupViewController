//
//  DNPresentationController.h
//  DNPopupViewController
//
//  Created by zjs on 2018/9/30.
//  Copyright © 2018 zjs. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, DNPresentationControllerPosition) {
    DNPresentationControllerPositionCenter = 0,
    DNPresentationControllerPositionBottom
};

//typedef NS_ENUM(NSInteger, DNPresentationControllerPopType) {
//
//    DNPresentationControllerPopPresent = 0,
//    DNPresentationControllerPopDismiss
//};

@interface DNPresentationController : UIPresentationController

/**
 *  Popover position of controller
 */
@property (nonatomic, assign) DNPresentationControllerPosition contrllerPosition;

/**
 *
 */
//@property (nonatomic, assign) DNPresentationControllerPopType popType;

/**
 *  PresentationController's size
 */
@property (nonatomic, assign) CGSize controlSize;

/**
 *  Mongolian layer view
 */
@property (nonatomic, strong) UIView * bgLayerView;

@end

NS_ASSUME_NONNULL_END
