//
//  DNPresentationConfig.m
//  DNPopupViewController
//
//  Created by zjs on 2018/9/30.
//  Copyright © 2018 zjs. All rights reserved.
//

#import "DNPresentationConfig.h"

@interface DNPresentationConfig ()

@property (nonatomic, strong) DNPresentationController * presentationController;
@end

@implementation DNPresentationConfig
{
    BOOL _isPresent;
}

- (instancetype)initWithModalSize:(CGSize)modelSize
                         position:(DNPresentationControllerPosition)position {
    self = [super init];
    if (self) {
        _position  = position;
        _modalSize = modelSize;
    }
    return self;
}

#pragma mark -- <UIViewControllerTransitioningDelegatere>
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    
    DNPresentationController * controller = [[DNPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    controller.controlSize = self.modalSize;
    controller.contrllerPosition = self.position;
    
    self.presentationController = controller;
    
    return controller;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    _isPresent = YES;
    
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    _isPresent = NO;
    
    return self;
}

#pragma mark - <UIViewControllerAnimatedTransitioning>
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.35;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    _isPresent?[self animationForPresentView:transitionContext]:[self animationForDismissView:transitionContext];
}


- (void)animationForPresentView:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *presentedView = [transitionContext viewForKey:UITransitionContextToViewKey];
    [transitionContext.containerView addSubview:presentedView];
    self.presentationController.bgLayerView.alpha = 0.0f;
    // 设置阴影
    transitionContext.containerView.layer.shadowColor = [UIColor blackColor].CGColor;
    transitionContext.containerView.layer.shadowOffset = CGSizeMake(0, 5);
    transitionContext.containerView.layer.shadowOpacity = 0.5f;
    transitionContext.containerView.layer.shadowRadius = 10.0f;
    
    __weak typeof(self) weakself = self;
    if (self.position == DNPresentationControllerPositionCenter) {
        presentedView.alpha = 0.0f;
        presentedView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        // 动画弹出
        [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            weakself.presentationController.bgLayerView.alpha = 1.0f;
            presentedView.alpha = 1.0f;
            presentedView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    else if (self.position == DNPresentationControllerPositionSheet) {
        presentedView.transform = CGAffineTransformMakeTranslation(0, self.modalSize.height);
        [UIView animateWithDuration:0.35 animations:^{
            weakself.presentationController.bgLayerView.alpha = 1.0f;
            presentedView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    else if (self.position == DNPresentationControllerPositionLeading) {
        presentedView.transform = CGAffineTransformMakeTranslation(-self.modalSize.width, 0);
        [UIView animateWithDuration:0.35 animations:^{
            weakself.presentationController.bgLayerView.alpha = 1.0f;
            presentedView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    else {
        presentedView.transform = CGAffineTransformMakeTranslation(self.modalSize.width, 0);
        [UIView animateWithDuration:0.35 animations:^{
            weakself.presentationController.bgLayerView.alpha = 1.0f;
            presentedView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
}

- (void)animationForDismissView:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *presentedView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    __weak typeof(self) weakself = self;
    if (self.position == DNPresentationControllerPositionCenter) {
        
        // 消失
        [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            presentedView.alpha = 0.0f;
            weakself.presentationController.bgLayerView.alpha = 0.0f;
        } completion:^(BOOL finished) {
            [presentedView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }
    else if (self.position == DNPresentationControllerPositionSheet) {
        [UIView animateWithDuration:0.35 animations:^{
            presentedView.transform = CGAffineTransformMakeTranslation(0, weakself.modalSize.height);
            weakself.presentationController.bgLayerView.alpha = 0.0f;
        } completion:^(BOOL finished) {
            [presentedView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }
    else if (self.position == DNPresentationControllerPositionLeading) {
        [UIView animateWithDuration:0.35 animations:^{
            presentedView.transform = CGAffineTransformMakeTranslation(-weakself.modalSize.width, 0);
            weakself.presentationController.bgLayerView.alpha = 0.0f;
        } completion:^(BOOL finished) {
            [presentedView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }
    else {
        [UIView animateWithDuration:0.35 animations:^{
            presentedView.transform = CGAffineTransformMakeTranslation(weakself.modalSize.width, 0);
            weakself.presentationController.bgLayerView.alpha = 0.0f;
        } completion:^(BOOL finished) {
            [presentedView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }
    [self.presentationController.bgLayerView removeFromSuperview];
}

#pragma mark -- Setter

- (void)setPosition:(DNPresentationControllerPosition)position {
    _position = position;
}

- (void)setModalSize:(CGSize)modalSize {
    _modalSize = modalSize;
}

@end
