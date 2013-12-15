//
// Created by Fabrice Armisen on 12/14/13.
// Copyright (c) 2013 reallocate. All rights reserved.
//


#import "SlidingViewController.h"
#import "AppDelegate.h"
#import "UserManager.h"
#import "SigninViewController.h"


@implementation SlidingViewController {

    SigninViewController* _signinViewController;
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

- (void)toSigninView {
    [self resetTopViewAnimated:NO onComplete:^{
        _signinViewController = [[AppDelegate get].mainStoryboard instantiateViewControllerWithIdentifier:@"Signin"];
        [self presentViewController:_signinViewController animated:NO completion:nil];
    }];
}

- (void)dismissSigninView {
    [_signinViewController dismiss];
    _signinViewController = nil;
}
@end