//
//  Person.h
//  Assignment2
//
//  Created by Raksha Singhania on 07/09/14.
//  Copyright (c) 2014 Raksha Singhania. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSName.h"
#import "RSPhoneNumber.h"

@interface RSPerson : NSObject

/*
 Creates a new Person object with given firstname and lastname
 @return Person object with initialized values
 */
+ (id)firstName:(NSString *)firstName lastName:(NSString *)lastName;

/*
 Adds a phone number for a person
 @param a phone number as RSPhoneNumber
 */
- (void)setPhoneNumber:(RSPhoneNumber *)number;

/*
 The full name of the person in the form "(FirstName LastName)"
 @return object description as string
 */
- (NSString*)description;

/*
 Gives the person's phone number of the given type.
 @return phone number as string or nil if number does not exist.
 */
- (NSString *)phoneNumber:(NSString *)phoneType;

/*
 Checks if the person has given phone number
 @return true, if person has given phoneNumber
 */
- (BOOL)hasNumber:(NSString *)phoneNumber;

/*
 Compares two persons with their last name and returns how they compare in order
 @return order as NSComparisonResult
 */
- (NSComparisonResult)compare:(RSPerson *)person;

- (void)setName:(RSName *)name ;

- (void)setPhoneNumberArr:(NSMutableArray *)phoneNumberArr;

- (RSName *)name ;

- (NSMutableArray *)phoneNumberArr;

@end
