//
// Created by Fabrice Armisen on 12/14/13.
// Copyright (c) 2013 reallocate. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "ECSlidingViewController.h"
#import "FBLoginView.h"

@interface SlidingViewController : ECSlidingViewController

- (void)toAlarmView;
- (void)toSettingsView;

- (void)toSignupView;

- (void)dismissSignupView;
@end