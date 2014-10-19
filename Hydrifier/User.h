//
//  User.h
//  Hydrifier
//
//  Created by Dimitar Topalov on 10/19/14.
//  Copyright (c) 2014 DIvan. All rights reserved.
//

#import <Foundation/Foundation.h>
@import Parse;

@interface User : NSObject

+ (void)registerUser:(PFUser *)user
  withSuccessHandler:(void(^)(void))successHandler
      failureHandler:(void(^)(NSString *error))failureHandler;

+ (void)loginWithUsername:(NSString *)username
              andPassword:(NSString *)password
       withSuccessHandler:(void(^)(void))successHandler
           failureHandler:(void(^)(NSString *error))failureHandler;

+ (void)logout;

@end
