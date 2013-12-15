//
// Created by Fabrice Armisen on 12/14/13.
// Copyright (c) 2013 reallocate. All rights reserved.
//


#import "SigninViewController.h"
#import "UserManager.h"


@implementation SigninViewController {
    IBOutlet FBLoginView *_fbLoginView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _fbLoginView.delegate = [UserManager sharedInstance];
}

- (IBAction)emailButtonPushed:(id)sender {
    [self dismiss];
}

- (IBAction)regWithFBButtonPushed:(id)sender {
    [FBSession openActiveSessionWithAllowLoginUI:YES];
}

- (void)dismiss {
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;   // your choice here from UIModalTransitionStyle
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

@end