//
//  Name.h
//  Assignment2
//
//  Created by Raksha Singhania on 07/09/14.
//  Copyright (c) 2014 Raksha Singhania. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSName : NSObject

/*
 Creates a new Name object with given firstName and lastName
 @return Name object otherwise returns nil
 */
+ (id)firstName:(NSString *)firstName lastName:(NSString *)lastName;

/*
 Gives fullname of the person in the form "(Firstname Lastname)"
 @return fullname of the person as string,
 */
- (NSString *)description;

/*
 Compares two names indicating how they compare in order
 @return order as an NSComparisonResult
 */
- (NSComparisonResult)compare:(RSName *)aName;

- (void)setFirstName:(NSString *)firstName ;

- (void)setLastName:(NSString *)lastName;

- (NSString *)lastName;

- (NSString *)firstName;

@end
