//
// Created by Fabrice Armisen on 12/14/13.
// Copyright (c) 2013 reallocate. All rights reserved.
//


#import "SlidingViewController.h"
#import "AppDelegate.h"
#import "UserManager.h"
#import "SigninViewController.h"
#import "SignupViewController.h"


@implementation SlidingViewController {
    SignupViewController* _signupViewController;
}


#pragma mark navigation helpers

- (void)toAlarmView {
    [self setViewController:[[[AppDelegate get] mainStoryboard] instantiateViewControllerWithIdentifier:@"Alarm"]];
}

- (void)toSettingsView {
    [self setViewController:[[[AppDelegate get] mainStoryboard] instantiateViewControllerWithIdentifier:@"Settings"]];
}

#pragma mark private

- (void)setViewController:(UIViewController *)viewController {
    [self resetTopViewAnimated:YES onComplete:^{
        [(UINavigationController *) self.topViewController setViewControllers:@[viewController] animated:NO];
    }];
}

- (void)toSignupView {
    [self resetTopViewAnimated:NO onComplete:nil];
    _signupViewController = [[AppDelegate get].mainStoryboard instantiateViewControllerWithIdentifier:@"Signup"];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:_signupViewController];
    navigationController.navigationBarHidden = YES;
    [self presentViewController:navigationController animated:NO completion:nil];
}

- (void)dismissSignupView {
    [[self presentedViewController] dismissViewControllerAnimated:NO completion:nil];
    _signupViewController = nil;
}
@end