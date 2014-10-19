//
//  User.m
//  Hydrifier
//
//  Created by Dimitar Topalov on 10/19/14.
//  Copyright (c) 2014 DIvan. All rights reserved.
//

#import "User.h"

@implementation User

+ (void)registerUser:(PFUser *)user
  withSuccessHandler:(void(^)(void))successHandler
      failureHandler:(void(^)(NSString *error))failureHandler
{
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"Successful");
            dispatch_async(dispatch_get_main_queue(), ^(void) {
                successHandler();
            });
        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"Error: %@", errorString);
            dispatch_async(dispatch_get_main_queue(), ^(void) {
                failureHandler(errorString);
            });
        }
    }];
}

+ (void)loginWithUsername:(NSString *)username
              andPassword:(NSString *)password
       withSuccessHandler:(void(^)(void))successHandler
           failureHandler:(void(^)(NSString *error))failureHandler
{
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
        if (user) {
            NSLog(@"Successful");
            dispatch_async(dispatch_get_main_queue(), ^(void) {
                successHandler();
            });
        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"Error: %@", errorString);
            dispatch_async(dispatch_get_main_queue(), ^(void) {
                failureHandler(errorString);
            });
        }
    }];
}

+ (void)logout
{
    [PFUser logOut];
}

@end
