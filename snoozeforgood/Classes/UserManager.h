//
// Created by Fabrice Armisen on 12/14/13.
// Copyright (c) 2013 reallocate. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "ObjCSingleton.h"
#import "FBLoginView.h"


@interface UserManager : ObjCSingleton
@property(nonatomic, readonly) BOOL isLoggedIn;


- (void)signout;

- (void)openFaceBookSession;

- (void)handleError:(NSError *)error;
@end