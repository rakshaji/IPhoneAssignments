//
//  RSFoodTabController.h
//  Assignment4
//
//  Created by Raksha Singhania on 31/10/14.
//  Copyright (c) 2014 Raksha Singhania. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSFoodTabController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *foodByCountryPicker;
@property (strong, nonatomic) IBOutlet UISlider *foodSelectionSlider;

@end
