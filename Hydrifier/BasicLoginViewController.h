//
//  BasicLoginViewController.h
//  Hydrifier
//
//  Created by Dimitar Topalov on 10/19/14.
//  Copyright (c) 2014 DIvan. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Parse;

@interface BasicLoginViewController : UIViewController

- (void)loginWithUsername:(NSString *)username andPassword:(NSString *)password;
- (void)registerWithUsername:(NSString *)username password:(NSString *)password andEmail:(NSString *)email;
- (void)registerUser:(PFUser *)user;

@end
