//
// Created by Fabrice Armisen on 12/14/13.
// Copyright (c) 2013 reallocate. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "ObjCSingleton.h"
#import "FBLoginView.h"


@interface UserManager : ObjCSingleton<FBLoginViewDelegate>
@property(nonatomic) BOOL isLoggedIn;

- (void)signout;
@end