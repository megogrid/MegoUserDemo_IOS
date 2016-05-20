//
//  MUError.h
//  Mego User

//  Copyright (c) 2016 Migital. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 * The MUError class of MegoUser provides all MegoUser related errors.
 *
 * The  MUError class handles all the MegoUser related Error and provide the Error detail by MUDelegate delegate.
 *
 */
@interface MUError : NSObject

/** @MUError */
typedef enum
{
    /*!
     * \brief MUAdvanceNotEnabledException code indicating that advance option is not Enable from CMS panel.
     */
    MUAdvanceNotEnabledException=0,
    /*!
     * \brief MUAlreadyRegisterException code indicating that user applied for Registration is Already Registered.
     */
    MUAlreadyRegisterException,
    /*!
     * \brief MUContactNotVerifiedException code indicating that user Contact Number not verified.
     */
    MUContactNotVerifiedException,
    /*!
     * \brief MUIncorrectPasswordException code indicating that password user entered is not valid.
     */
    MUIncorrectPasswordException,
    /*!
     * \brief MUInvalidDetailException code indicating that user entered invalid details(username or password).
     */
    MUInvalidDetailException,
    /*!
     * \brief MURequiredNavigationViewException code indicating that user not assign view and navigationController.
     */
    MURequiredNavigationViewException,
    /*!
     * \brief MULinkNotCorrectException code indicating that Link provided for custom fields is either incorrect or null.
     */
    MULinkNotCorrectException,
    /*!
     * \brief MUNoEmailIdFBException code indicating that not entered valid Facebook Id.
     */
    MUNoEmailIdFBException,
    /*!
     * \brief MUNoGoogleClientIdException code indicating that not entered GooglePlusClientId in Info.plist.
     */
    MUNoGoogleClientIdException,
    /*!
     * \brief MUNoInternetException code indicating that there is internet connection problem.
     */
    MUNoInternetException,
    /*!
     * \brief MUNoSuchBoxIdException code indicating that BoxId is not configured at cms panel.
     */
    MUNoSuchBoxIdException,
    /*!
     * \brief MUNotAuthorizedException code indicating that user's authorization failed(No Meward id & Token key).
     */
    MUNotAuthorizedException,
    /*!
     * \brief MUNotConfiguredException code indicating that there is no megouser configuration.
     */
    MUNotConfiguredException,
    /*!
     * \brief MUNotLoggedInException code indicating that user is Not Logged In.
     */
    MUNotLoggedInException,
    /*!
     * \brief MUNotRegisteredException code indicating that  user is Not Registered.
     */
    MUNotRegisteredException,
    /*!
     * \brief MUPromptNotAppearException code indicating that megouser Registration prompt not come according to CMS configuration.
     */
    MUPromptNotAppearException,
} MegoError;


///@cond
+(NSError*)megoErrorDescription:(MegoError)megoEnumValue;
///@endcond
@end

