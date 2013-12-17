//
// Created by Fabrice Armisen on 12/14/13.
// Copyright (c) 2013 reallocate. All rights reserved.
//


#import "UserManager.h"
#import "FBSession.h"
#import "FBError.h"
#import "FBErrorUtility.h"
#import "AppDelegate.h"
#import "SlidingViewController.h"
#import "FBRequest.h"


@implementation UserManager {
}
- (BOOL)isLoggedIn {
    return FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded;
}

- (void)signout {
    [FBSession.activeSession closeAndClearTokenInformation];
}


- (void)openFaceBookSession {
    NSArray *permissions = [[NSArray alloc] initWithObjects:@"email", nil];
    [FBSession openActiveSessionWithReadPermissions:permissions allowLoginUI:YES completionHandler:
            ^(FBSession *session, FBSessionState state, NSError *error) {
                if (error) {
                    [self handleError:error];
                    [self signout];
                    [[AppDelegate get].slidingViewController toSignupView];
                } else {
                    [self grabUserInfoWithCompletionHandler:^(NSDictionary <FBGraphUser> *user, NSError *error) {
                        [[AppDelegate get].slidingViewController dismissSignupView];
                    }];
                }
            }];

}

- (void)grabUserInfoWithCompletionHandler:(void (^)(id, NSError *))completionHandler {
    [[FBRequest requestForMe] startWithCompletionHandler:^(FBRequestConnection *connection,
            NSDictionary <FBGraphUser> *user,
            NSError *error) {
        completionHandler(user, error);
    }];

}

- (void)handleError:(NSError *)error {
    NSString *alertMessage, *alertTitle;

    // Facebook SDK * error handling *
    // Error handling is an important part of providing a good user experience.
    // Since this sample uses the FBLoginView, this delegate will respond to
    // login failures, or other failures that have closed the session (such
    // as a token becoming invalid). Please see the [- postOpenGraphAction:]
    // and [- requestPermissionAndPost] on `SCViewController` for further
    // error handling on other operations.
    FBErrorCategory errorCategory = [FBErrorUtility errorCategoryForError:error];
    if ([FBErrorUtility shouldNotifyUserForError:error]) {
        // If the SDK has a message for the user, surface it. This conveniently
        // handles cases like password change or iOS6 app slider state.
        alertTitle = @"Something Went Wrong";
        alertMessage = [FBErrorUtility userMessageForError:error];
    } else if (errorCategory == FBErrorCategoryAuthenticationReopenSession) {
        // It is important to handle session closures as mentioned. You can inspect
        // the error for more context but this sample generically notifies the user.
        alertTitle = @"Session Error";
        alertMessage = @"Your current session is no longer valid. Please log in again.";
    } else if (errorCategory == FBErrorCategoryUserCancelled) {
        // The user has cancelled a login. You can inspect the error
        // for more context. For this sample, we will simply ignore it.
        NSLog(@"user cancelled login");
    } else {
        // For simplicity, this sample treats other errors blindly, but you should
        // refer to https://developers.facebook.com/docs/technical-guides/iossdk/errors/ for more information.
        alertTitle = @"Unknown Error";
        alertMessage = @"Error. Please try again later.";
        NSLog(@"Unexpected error:%@", error);
    }

    if (alertMessage) {
        [[[UIAlertView alloc] initWithTitle:alertTitle
                                    message:alertMessage
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}

@end