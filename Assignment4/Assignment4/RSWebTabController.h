//
//  SecondViewController.h
//  Assignment4
//
//  Created by Raksha Singhania on 31/10/14.
//  Copyright (c) 2014 Raksha Singhania. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSWebTabController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *urlTextField;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
