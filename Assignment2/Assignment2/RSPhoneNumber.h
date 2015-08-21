//
//  PhoneNumber.h
//  Assignment2
//
//  Created by Raksha Singhania on 07/09/14.
//  Copyright (c) 2014 Raksha Singhania. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSPhoneNumber : NSObject

typedef enum {
    kMobile,
    kWork,
    kMain,
    kHome,
    kHomeFax,
    kWorkFax,
    kPager,
    kOther
} PhoneType;

+ (NSString*)phoneTypeToString:(PhoneType)phoneType ;

/*
 Creates a new PhoneNumber object with given phone type and number
 @param phone type and number as NSString
 @return PhoneNumber object
 */
+ (id)type:(NSString *)phoneType number:(NSString *)number;

/*
 Provides the phone number in format xxx-xxx-xxxx
 @return Formated phone number as NSString or returns nil.
 */
- (NSString *)number;

/*
 Checks if the phone number type is mobile
 @return true if the phone number is for a mobile phone.
 */
- (BOOL)isMobile;

/*
 Checks if the phone number is local number of SD
 @return true if the phone number has the area code 619 or 858.
 */
- (BOOL)isLocal;

/*
 A string description of the phone number in the format "type: number".
 @return description as NSString
 */
- (NSString *)description;

- (void)setPhoneNumber:(NSString *)phoneNumber;

- (void)setPhoneType:(NSString *)phoneType;

- (NSString *)phoneNumber;

- (NSString *)phoneType;

@end
