//
//  SecondViewController.m
//  Assignment4
//
//  Created by Raksha Singhania on 31/10/14.
//  Copyright (c) 2014 Raksha Singhania. All rights reserved.
//

#import "RSWebTabController.h"

@interface RSWebTabController ()
/**
 * @brief This method displays the web page associated with the url entered by the user. It does nothing if incorrect url is entered. The url entered by user should be a full url.
 */
- (IBAction)showWebPage;

/**
 * @brief This method hides the keyboard
 */
- (void)hideKeyboard;

/**
 * @brief This method overrides the functionality of return key in keyboard. It will open a web page associated with the url entered by the user.
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField;

@end

@implementation RSWebTabController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)showWebPage {
    NSString *urlText = self.urlTextField.text;
    NSURL *url = [NSURL URLWithString:urlText];
    NSURLRequest *webRequest = [NSURLRequest requestWithURL:url];
    [self.webView  loadRequest:webRequest];
}

- (void)hideKeyboard {
    [self.urlTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self hideKeyboard];
    [self showWebPage];
    return YES;
}

@end
