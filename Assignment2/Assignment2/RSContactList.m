//
//  ContactList.m
//  Assignment2
//
//  Created by Raksha Singhania on 07/09/14.
//  Copyright (c) 2014 Raksha Singhania. All rights reserved.
//

#import "RSContactList.h"
#import "RSPhoneNumber.h"
#import "RSPerson.h"
#import "RSName.h"
#import "NSString+RSHelper.h"

@implementation RSContactList {
@private
    NSMutableArray *_contactList;
}

- (void)setContactList:(NSMutableArray *)contactList {
    _contactList = contactList;
}

- (NSMutableArray *)contactList {
    return _contactList;
}

/*
 This method adds a Person to the contactlist
 @param a person to be added in contactlist
 */
- (void)addPerson:(RSPerson *)newContact {
    if (self == nil) {
        return;
    }
    
    if ([self contactList] == nil) {
        [self setContactList:[[NSMutableArray alloc] initWithCapacity:0]];
    }
    
    // check for duplicates
    int count = 0;
    for (RSPerson *person in [self contactList]) {
        if ([[person name] description] != nil) {
            if ([[[person name] description] isEqualToString:[[newContact name] description]]) {
                count++;
                break;
            }
        }
    }
    
    // add new person if not already present
    if (count == 0) {
        [[self contactList] addObject:newContact];
    } else {
        [NSException raise:@"Duplicate entry" format:@"This contact already exists"];
    }
}

/*
 Gives a contact list sorted by last name in ascending order
 @return an NSArray of all your contacts ordered by last name
 */
- (NSArray *)orderedByName {
    return [[self contactList] sortedArrayUsingSelector:@selector(compare:)];
}

/*
 Given the lastName returns phone numbers for the first person in the list that has
 that last name.
 @param lastname of a contact as string
 @return an empty array if no such person exists else phone number list of the given lastname
 */
- (NSArray *)phoneNumberFor:(NSString *)lastName {
    if ([self contactList] == nil) {
        return nil;
    }
    for (RSPerson *personObj in [self contactList]) {
        NSString * personLastName = [[personObj name] lastName];
        if (personLastName != nil && [personLastName isEqualToString:lastName]) {
            return [personObj phoneNumberArr];
        }
    }
    return nil;
}

/*
 Gives the full name of the person with the given phone number.
 @param lastname of a contact as string
 @return nil if no one has the phone number, else s's full name of the given phone number
 */
- (NSString *)nameForNumber:(NSString *)phoneNumber {
    if ([self contactList] == nil) {
        return nil;
    }
    for (RSPerson *personObj in [self contactList]) {
        if([personObj phoneNumberArr] == nil) {
            continue;
        }
        for (RSPhoneNumber *number in [personObj phoneNumberArr]) {
            NSString *phoneNumber = [number phoneNumber];
            if (phoneNumber != nil && [phoneNumber isEqualToString:[phoneNumber phoneFormat]]) {
                return [[personObj name] description];
            }
        }
        
    }
    return nil;
}

@end
