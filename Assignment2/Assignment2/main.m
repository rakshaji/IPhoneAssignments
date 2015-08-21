//
//  main.m
//  Assignment2
//
//  Created by Raksha Singhania on 06/09/14.
//  Copyright (c) 2014 Raksha Singhania. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+RSHelper.h"
#import "RSPhoneNumber.h"
#import "RSName.h"
#import "RSPerson.h"
#import "RSContactList.h"

NSString *const kYes = @"Yes";
NSString *const kNo = @"No";

void addPhoneNumberToPerson(RSPerson *person, RSPhoneNumber *phoneNumber) {
    @try {
        [person setPhoneNumber:phoneNumber];
        NSLog(@"%@ added", [phoneNumber description]);
    }
    @catch (NSException *exception) {
        NSLog(@"Exception on adding a phone number: %@", [exception description]);
    }
}

void printLogToTestPhoneFormat(NSString *number) {
    NSLog(@"Formatted phone number for \'%@\': %@",number, [number phoneFormat]);
}

void printLogToTestPhoneNumber(NSString *type, NSString *phoneNum) {
    RSPhoneNumber *phoneNumber = [RSPhoneNumber type:type number:phoneNum];
    if(phoneNumber != nil) {
        NSLog(@"The formatted phone number: %@", [phoneNumber number]);
        NSLog(@"The phone number description- %@", phoneNumber);
        NSLog(@"Is mobile number: %@", [phoneNumber isMobile] ? kYes : kNo);
        NSLog(@"Is local number: %@", [phoneNumber isLocal] ? kYes : kNo);
    }
}

void printLogToTestValidPhoneTypeAndNum(NSString *validPhoneTypeAndNum) {
    RSPhoneNumber *phoneNumber = [validPhoneTypeAndNum asPhoneNumber];
    NSLog(@"The phone number for \'%@\': %@",validPhoneTypeAndNum, [phoneNumber phoneNumber]);
    NSLog(@"The phone type for \'%@\': %@",validPhoneTypeAndNum, [phoneNumber phoneType]);
}

void printLogToTestInvalidPhoneTypeAndNum(NSString *invalidPhone) {
    @try{
        RSPhoneNumber *invalidPhoneNumber = [invalidPhone asPhoneNumber];
        NSLog(@"The phone number for \'%@': %@", invalidPhoneNumber, [invalidPhoneNumber phoneNumber]);
    }
    @catch (NSException *exception) {
        NSLog(@"Error on invalid input: %@", [exception description]);
    }
}

void printLogToTestPerson() {
    NSString *workFaxNumber = @"619-595-6191";
    NSString *mobileNumber = @"619-595-6100";
    NSString *wrongMobileNumber = @"098-765-4321";
    NSString *const kWorkFaxType = [RSPhoneNumber phoneTypeToString:kWorkFax];
    NSString *const kHomeType = [RSPhoneNumber phoneTypeToString:kHome];
    NSString *const kMobileType = [RSPhoneNumber phoneTypeToString:kMobile];
    
    RSPhoneNumber *workFaxPhoneNumber = [RSPhoneNumber type:kWorkFaxType number:workFaxNumber];
    RSPhoneNumber *mobilePhoneNumber = [RSPhoneNumber type:kMobileType number:mobileNumber];
    RSPerson *person = [RSPerson firstName:@"Raksha" lastName:@"Singhania"];
    
    addPhoneNumberToPerson(person, workFaxPhoneNumber);// add a phone number
    addPhoneNumberToPerson(person, mobilePhoneNumber);// add different phone number
    addPhoneNumberToPerson(person, workFaxPhoneNumber);// add same phone number again
    
    if(person != nil){
        NSLog(@"Check person description: %@", [person description]);
        NSLog(@"Check phone number of \'%@\': %@", kWorkFaxType, [person phoneNumber:kWorkFaxType]);
        NSLog(@"Does phone number of given type \'%@\' exist?: %@", kHomeType, [person phoneNumber:kHomeType] == nil? kYes : kNo);
        NSLog(@"Check person has number \'%@\': %@", workFaxNumber, [person hasNumber:workFaxNumber]? kYes : kNo);
        NSLog(@"Check person has number \'%@\': %@", wrongMobileNumber, [person hasNumber:wrongMobileNumber]? kYes : kNo);
    }
}

void printLogToTestContactList() {
    NSString *workFaxNumber = @"619-595-6191";
    NSString *mobileNumber = @"619-595-6100";
    
    
    RSPhoneNumber *workFaxPhoneNumber = [RSPhoneNumber type:[RSPhoneNumber phoneTypeToString:kWorkFax]
                                                     number:workFaxNumber];
    RSPhoneNumber *mobilePhoneNumber = [RSPhoneNumber type:[RSPhoneNumber phoneTypeToString:kMobile]
                                                    number:mobileNumber];
    
    // create a contact list
    RSContactList *contactList = [[RSContactList alloc] init];
    
    // create 4 persons
    RSPerson *aPerson = [RSPerson firstName:@"Raksha" lastName:@"Singhania"];
    RSPerson *personWithSameFirstName = [RSPerson firstName:@"Raksha" lastName:@"Singhal"];
    RSPerson *personWithSameLastName = [RSPerson firstName:@"Bikash" lastName:@"Singhal"];
    RSPerson *personWithDifferentFirstAndLastName = [RSPerson firstName:@"Aishwarya"
                                                               lastName:@"Chatt"];
    // add phone number to each person
    addPhoneNumberToPerson(aPerson, workFaxPhoneNumber);
    addPhoneNumberToPerson(personWithSameFirstName, mobilePhoneNumber);
    addPhoneNumberToPerson(personWithSameLastName, workFaxPhoneNumber);
    addPhoneNumberToPerson(personWithDifferentFirstAndLastName, workFaxPhoneNumber);
    
    NSString *contactLastName = @"Singhal";
    NSString *anotherContactLastName = @"Singhania";
    
    // Check nil case when no contacts are added yet
    NSArray *numbers = [contactList phoneNumberFor:contactLastName];
    NSLog(@"Check nil case, phone numbers for \'%@\': %@",contactLastName, [numbers description]);
    NSString *fullname = [contactList nameForNumber:mobileNumber];
    NSLog(@"Check nil case, contact's fullname for \'%@\': %@", mobileNumber, fullname);
    
    // add 3 contacts
    [contactList addPerson:personWithSameFirstName];// Raksha Singhal
    [contactList addPerson:personWithSameLastName];// Bikash Singhal
    [contactList addPerson:aPerson];// Raksha Singhania
    [contactList addPerson:personWithDifferentFirstAndLastName];// Aishwarya Chatt
    NSLog(@"Four contacts added to contact list");
    
    // retrieve phone numbers from given lastname (if any)
    numbers = [contactList phoneNumberFor:contactLastName];
    NSLog(@"Check phone numbers for last name \'%@\': %@",contactLastName, [numbers description]);
    
    numbers = [contactList phoneNumberFor:anotherContactLastName];
    NSLog(@"Check phone numbers for last name \'%@\': %@",workFaxNumber, [numbers description]);
    
    // retrieve full name for the given number (if any)
    fullname = [contactList nameForNumber:mobileNumber];
    NSLog(@"Check contact's fullname for given number \'%@\': %@", mobileNumber, fullname);
    
    fullname = [contactList nameForNumber:workFaxNumber];
    NSLog(@"Check contact's fullname for given number \'%@\': %@",workFaxNumber, fullname);
    
    // check sorting by lastname
    NSLog(@"Check contact's sorted by last name: %@", [contactList orderedByName]);
}


void printLogToTestName() {
    RSName *aName = [RSName firstName:@"Raksha" lastName:@"Singhal"];
    RSName *sameLastName = [RSName firstName:@"Bikash" lastName:@"Singhal"];
    RSName *sameFirstName = [RSName firstName:@"Raksha" lastName:@"Singhania"];
    
    NSLog(@"Check Name description- %@", [aName description]);
    NSLog(@"Check ascending order: %ld", [sameLastName compare:aName]);
    NSLog(@"Check descending order: %ld", [aName compare:sameLastName]);
    NSLog(@"Check same order: %ld", [aName compare:aName]);
    NSLog(@"Check same firstname but different lastname: %ld", [aName compare:sameFirstName]);
}

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        /* Solution to Question 1 */
        printLogToTestPhoneFormat(@"619 594 6191");
        printLogToTestPhoneFormat(@"6195946191");
        printLogToTestPhoneFormat(@"619 5946191");
        printLogToTestPhoneFormat(@"619-594-6191");
        NSLog(@"For invalid input: %@", [@"619-594-619-1" phoneFormat]);
        
        /* Solution to Question 2 */
        printLogToTestPhoneNumber([RSPhoneNumber phoneTypeToString:kWorkFax], @"619-594-6191");
        printLogToTestPhoneNumber([RSPhoneNumber phoneTypeToString:kMobile], @"0987654321");
        
        /* Solution to Question 3 */;
        printLogToTestValidPhoneTypeAndNum(@"Work: 619-594-6191");
        printLogToTestInvalidPhoneTypeAndNum(@"Work-619-594-6191");
        
        /* Solution to Question 4 */
        printLogToTestName();
        
        /* Solution to Question 5 */
        printLogToTestPerson();
        
        /* Solution to Question 6 */
        printLogToTestContactList();
    }
    return 0;
}

