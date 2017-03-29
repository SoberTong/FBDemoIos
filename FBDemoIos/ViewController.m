//
//  ViewController.m
//  FBDemoIos
//
//  Created by Avidly on 2017/3/3.
//  Copyright © 2017年 Avidly. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKLoginKit/FBSDKLoginManager.h>
#import <FBSDKCoreKit/FBSDKAccessToken.h>

@interface ViewController () <FBSDKLoginButtonDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    // Optional: Place the button in the center of your view.
    loginButton.center = self.view.center;
    loginButton.delegate = self;
    loginButton.readPermissions = @[@"public_profile", @"user_friends"];
    [self.view addSubview:loginButton];
}

- (void)        loginButton:(FBSDKLoginButton *)loginButton
      didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                      error:(NSError *)error
{
    NSLog(@"%@", result);
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton
{
    NSLog(@"%@", loginButton);
}

- (IBAction)loginClick:(id)sender {
    
    NSLog(@"login with Facebook");
    if ([FBSDKAccessToken currentAccessToken]) {
        [self gotoNextView];
    }else{
        FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
    [loginManager logInWithReadPermissions:@[@"public_profile"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            NSLog(@"login error:%@", error);
        }else if(result.isCancelled) {
            NSLog(@"login cancel");
        }else {
            [self gotoNextView];
        }
    }];
    }
}

-(void)gotoNextView {
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"First" bundle:nil] instantiateViewControllerWithIdentifier:@"First"];
            [self presentViewController:/*[[MainViewController alloc] init]*/vc animated:true completion:^{
                NSLog(@"login success.");
            }];
}

@end
