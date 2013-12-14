//
// Created by Fabrice Armisen on 12/14/13.
// Copyright (c) 2013 reallocate. All rights reserved.
//


#import "SigninViewController.h"


@implementation SigninViewController {

}

- (IBAction)facebookButtonPushed:(id)sender {
    [self dismiss];
}


- (IBAction)emailButtonPushed:(id)sender {
    [self dismiss];
}


- (void)dismiss {
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;   // your choice here from UIModalTransitionStyle
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}


@end