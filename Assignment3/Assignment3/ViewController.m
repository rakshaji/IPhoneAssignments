//
//  ViewController.m
//  Assignment3
//
//  Created by Raksha Singhania on 01/10/14.
//  Copyright (c) 2014 Raksha Singhania. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/*
 This method creates a file for saving application data and returns the file path.
 @return filepath as NSString
 */
- (NSString *)filePathForApplicationData;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // set appropriate keyboard type and enable clear button for textfields
    self.inputText.keyboardType = UIKeyboardTypeDefault;
    self.inputText.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.inputX.keyboardType = UIKeyboardTypeDecimalPad;
    self.inputX.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.inputY.keyboardType = UIKeyboardTypeDecimalPad;
    self.inputY.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    // load saved data
    NSString *filePath = [self filePathForApplicationData];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    if (fileExists) {
        NSMutableDictionary *lastStoredData = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
        self.inputText.text = [lastStoredData objectForKey:@"inputText"];
        self.inputX.text = [lastStoredData objectForKey:@"X-value"];
        self.inputY.text = [lastStoredData objectForKey:@"Y-value"];
    }
    
    // register to receive notifications for applicationDidEnterBackground event
    UIApplication *uiApp = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidEnterBackground:)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:uiApp];

}

- (void)didReceiveMemoryWarning
{
    // Dispose of any resources that can be recreated.
    [super didReceiveMemoryWarning];
}

/*
 This method updates the label with new value and also moves it to new location.
 */
- (IBAction)updateDisplay {
    [self hideKeyboard];
    
    // update the moving label with new text
    self.movingLabel.text = self.inputText.text;
    [self.movingLabel sizeToFit];
    
    CGFloat xValue = [self.inputX.text floatValue];
    CGFloat yValue = [self.inputY.text floatValue];
    // check for the invalid values of x and y
    if(xValue != 0.0 && yValue != 0.0){
        // change the co-ordinates of moving label
        self.movingLabel.center = CGPointMake(xValue, yValue);
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // set data as key-value pair
    NSMutableDictionary *dataToBeStored = [[NSMutableDictionary alloc]init];
    [dataToBeStored setObject:self.inputText.text forKey:@"inputText"];
    [dataToBeStored setObject:self.inputX.text forKey:@"X-value"];
    [dataToBeStored setObject:self.inputY.text forKey:@"Y-value"];
    
    // write to file
    [dataToBeStored writeToFile:[self filePathForApplicationData] atomically:YES];
}

/*
 This method creates a file for saving application data and returns the file path.
 @return filepath as NSString
 */
- (NSString *)filePathForApplicationData {
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[path objectAtIndex:0] stringByAppendingPathComponent:@"datafile.plist"];
    return filePath;
}

/*
 This method hides the keyboard.
 */
- (void)hideKeyboard {
    [self.inputText resignFirstResponder];
    [self.inputX resignFirstResponder];
    [self.inputY resignFirstResponder];
}

/*
 Handler for touchesBegan event.
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self hideKeyboard];
    
    // get the location of touch
    UITouch *aTouch = [touches anyObject];
    CGPoint location = [aTouch locationInView:self.view];
    
    // change the center of moving label on user touch
    self.movingLabel.center = CGPointMake(location.x, location.y);
}

/*
 Handler for touchesMoved event.
 */
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    // get the location of touch
    UITouch *aTouch = [touches anyObject];
    CGPoint location = [aTouch locationInView:self.view];
    
    // change the center of moving label on user touch movement
    self.movingLabel.center = CGPointMake(location.x, location.y);
    
    // update the x and y text fields with new co-ordinates
    self.inputX.text = [[NSNumber numberWithDouble:location.x] stringValue];
    self.inputY.text = [[NSNumber numberWithDouble:location.y] stringValue];
}


@end
