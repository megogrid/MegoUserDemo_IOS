//
//  MUInfoModel.h
//  Copyright (c) 2015 com.migital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MUInfoModel : NSObject

/*! @brief This property knows user name. */
@property(nonatomic,strong)NSString *userName;

/*! @brief This property  provides the user's first name. */
@property(nonatomic,strong)NSString *userFirstName;

/*! @brief This property knows user's last name. */
@property(nonatomic,strong)NSString *userLastName;

/*! @brief This property provides user ID. */
@property(nonatomic,strong)NSString *userId;

/*! @brief This property knows user's email. */
@property(nonatomic,strong)NSString *email;

/*! @brief This property knows user's password. */
@property(nonatomic,strong)NSString *password;

/*! @brief This property knows user's gender. */
@property(nonatomic,strong)NSString *gender;

/*! @brief This property knows user's age. */
@property(nonatomic,strong)NSString *age;

/*! @brief This property knows user's minimun age range. */
@property(nonatomic,strong)NSString *minAgeRange;

/*! @brief This property knows user's maximum age range.*/
@property(nonatomic,strong)NSString *maxAgeRange;

/*! @brief This property knows provides user's profile picture */
@property(nonatomic,strong)NSString *profilePicture;

/*! @brief This property knows user's phone number */
@property(nonatomic,strong)NSString *phoneNumber;

/*! @brief This property knows user's age Group. */
@property(nonatomic,strong)NSString *ageGroup;

/*! @brief This property knows user's birthday.. */
@property(nonatomic,strong)NSString *birthday;

/*! @brief This property knows user's relationship. */
@property(nonatomic,strong)NSString *relationship;

/*! @brief This property knows user's anniversary. */
@property(nonatomic,strong)NSString *anniversary;

/*! @brief This property knows user's city. */
@property(nonatomic,strong)NSString *city;

/*! @brief This property knows user's state. */
@property(nonatomic,strong)NSString *state;

/*! @brief This property knows user's country. */
@property(nonatomic,strong)NSString *country;

/*! @brief This property knows user's countryCode. */
@property(nonatomic,strong)NSString *countryCode;

/*! @brief This property knows user's postal. */
@property(nonatomic,strong)NSString *postal;

/*! @brief This property knows user's address. */
@property(nonatomic,strong)NSString *address;

/*! @brief customFields property knows  provides the extra field you required for your user. */
@property(nonatomic,strong)NSArray *customFields;


@end


