//
//  DNPopupConfig.m
//  DNPopupViewController
//
//  Created by zjs on 2018/10/8.
//  Copyright © 2018 zjs. All rights reserved.
//

#import "DNPopupConfig.h"

@interface DNPopupConfig ()
// 模态弹窗的大小
@property (nonatomic, assign) CGSize modalAlertSize;
// 将要弹出的控制器
@property (nonatomic, strong) DNPopupController * popupController;
// 模态弹窗在控制器中的位置
@property (nonatomic, assign) DNPopupControllerPosition controllerPosition;
// 模态弹窗是否已经显示
@property (nonatomic, assign, getter=isPresented) BOOL presented;
@end

@implementation DNPopupConfig

#pragma mark -- <UIViewControllerTransitioningDelegatere>
//- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
//
////    DNPresentationController * controller = [[DNPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
////    controller.controlSize = self.modalSize;
////    controller.contrllerPosition = self.position;
////
////    self.presentationController = controller;
//
//    return controller;
//}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    _presented = YES;
    
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    _presented = NO;
    
    return self;
}

#pragma mark - <UIViewControllerAnimatedTransitioning>
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.35;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    _presented?[self animationForPresentView:transitionContext]:[self animationForDismissView:transitionContext];
}


- (void)animationForPresentView:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *presentedView = [transitionContext viewForKey:UITransitionContextToViewKey];
    [transitionContext.containerView addSubview:presentedView];
    //self.presentationController.bgLayerView.alpha = 0.0f;
    // 设置阴影
    transitionContext.containerView.layer.shadowColor = [UIColor blackColor].CGColor;
    transitionContext.containerView.layer.shadowOffset = CGSizeMake(0, 5);
    transitionContext.containerView.layer.shadowOpacity = 0.5f;
    transitionContext.containerView.layer.shadowRadius = 10.0f;
    
    __weak typeof(self) weakself = self;
    if (self.controllerPosition == DNPopupControllerCenter) {
        presentedView.alpha = 0.0f;
        presentedView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        // 动画弹出
        [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            //weakself.presentationController.bgLayerView.alpha = 1.0f;
            presentedView.alpha = 1.0f;
            presentedView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    else {
        
        presentedView.transform = CGAffineTransformMakeTranslation(0, self.modalAlertSize.height);
        [UIView animateWithDuration:0.35 animations:^{
            //weakself.presentationController.bgLayerView.alpha = 1.0f;
            presentedView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
}

- (void)animationForDismissView:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *presentedView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    __weak typeof(self) weakself = self;
    if (self.controllerPosition == DNPopupControllerBottom) {
        
        // 消失
        [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            //weakself.presentationController.bgLayerView.alpha = 0.0f;
            presentedView.alpha = 0.0f;
        } completion:^(BOOL finished) {
            [presentedView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }
    else {
        
        [UIView animateWithDuration:0.35 animations:^{
            //weakself.presentationController.bgLayerView.alpha = 0.0f;
            presentedView.transform = CGAffineTransformMakeTranslation(0, weakself.modalAlertSize.height);
        } completion:^(BOOL finished) {
            [presentedView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }
}

#pragma mark -- Setter

- (void)setModalAlertSize:(CGSize)modalAlertSize {
    _modalAlertSize = modalAlertSize;
}

- (void)setControllerPosition:(DNPopupControllerPosition)controllerPosition {
    _controllerPosition = controllerPosition;
}

- (void)setPresented:(BOOL)presented {
    _presented = presented;
}

#pragma mark -- Getter
@end
