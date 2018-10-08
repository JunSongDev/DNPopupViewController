//
//  DNPopupController.h
//  DNPopupViewController
//
//  Created by zjs on 2018/10/8.
//  Copyright © 2018 zjs. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DNPopupControllerPosition) {
    DNPopupControllerCenter = 0,
    DNPopupControllerBottom
};

NS_ASSUME_NONNULL_BEGIN

@interface DNPopupController : UIViewController

@property (nonatomic, strong) UIView * bgLayerView;

@end

NS_ASSUME_NONNULL_END
