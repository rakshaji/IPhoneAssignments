//
//  RSSegmentedTabController.m
//  Assignment4
//
//  Created by Raksha Singhania on 31/10/14.
//  Copyright (c) 2014 Raksha Singhania. All rights reserved.
//

#import "RSSegmentedTabController.h"

@interface RSSegmentedTabController ()

enum {
    RSProgressSegment,
    RSTextSegment,
    RSAlertSegment
};

/**
 * @brief This is an action method called wherever a segment is tapped. On tap of a segment, it show view associated with the selected segment.
 * @param The control which has invoked this action
 */
- (IBAction)segmentValueChanged:(UISegmentedControl*)sender;

/**
 * @brief This method shows an alert on click of button
 */
- (IBAction)showAlert;

/**
 * @brief This method is called whenever switch value is changed. It spins or stops activity indicator based on selected switch value.
 * @param The control which has invoked this action
 */
- (IBAction)switchValueChanged:(UISwitch*)sender;

/**
 * @brief This method hides the keyboard
 */
- (void)hideKeyboard;

@end

@implementation RSSegmentedTabController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)segmentValueChanged:(UISegmentedControl*)sender {
    [self hideKeyboard];
    switch (sender.selectedSegmentIndex) {
        case RSProgressSegment:
            self.textSegmentView.hidden = YES;
            self.alertView.hidden = YES;
            self.progressView.hidden = NO;
            break;
        case RSTextSegment:
            self.textSegmentView.hidden = NO;
            self.alertView.hidden = YES;
            self.progressView.hidden = YES;
            break;
        case RSAlertSegment:
            self.textSegmentView.hidden = YES;
            self.alertView.hidden = NO;
            self.progressView.hidden = YES;
            break;
        default:
            break;
    }
}

- (IBAction)showAlert {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@""
                                                        message:@"Do you like the iPhone?"
                                                       delegate:self
                                              cancelButtonTitle:@"No"
                                              otherButtonTitles:@"Yes", nil];
    [alertView show];
}

- (IBAction)switchValueChanged:(UISwitch*)sender {
    if (sender.on) {
        [self.activityIndicator startAnimating];
    } else {
        [self.activityIndicator stopAnimating];
    }
}

- (void)hideKeyboard {
    [self.textArea resignFirstResponder];
}

@end
