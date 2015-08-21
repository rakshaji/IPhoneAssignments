//
//  ContactList.h
//  Assignment2
//
//  Created by Raksha Singhania on 07/09/14.
//  Copyright (c) 2014 Raksha Singhania. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSPerson.h"

@interface RSContactList : NSObject

/*
 This method adds a Person to the contactlist
 @param a person to be added in contactlist
 */
- (void)addPerson:(RSPerson *)newContact;

/*
 Gives a contact list sorted by last name
 @return an NSArray of all your contacts ordered by last name
 */
- (NSArray *)orderedByName;

/*
 Given the lastName returns phone numbers for the first person in the list that has
 that last name.
 @param lastname of a contact as string
 @return an empty array if no such person exists else phone number list of the given lastname
 */
- (NSArray *)phoneNumberFor:(NSString *)lastName;

/*
 Gives the full name of the person with the given phone number.
 @param lastname of a contact as string
 @return nil if no one has the phone number. else contact's full name of the given phone number
 */
- (NSString *)nameForNumber:(NSString *)phoneNumber;

- (void)setContactList:(NSMutableArray *)contactList ;

- (NSMutableArray *)contactList;

@end
