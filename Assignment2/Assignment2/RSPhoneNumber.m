//
//  PhoneNumber.m
//  Assignment2
//
//  Created by Raksha Singhania on 07/09/14.
//  Copyright (c) 2014 Raksha Singhania. All rights reserved.
//

#import "RSPhoneNumber.h"
#import "NSString+RSHelper.h"

@implementation RSPhoneNumber {
@private
    NSString *_phoneType;
    NSString *_phoneNumber;
}

NSString *const kSDAreaCode1 = @"619";
NSString *const kSDAreaCode2 = @"858";

- (void)setPhoneNumber:(NSString *)phoneNumber {
    _phoneNumber = phoneNumber;
}

- (void)setPhoneType:(NSString *)phoneType {
    _phoneType = phoneType;
}

- (NSString *)phoneNumber {
    return _phoneNumber;
}

- (NSString *)phoneType{
    return _phoneType;
}

/*
 Creates a new PhoneNumber object with given phone type and number
 @param phone type and number as NSString
 @return PhoneNumber object
 */
+ (id)type:(NSString *)phoneType number:(NSString *)number {
    //NSString *str = PhoneType_toString[theEnumValue];
    RSPhoneNumber *phoneNumberObj = [[RSPhoneNumber alloc] init];
    if(phoneNumberObj != nil){
        [phoneNumberObj setPhoneType:phoneType];
        [phoneNumberObj setPhoneNumber:number];
    }
    return phoneNumberObj;
}

/*
 Provides the phone number in format xxx-xxx-xxxx
 @return Formated phone number as NSString or returns nil.
 */
- (NSString *)number {
    return [self phoneNumber] != nil? [[self phoneNumber] phoneFormat] : nil;
}

/*
 Checks if the phone number type is mobile
 @return true if the phone number is for a mobile phone.
 */
- (BOOL)isMobile {
    return [self phoneType] != nil ? [[self phoneType] isEqualToString:[RSPhoneNumber phoneTypeToString:kMobile]] : NO;
}

/*
 Checks if the phone number is local number of SD
 @return true if the phone number has the area code 619 or 858.
 */
- (BOOL)isLocal {
    if ([self number] != nil) {
        NSString *areaCode = [[self number] substringWithRange:NSMakeRange(0,3)];
        return [areaCode isEqualToString:kSDAreaCode1] || [areaCode isEqualToString:kSDAreaCode2];
    }
    return NO;
}

/*
 A string description of the phone number in the format "type: number".
 @return description as NSString
 */
- (NSString *)description {
    return [NSString stringWithFormat:@"%@: %@", [self phoneType], [self number]];
}

+ (NSString*)phoneTypeToString:(PhoneType)phoneType {
    NSString *result = nil;
    
    switch(phoneType) {
        case kMobile:
            result = @"Mobile";
            break;
        case kWork:
            result = @"Work";
            break;
        case kMain:
            result = @"Main";
            break;
        case kHome:
            result = @"Home";
            break;
        case kHomeFax:
            result = @"HomeFax";
            break;
        case kWorkFax:
            result = @"WorkFax";
            break;
        case kOther:
            result = @"Pager";
            break;
        case kPager:
            result = @"Other";
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected PhoneType."];
    }
    
    return result;
}

@end
