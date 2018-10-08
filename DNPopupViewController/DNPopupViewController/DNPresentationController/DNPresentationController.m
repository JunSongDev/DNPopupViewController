//
//  DNPresentationController.m
//  DNPopupViewController
//
//  Created by zjs on 2018/9/30.
//  Copyright © 2018 zjs. All rights reserved.
//

#import "DNPresentationController.h"


#define SCREEN_W    [UIScreen mainScreen].bounds.size.width
#define SCREEN_H    [UIScreen mainScreen].bounds.size.height

@interface DNPresentationController ()
{
    CGFloat positionX;
    CGFloat positionY;
}

@end

@implementation DNPresentationController

- (void)containerViewWillLayoutSubviews {

    [super containerViewWillLayoutSubviews];
    
    self.presentedView.layer.cornerRadius = 6.f;
    if (self.contrllerPosition == DNPresentationControllerPositionCenter) {

        self.presentedView.frame = CGRectMake(SCREEN_W*0.5-self.controlSize.width*0.5, SCREEN_H*0.5-self.controlSize.height*0.5, self.controlSize.width, self.controlSize.height);
    }
    else {
        self.presentedView.frame = CGRectMake(SCREEN_W*0.5-self.controlSize.width*0.5, SCREEN_H-self.controlSize.height, self.controlSize.width, self.controlSize.height);
    }
    [self.containerView insertSubview:self.bgLayerView atIndex:0];
}

- (void)dismissalTransitionDidEnd:(BOOL)completed {
    [self.bgLayerView removeFromSuperview];
}

//- (void)dismissClick {
//    [self.presentedViewController dismissViewControllerAnimated:YES completion:^{
//        [self.bgLayerView removeFromSuperview];
//    }];
//}

#pragma mark -------- Setter --------

- (void)setControlSize:(CGSize)controlSize {
    _controlSize = controlSize;
}

- (void)setContrllerPosition:(DNPresentationControllerPosition)contrllerPosition {
    _contrllerPosition = contrllerPosition;
}

#pragma mark -------- Getter --------

- (UIView *)bgLayerView {
    if (!_bgLayerView) {
        _bgLayerView = [[UIView alloc] initWithFrame:self.containerView.bounds];
        _bgLayerView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.4];
        _bgLayerView.userInteractionEnabled = YES;
//        UITapGestureRecognizer * tapgesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissClick)];
//        [_bgLayerView addGestureRecognizer:tapgesture];
    }
    return _bgLayerView;
}

@end
