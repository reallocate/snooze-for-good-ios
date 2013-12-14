//
//  AppDelegate.h
//  snoozeforgood
//
//  Created by Fabrice Armisen on 12/14/13.
//  Copyright (c) 2013 reallocate. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SlidingViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
}

@property(nonatomic, strong) UIWindow *window;
@property(nonatomic, readonly) SlidingViewController *slidingViewController;
@property(nonatomic, readonly) UIStoryboard*  mainStoryboard;

+ (AppDelegate *)get;
@end
