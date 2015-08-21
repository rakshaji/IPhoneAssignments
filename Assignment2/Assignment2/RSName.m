//
//  Name.m
//  Assignment2
//
//  Created by Raksha Singhania on 07/09/14.
//  Copyright (c) 2014 Raksha Singhania. All rights reserved.
//

#import "RSName.h"

@implementation RSName {
@private
    NSString *_firstName;
    NSString *_lastName;
}

- (void)setFirstName:(NSString *)firstName {
    _firstName = firstName;
}

- (void)setLastName:(NSString *)lastName {
    _lastName = lastName;
}

- (NSString *)lastName {
    return _lastName;
}

- (NSString *)firstName{
    return _firstName;
}

/*
 Creates a new Name object with given firstName and lastName
 @return Name object otherwise returns nil
 */
+ (id)firstName:(NSString *)firstName lastName:(NSString *)lastName {
    RSName *nameObj = [[RSName alloc] init];
    if(nameObj != nil){
        [nameObj setFirstName:firstName];
        [nameObj setLastName:lastName];
    }
    return nameObj;
}

/*
 Gives fullname of the person in the form "(Firstname Lastname)"
 @return fullname of the person as string
 */
- (NSString *)description {
    return [NSString stringWithFormat:@"(%@ %@)", [self firstName], [self lastName]];
}

/*
 Compares two names indicating how they compare in order
 @return order as an NSComparisonResult
 */
- (NSComparisonResult)compare:(RSName *)aName {
    if ([self firstName] != nil) {
        if ([[self firstName] isEqualToString:[aName firstName]]) {
            // if first name is same, check last name
            if ([self lastName] != nil && ![[self lastName] isEqualToString:[aName lastName]]) {
                if ([[self lastName] isGreaterThan:[aName lastName]]) {
                    return (NSComparisonResult) NSOrderedDescending;
                } else {
                    return (NSComparisonResult) NSOrderedAscending;
                }
            }
        } else {
            // check first name
            if ([[self firstName] isGreaterThan:[aName firstName]]) {
                return (NSComparisonResult) NSOrderedDescending;
            } else {
                return (NSComparisonResult) NSOrderedAscending;
            }
        }
    }
    return NSOrderedSame;
}

@end
