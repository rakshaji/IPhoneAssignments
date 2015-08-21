//
//  ViewController.h
//  Assignment3
//
//  Created by Raksha Singhania on 01/10/14.
//  Copyright (c) 2014 Raksha Singhania. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *inputTextLabel;

@property (strong, nonatomic) IBOutlet UILabel *xLabel;

@property (strong, nonatomic) IBOutlet UILabel *yLabel;

@property (strong, nonatomic) IBOutlet UIButton *updateButton;

@property (strong, nonatomic) IBOutlet UITextField *inputText;

@property (strong, nonatomic) IBOutlet UITextField *inputX;

@property (strong, nonatomic) IBOutlet UITextField *inputY;

@property (strong, nonatomic) IBOutlet UILabel *movingLabel;

/*
 This method is called on click of update button. It updates the label with new value and moves it to new location.
 */
- (IBAction)updateDisplay;

/*
 This method hides the keyboard.
 */
- (void)hideKeyboard;

@end
