//
//  Person.m
//  Assignment2
//
//  Created by Raksha Singhania on 07/09/14.
//  Copyright (c) 2014 Raksha Singhania. All rights reserved.
//

#import "RSPerson.h"
#import "NSString+RSHelper.h"

@implementation RSPerson {
@private
    RSName *_name;
    NSMutableArray *_phoneNumberArr;
}

- (void)setName:(RSName *)name {
    _name = name;
}

- (void)setPhoneNumberArr:(NSMutableArray *)phoneNumberArr {
    _phoneNumberArr = phoneNumberArr;
}

- (RSName *)name {
    return _name;
}

- (NSMutableArray *)phoneNumberArr {
    return _phoneNumberArr;
}

/*
 Creates a new Person object with given firstname and lastname
 @return Person object with initialized values
 */
+ (id)firstName:(NSString *)firstName lastName:(NSString *)lastName {
    RSPerson *person = [[RSPerson alloc] init];
    if(person != nil) {
        [person setName:[RSName firstName:firstName lastName:lastName]];
    }
    return person;
}

/*
 Adds a phone number to a person
 @param a phone number as RSPhoneNumber
 */
- (void)setPhoneNumber:(RSPhoneNumber *)number {
    if ([self phoneNumberArr] == nil) {
        [self setPhoneNumberArr:[[NSMutableArray alloc] initWithCapacity:0]];
    }
    
    RSPhoneNumber *newPhoneNumber = [RSPhoneNumber type:[number phoneType]
                                                 number:[[number phoneNumber] phoneFormat]];
    
    // check for duplicates
    int count = 0;
    for (RSPhoneNumber *number in [self phoneNumberArr]) {
        if ([newPhoneNumber phoneType] != nil
            && [[newPhoneNumber phoneType] isEqualToString:[number phoneType]]) {
            count++;
            break;
        }
    }
    
    // add new number if not already present
    if (count == 0) {
        [[self phoneNumberArr] addObject:newPhoneNumber];
    } else {
        [NSException raise:@"Duplicate entry" format:@"This phone type already exists"];
    }
}

/*
 The full name of the person in the form "(FirstName LastName)"
 @return object description as string
 */
- (NSString*)description {
    return [[self name] description];
}

/*
 Gives the person's phone number of the given type.
 @return phone number as string or nil if number does not exist.
 */
- (NSString *)phoneNumber:(NSString *)phoneType {
    if ([self phoneNumberArr] == nil) {
        return nil;
    }
    for (RSPhoneNumber *number in [self phoneNumberArr]) {
        if ([number phoneType] != nil && [[number phoneType] isEqualToString:phoneType]) {
            return [number phoneNumber];
        }
    }
    return nil;
}

/*
 Checks if the person has given phone number
 @return true, if person has given phoneNumber
 */
- (BOOL)hasNumber:(NSString *)phoneNumber {
    if ([self phoneNumberArr] == nil) {
        return NO;
    }
    for (RSPhoneNumber *number in [self phoneNumberArr]) {
        NSString *phoneNum = [number phoneNumber];
        if (phoneNum != nil && [phoneNum isEqualToString:[phoneNumber phoneFormat]]) {
            return YES;
        }
    }
    return NO;
}

/*
 Compares two persons with their last name and returns how they compare in order
 @return order as NSComparisonResult
 */
- (NSComparisonResult)compare:(RSPerson *)person {
    NSString *lastName = [[self name] lastName];
    if (lastName == nil) {
        return 0;
    }
    if ([lastName isGreaterThan:[[person name] lastName]]) {
        return (NSComparisonResult) NSOrderedDescending;
    } else {
        return (NSComparisonResult) NSOrderedAscending;
    }
    return NSOrderedSame;
}

@end
