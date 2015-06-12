//
//  ZoomingIconTransition.m
//  ZoomingIcons
//
//  Created by Jeremy Petter on 2015-06-11.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "ZoomingIconTransition.h"

@interface ZoomingIconTransition() <UIViewControllerAnimatedTransitioning, UINavigationControllerDelegate>

extern NSTimeInterval const kZoomingIconTransitionDuration;

@end

@implementation ZoomingIconTransition

NSTimeInterval const kZoomingIconTransitionDuration = 1.0;

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    NSTimeInterval transitionDuration = [self transitionDuration: transitionContext];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:fromViewController.view];
    [containerView addSubview:toViewController.view];
    toViewController.view.alpha = 0;
    [UIView animateWithDuration:transitionDuration
                          delay:0 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toViewController.view.alpha = 1;
                     }
                     completion:^(BOOL success){
                         toViewController.view.alpha = 1;
                         [transitionContext completeTransition:success];
                     }];
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return kZoomingIconTransitionDuration;
}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0){
    return self;
}
@end
