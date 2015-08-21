//
//  RSFoodTabController.m
//  Assignment4
//
//  Created by Raksha Singhania on 31/10/14.
//  Copyright (c) 2014 Raksha Singhania. All rights reserved.
//

#import "RSFoodTabController.h"

@interface RSFoodTabController ()

@property (strong, nonatomic) NSArray *countryList;
@property (strong, nonatomic) NSArray *indiaFoodList;
@property (strong, nonatomic) NSArray *usaFoodList;
@property (strong, nonatomic) NSArray *mexicoFoodList;

enum {
    RSIndia = 0,
    RSUsa = 1,
    RSMexico = 2,
    RSCountryComponent = 0,
    RSFoodComponent = 1
};

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;

/**
 * @brief This method gives the row number of country selected in the picker
 * @return The row of the selected country
 */
- (NSInteger)selectedCountry;

/**
 * @brief This method gives the total count of food items listed under a country
 * @param The row number of the country
 * @return The total number of items in the country
 */
- (NSInteger)countTotalFoodItemsByCountry:(NSInteger)row;

/**
 * @brief This method calculates and sets the minimum and maximum values of the slider based on selected country in the picker
 */
- (void)calculateSliderNewMinMaxValue;

/**
 * @brief This is an action method called on change of slider value. This selects proportional food item from the food picker based on value selected in slider.
 */
- (IBAction)updatePickerOnSliderValueChange;

@end

int totalItemsInFoodList;
float proportion;
static float const RSSliderMinValue = 0.0;
static float const RSSliderMaxValue = 100.0;
static NSInteger const RSPickerColumnCount = 2;

@implementation RSFoodTabController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.countryList = @[@"India", @"USA", @"Mexico"];
    
    self.indiaFoodList = @[@"Avakaya", @"Pesarattu", @"Thukpa", @"Thali", @"Litti Chokha", @"Maple"
                           , @"Palak Paneer", @"Rajma-Shawl", @"Vindaloo", @"Khaman", @"Handva"
                           , @"Bisi bele bath", @"Pav Bhaji", @"Eromba", @"Chungdi Jhola"];
    
    self.usaFoodList = @[@"Hot Dog", @"Pizza", @"Hamburger", @"Clam Chowder", @"Succotash"
                         , @"Fried Chicken", @"Fried Chicken", @"Gumbo", @"Grits", @"Chitterlings"
                         , @"Hushpuppies", @"Cobbler"];
    
    self.mexicoFoodList = @[@"Taco", @"Quesadilla", @"Pambazo", @"Tamal", @"Huarache", @"Alambre"
                            , @"Enchilada", @"Panita", @"Gordita", @"Tlayuda", @"Sincronizada"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return RSPickerColumnCount;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == RSCountryComponent) {
        return [self.countryList count];
    }
    return [self countTotalFoodItemsByCountry:[self selectedCountry]];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (component == RSCountryComponent) {
        // refresh picker to show new food list
        [pickerView reloadAllComponents];
        
        // when a country is selected, reset the selection of food list to first item
        [pickerView selectRow:0 inComponent:RSFoodComponent animated:YES];
        
        [self calculateSliderNewMinMaxValue];
        
        // reset the value of slider thumb to minimum value of the slider
        self.foodSelectionSlider.value = self.foodSelectionSlider.minimumValue;
    } else {
        int selectedRowInFoodList = [pickerView selectedRowInComponent:RSFoodComponent];
        
        // when the application loads for the very first time, proportion is 0.0
        if (proportion == 0.0) {
            [self calculateSliderNewMinMaxValue];
        }
        
        // calculate and set the new point on the slider based on food item selected
        float newPoint = proportion * selectedRowInFoodList;
        self.foodSelectionSlider.value = newPoint;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == RSCountryComponent) {
        return self.countryList[row];
    }
    
    switch ([self selectedCountry]) {
        case RSIndia:
            return self.indiaFoodList[row];
            break;
        case RSUsa:
            return self.usaFoodList[row];
            break;
        case RSMexico:
            return self.mexicoFoodList[row];
            break;
        default:
            break;
    }
    return nil;
}

- (NSInteger)selectedCountry {
    return [self.foodByCountryPicker selectedRowInComponent:RSCountryComponent];
}

- (NSInteger)countTotalFoodItemsByCountry:(NSInteger)row {
    int totalItems;
    switch (row) {
        case RSIndia:
            totalItems = self.indiaFoodList.count;
            break;
        case RSUsa:
            totalItems = self.usaFoodList.count;
            break;
        case RSMexico:
            totalItems = self.mexicoFoodList.count;
            break;
        default:
            break;
    }
    return totalItems;
}

- (void)calculateSliderNewMinMaxValue {
    totalItemsInFoodList = [self countTotalFoodItemsByCountry:[self selectedCountry]];
    proportion = RSSliderMaxValue / (float)totalItemsInFoodList;
    self.foodSelectionSlider.minimumValue = RSSliderMinValue;
    self.foodSelectionSlider.maximumValue = proportion * (totalItemsInFoodList - 1);
}

- (IBAction)updatePickerOnSliderValueChange {
    float sliderValueSelectedByUser = self.foodSelectionSlider.value;
    int newFoodPickerRow = 0;
    
    for(float count = 0.0; count < totalItemsInFoodList; count++){
        float nearestLeftPoint = (count * proportion);
        float nearestRightPoint = ((count + 1.0) * proportion);
        
        if (sliderValueSelectedByUser == nearestLeftPoint) {
            newFoodPickerRow = (int)count;
            break;
        } else if (sliderValueSelectedByUser == nearestRightPoint) {
            newFoodPickerRow = (int)count + 1;
            break;
        } else if (sliderValueSelectedByUser > nearestLeftPoint
                 && sliderValueSelectedByUser < nearestRightPoint) {
            int deltaOfNewValue = sliderValueSelectedByUser - nearestLeftPoint;
            if (deltaOfNewValue < (proportion * 0.5)) {
                newFoodPickerRow = (int)count;
            } else {
                newFoodPickerRow = (int)count + 1;
            }
            break;
        }
    }
    
    [self.foodByCountryPicker selectRow:(NSInteger)newFoodPickerRow inComponent:RSFoodComponent animated:YES];
}

@end
