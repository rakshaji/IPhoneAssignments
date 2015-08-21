//
//  NSString+RSHelper.h
//  Assignment2
//
//  Created by Raksha Singhania on 10/09/14.
//  Copyright (c) 2014 Raksha Singhania. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSPhoneNumber.h"

@interface NSString (RSHelper)

/*
 This method returns phone number in this format XXX-XXX-XXXX.
 @return formatted phone number as string, otherwise nil for invalid inputs
 */
- (NSString*)phoneFormat;

/*
 This method returns a PhoneNumber object with the
 given type and number. If the string is not of the format "type: number" then throws an exception.
 @return if imput is in correct format returns PhoneNumber object else throws "Invalid Argument Exception"
 */
- (RSPhoneNumber*)asPhoneNumber;

@end
