//
//  AppDelegate.m
//  snoozeforgood
//
//  Created by Fabrice Armisen on 12/14/13.
//  Copyright (c) 2013 reallocate. All rights reserved.
//

#import "AppDelegate.h"
#import "ECSlidingViewController.h"
#import "SlidingViewController.h"
#import "UserManager.h"
#import "SigninViewController.h"
#import "User.h"
#import <Parse/Parse.h>"
#import <Parse/PFFacebookUtils.h>
#import "FBAppCall.h"

@implementation AppDelegate {
    //ECSlidingViewController *_slidingViewController;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Override point for customization after application launch.

    // Nib files require the type to have been loaded before they can do the wireup successfully.
    // http://stackoverflow.com/questions/1725881/unknown-class-myclass-in-interface-builder-file-error-at-runtime

    UIViewController *topViewController = [self.mainStoryboard instantiateViewControllerWithIdentifier:@"Alarm"];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:topViewController];
    navigationController.navigationBarHidden = YES;

    _slidingViewController = [SlidingViewController slidingWithTopViewController:navigationController];

    _slidingViewController.underLeftViewController = [self.mainStoryboard instantiateViewControllerWithIdentifier:@"Side Menu"];


    // configure anchored layout
    _slidingViewController.anchorRightRevealAmount = 150.0;


    // enable swiping on the top view
    [navigationController.view addGestureRecognizer:_slidingViewController.panGesture];

    self.window.rootViewController = _slidingViewController;


    [self.window makeKeyAndVisible];

    // parse setting
    [User registerSubclass];
    [Parse setApplicationId:@"S7UVunXXmGj08x7Bk4BbcqxFRAsrghjpwkO4V2Y0" clientKey:@"Ano4pG7kTkzE2BiKt04ATusHk3cX8Q5ONHXxiWvu"];
    [PFFacebookUtils initializeFacebook];


    if (![[UserManager sharedInstance] isLoggedIn]) {
        [_slidingViewController toSignupView];
    }

    return YES;

}

+ (AppDelegate *)get {
    return (AppDelegate *) [[UIApplication sharedApplication] delegate];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Facebook SDK * pro-tip *
    // if the app is going away, we close the session object; this is a good idea because
    // things may be hanging off the session, that need releasing (completion block, etc.) and
    // other components in the app may be awaiting close notification in order to do cleanup

    UserManager *userManager = [UserManager sharedInstance];
}

- (UIStoryboard *)mainStoryboard {
    return [UIStoryboard storyboardWithName:@"Main" bundle:nil];;
}


- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {

    return [FBAppCall handleOpenURL:url sourceApplication:sourceApplication withSession:[PFFacebookUtils session]];
}

// Helper method to wrap logic for handling app links.
- (void)handleAppLink:(FBAccessTokenData *)appLinkToken {
    // Initialize a new blank session instance...
   /* FBSession *appLinkSession = [[FBSession alloc] initWithAppID:nil
                                                     permissions:nil
                                                 defaultAudience:FBSessionDefaultAudienceNone
                                                 urlSchemeSuffix:nil
                                              tokenCacheStrategy:[FBSessionTokenCachingStrategy nullCacheInstance]];
    [FBSession setActiveSession:appLinkSession];
    // ... and open it from the App Link's Token.
    [appLinkSession openFromAccessTokenData:appLinkToken
                          completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
                              // Forward any errors to the FBLoginView delegate.
                              if (error) {
                                  [[UserManager sharedInstance] handleError:error];
                              }
                          }];
                          */
}

@end
