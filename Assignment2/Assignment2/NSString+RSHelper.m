//
//  NSString+RSHelper.m
//  Assignment2
//
//  Created by Raksha Singhania on 10/09/14.
//  Copyright (c) 2014 Raksha Singhania. All rights reserved.
//

#import "NSString+RSHelper.h"
#import "RSPhoneNumber.h"

@implementation NSString (RSHelper)

/*
 This method returns phone number in this format XXX-XXX-XXXX.
 @return formatted phone number as string, otherwise nil for invalid inputs
 */
- (NSString*)phoneFormat {
    NSString *formattedPhoneNumber;
    
    // regular expressions for all the patterns of phone number
    NSRegularExpression *twoSpaceFormat = [NSRegularExpression regularExpressionWithPattern:@"\\d{3} \\d{3} \\d{4}"
                                                                                    options:0
                                                                                      error:nil];
    NSRegularExpression *noSpaceFormat = [NSRegularExpression regularExpressionWithPattern:@"\\d{10}"
                                                                                   options:0
                                                                                     error:nil];
    NSRegularExpression *oneSpaceFormat = [NSRegularExpression regularExpressionWithPattern:@"\\d{3} \\d{7}"
                                                                                    options:0
                                                                                      error:nil];
    NSRegularExpression *dashFormat = [NSRegularExpression regularExpressionWithPattern:@"\\d{3}-\\d{3}-\\d{4}"
                                                                                options:0
                                                                                  error:nil];
    
    if ([twoSpaceFormat numberOfMatchesInString:self options:0 range:NSMakeRange(0, [self length])] > 0
        || [noSpaceFormat numberOfMatchesInString:self options:0 range:NSMakeRange(0, [self length])] > 0
        || [oneSpaceFormat numberOfMatchesInString:self options:0 range:NSMakeRange(0, [self length])] > 0) {
        
        // remove all spaces from the input
        formattedPhoneNumber = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        // divide into 3 parts as areacode, secondPart and thirdPart then format in xxx-xxx-xxxx form
        NSString *areaCode = [formattedPhoneNumber substringWithRange:NSMakeRange(0,3)];
        NSString *secondPart = [formattedPhoneNumber substringWithRange:NSMakeRange(3,3)];
        NSString *thirdPart = [formattedPhoneNumber substringWithRange:NSMakeRange(6,4)];
        formattedPhoneNumber = [NSString stringWithFormat:@"%@-%@-%@",areaCode, secondPart, thirdPart];
        
    } else if ([dashFormat numberOfMatchesInString:self options:0 range:NSMakeRange(0, [self length])] > 0) {
        formattedPhoneNumber = self;
    }
    return formattedPhoneNumber;
}

/*
 This method returns a PhoneNumber object with the
 given type and number. If the string is not of the format "type: number" then throws an exception.
 @return if imput is in correct format returns PhoneNumber object else throws "Invalid Argument Exception"
 */
- (RSPhoneNumber*)asPhoneNumber {
    NSArray *splitStrings = [self componentsSeparatedByString:@":"];
    if([splitStrings count] == 2){
        RSPhoneNumber *phoneNumber = [RSPhoneNumber type:[splitStrings objectAtIndex:0]
                                                  number:[splitStrings objectAtIndex:1]];
        return phoneNumber;
    }else{
        [NSException raise:@"Invalid Argument Exception" format:@"Expected input format \'type: number\'"];
    }
    return 0;
}

@end
