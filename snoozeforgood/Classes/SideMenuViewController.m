//
// Created by Fabrice Armisen on 12/14/13.
// Copyright (c) 2013 reallocate. All rights reserved.
//


#import "SideMenuViewController.h"
#import "AppDelegate.h"
#import "SlidingViewController.h"


@interface SideMenuViewController ()
- (IBAction)alarmButtonPushed:(id)sender;
- (IBAction)settingsButtonPushed:(id)sender;
@end

@implementation SideMenuViewController {

}

- (IBAction)alarmButtonPushed:(id)sender {
    [[AppDelegate get].slidingViewController toAlarmView];
}

- (IBAction)settingsButtonPushed:(id)sender {
    [[AppDelegate get].slidingViewController toSettingsView];
}


@end