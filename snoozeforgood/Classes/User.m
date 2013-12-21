//
// Created by Fabrice Armisen on 12/17/13.
// Copyright (c) 2013 reallocate. All rights reserved.
//


#import "User.h"


@implementation User {

}
+ (User *)currentUser {
    return (User *)[PFUser currentUser];
}

@dynamic firstName;
@dynamic lastName;
@dynamic middleName;


@end