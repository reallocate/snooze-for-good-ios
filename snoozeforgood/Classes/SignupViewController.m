//
// Created by Fabrice Armisen on 12/14/13.
// Copyright (c) 2013 reallocate. All rights reserved.
//


#import "SignupViewController.h"
#import "UserManager.h"
#import "AppDelegate.h"
#import "SigninViewController.h"


@implementation SignupViewController {
}

- (IBAction)signupWithEmailButtonPressed:(id)sender {

}

- (IBAction)signupWithFacebookButtonPressed:(id)sender {
    [[UserManager sharedInstance] openFaceBookSession];
}

- (IBAction)signinButtonPressed:(id)sender {
    SigninViewController *signinViewController = [[AppDelegate get].mainStoryboard instantiateViewControllerWithIdentifier:@"Signin"];
    self.navigationController.navigationBarHidden = YES;
    [self.navigationController pushViewController:signinViewController animated:YES];
}


@end