//
// Created by Fabrice Armisen on 12/14/13.
// Copyright (c) 2013 reallocate. All rights reserved.
//


#import "SigninViewController.h"
#import "UserManager.h"


@implementation SigninViewController {
}

- (IBAction)backButtonPushed:(id)sender {
    [[self navigationController] popViewControllerAnimated:YES];
}

- (IBAction)signinButtonPushed:(id)sender {
}

- (IBAction)signinWithFacebookButtonPushed:(id)sender {
    [[UserManager sharedInstance] openFaceBookSession];
}

@end