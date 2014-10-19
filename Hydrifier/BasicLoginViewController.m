//
//  BasicLoginViewController.m
//  Hydrifier
//
//  Created by Dimitar Topalov on 10/19/14.
//  Copyright (c) 2014 DIvan. All rights reserved.
//

#import "BasicLoginViewController.h"
#import "User.h"
#import "AppDelegate.h"

@interface BasicLoginViewController ()

@end

@implementation BasicLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginWithUsername:(NSString *)username andPassword:(NSString *)password
{
    [User loginWithUsername:username andPassword:password withSuccessHandler:^{
        AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
        [appDelegate showInitialView];
    } failureHandler:^(NSString *error) {
        [[[UIAlertView alloc] initWithTitle:@"Error" message:error delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
    }];
}

- (void)registerWithUsername:(NSString *)username password:(NSString *)password andEmail:(NSString *)email
{
    PFUser *user = [PFUser user];
    user.username = username;
    user.password = password;
    user.email = email;
    
    [self registerUser:user];
}

- (void)registerUser:(PFUser *)user
{
    [User registerUser:user withSuccessHandler:^{
        [self loginWithUsername:user.username andPassword:user.password];
    } failureHandler:^(NSString *error) {
        [[[UIAlertView alloc] initWithTitle:@"Error" message:error delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
    }];
}

@end
