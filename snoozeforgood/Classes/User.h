//
// Created by Fabrice Armisen on 12/17/13.
// Copyright (c) 2013 reallocate. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <Parse/PFUser.h>

@interface User : PFUser<PFSubclassing>
@property (retain) NSString *lastName;
@property (retain) NSString *middleName;
@property (retain) NSString *firstName;

+ (User *)currentUser;
@end