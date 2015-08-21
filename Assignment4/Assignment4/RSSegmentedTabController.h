//
//  RSSegmentedTabController.h
//  Assignment4
//
//  Created by Raksha Singhania on 31/10/14.
//  Copyright (c) 2014 Raksha Singhania. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSegmentedTabController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *switchControl;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIView *alertView;
@property (strong, nonatomic) IBOutlet UIView *progressView;
@property (strong, nonatomic) IBOutlet UIView *textSegmentView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) IBOutlet UITextView *textArea;
@property (strong, nonatomic) IBOutlet UIButton *alertButton;

@end
