//
// Created by Fabrice Armisen on 12/14/13.
// Copyright (c) 2013 reallocate. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "ObjCSingleton.h"


@interface UserManager : ObjCSingleton
@property(nonatomic, readonly) BOOL isLoggedIn;
@end