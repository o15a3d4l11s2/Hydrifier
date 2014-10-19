//
//  LoginViewController.m
//  Hydrifier
//
//  Created by Dimitar Topalov on 10/19/14.
//  Copyright (c) 2014 DIvan. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.usernameTextField) {
        [self.passwordTextField becomeFirstResponder];
    } else {
        [self loginButtonPressed];
    }
    return YES;
}

- (IBAction)loginButtonPressed
{
    [self loginWithCredentials];
}

- (void)loginWithCredentials
{
    [self loginWithUsername:self.usernameTextField.text andPassword:self.passwordTextField.text];
}


@end
