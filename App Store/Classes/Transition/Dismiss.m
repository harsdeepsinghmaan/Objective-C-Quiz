//
//  Dismiss.m
//  Design
//


#import "Dismiss.h"

@implementation Dismiss
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = transitionContext.containerView;
    StoryViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    TutorialsCollectionViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [toViewController.view setHidden:YES];
    [containerView addSubview:toViewController.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        [fromViewController positionContainer:self.selectedFrame.origin.y + 20.0 left:20.0 bottom:0.0 right:20.0];
        [fromViewController setHeaderHeight:self.selectedFrame.size.height - 40.0];
        [fromViewController configureRoundedCorners:YES];
    } completion:^(BOOL finished) {
        [toViewController.view setHidden:NO];
        [fromViewController.view removeFromSuperview];
       // [transitionContext completeTransition:transitionContext.transitionWasCancelled];
        
        [transitionContext completeTransition:YES];
    }];
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.1;
}
@end
