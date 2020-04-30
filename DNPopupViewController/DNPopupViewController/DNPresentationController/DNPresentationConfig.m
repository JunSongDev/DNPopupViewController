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
    controller.controlSize       = self.modalSize;
    controller.controlPoint      = self.modalPoint;
    controller.contrllerPosition = self.position;
    
    self.presentationController  = controller;
    
    return controller;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return self;
}

#pragma mark - <UIViewControllerAnimatedTransitioning>
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.35;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *containerView = transitionContext.containerView;
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView   = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    __weak typeof(self) weakself = self;
    
    if (toVc.isBeingPresented) {
        
        [containerView addSubview:toView];
        self.presentationController.bgLayerView.alpha = 0.0f;
        // 设置阴影
        containerView.layer.shadowColor = [UIColor blackColor].CGColor;
        containerView.layer.shadowOffset = CGSizeMake(0, 5);
        containerView.layer.shadowOpacity = 0.5f;
        containerView.layer.shadowRadius = 10.0f;
        
        if (self.position == DNPresentationControllerPositionCenter) {
            toView.alpha = 0.0f;
            toView.transform = CGAffineTransformMakeScale(1.2, 1.2);
            // 动画弹出
            [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                weakself.presentationController.bgLayerView.alpha = 1.0f;
                toView.alpha = 1.0f;
                toView.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
        } else if (self.position == DNPresentationControllerPositionSheet) {
            toView.transform = CGAffineTransformMakeTranslation(0, self.modalSize.height);
            [UIView animateWithDuration:0.35 animations:^{
                weakself.presentationController.bgLayerView.alpha = 1.0f;
                toView.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
        } else if (self.position == DNPresentationControllerPositionLeading) {
            toView.transform = CGAffineTransformMakeTranslation(-self.modalSize.width, 0);
            [UIView animateWithDuration:0.35 animations:^{
                weakself.presentationController.bgLayerView.alpha = 1.0f;
                toView.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
        } else if (self.position == DNPresentationControllerPositionTrailing) {
            toView.transform = CGAffineTransformMakeTranslation(self.modalSize.width, 0);
            [UIView animateWithDuration:0.35 animations:^{
                weakself.presentationController.bgLayerView.alpha = 1.0f;
                toView.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
        }  else {
            toView.alpha = 0.0f;
            toView.transform = CGAffineTransformMakeScale(1.2, 1.2);
            // 动画弹出
            [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                weakself.presentationController.bgLayerView.alpha = 1.0f;
                toView.alpha = 1.0f;
                toView.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
        }
    }
    
    if (fromVc.isBeingDismissed) {
        
        if (self.position == DNPresentationControllerPositionCenter) {
            
            // 消失
            [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                fromView.alpha = 0.0f;
                weakself.presentationController.bgLayerView.alpha = 0.0f;
            } completion:^(BOOL finished) {
                [fromView removeFromSuperview];
                [transitionContext completeTransition:YES];
            }];
        } else if (self.position == DNPresentationControllerPositionSheet) {
            [UIView animateWithDuration:0.35 animations:^{
                fromView.transform = CGAffineTransformMakeTranslation(0, weakself.modalSize.height);
                weakself.presentationController.bgLayerView.alpha = 0.0f;
            } completion:^(BOOL finished) {
                [fromView removeFromSuperview];
                [transitionContext completeTransition:YES];
            }];
        } else if (self.position == DNPresentationControllerPositionLeading) {
            [UIView animateWithDuration:0.35 animations:^{
                fromView.transform = CGAffineTransformMakeTranslation(-weakself.modalSize.width, 0);
                weakself.presentationController.bgLayerView.alpha = 0.0f;
            } completion:^(BOOL finished) {
                [fromView removeFromSuperview];
                [transitionContext completeTransition:YES];
            }];
        } else if (self.position == DNPresentationControllerPositionTrailing) {
            [UIView animateWithDuration:0.35 animations:^{
                fromView.transform = CGAffineTransformMakeTranslation(weakself.modalSize.width, 0);
                weakself.presentationController.bgLayerView.alpha = 0.0f;
            } completion:^(BOOL finished) {
                [fromView removeFromSuperview];
                [transitionContext completeTransition:YES];
            }];
        } else {
            [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                fromView.alpha = 0.0f;
                weakself.presentationController.bgLayerView.alpha = 0.0f;
            } completion:^(BOOL finished) {
                [fromView removeFromSuperview];
                [transitionContext completeTransition:YES];
            }];
        }
        [self.presentationController.bgLayerView removeFromSuperview];
    }
}

#pragma mark -- Setter

- (void)setPosition:(DNPresentationControllerPosition)position {
    _position = position;
}

- (void)setModalSize:(CGSize)modalSize {
    _modalSize = modalSize;
}

- (void)setModalPoint:(CGPoint)modalPoint {
    _modalPoint = modalPoint;
}
@end
