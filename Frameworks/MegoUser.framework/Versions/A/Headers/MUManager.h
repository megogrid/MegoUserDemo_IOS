//
//  MUManager.h
//  Copyright (c) 2015 com.migital. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MUInfoModel.h"
#import "MUError.h"

/*!
 @protocol MUDelegate
 
 @brief The MUDelegate protocol
 
 Use this to recieve callback form MUManager class.
 */
@protocol MUDelegate <NSObject>
@optional

/** muRegistrationSuccessHandler method is notify by MUManager delegate when SignUp or Login Process Success.
 */
- (void)muRegistrationSuccessHandler;

/** skipButtonClick method is notify by MUManager delegate if user skip the login or SignUp.
 * @param response is  NSString type provide the skip related detail.
 */
- (void)skipButtonClick :(NSString*)response;

/**  updateProfileDetailResponse method is notify by MUManager delegate if user successfully update profile detail.
 * @param responseUpdateProfileDetail is  NSMutableDictionary type provide user status,message,tokenKey and mewardId.
 */
-(void)updateProfileDetailResponse :(NSMutableDictionary*)responseUpdateProfileDetail;

/** updateProfilePictureResponse method is notify by MUManager delegate if user successfully update profile Picture.
 * @param responsePicturePath is  NSMutableDictionary type provide Profile picture path in response.
 */
-(void)updateProfilePictureResponse :(NSMutableDictionary*)responsePicturePath;

/** getProfileDetailResponse method is notify by MUManager delegate if user successfully get profile related all data.
 * @param responseGetprofileDetails is  NSMutableDictionary type provide all detail of user in Dictionary form.
 */
-(void)getProfileDetailResponse :(NSMutableDictionary*)responseGetprofileDetails;

/** verificationStatus method is notify by MUManager delegate if user is Registered.
 * @param userVerified is  BOOL type provide by MegoUser, if user Verified return true else return false value.
 */
-(void)verificationStatus :(BOOL)userVerified;
/** @discussion megoUserErrorHandler method is notify by MUManager delegate when authorization, internet, configuration or invalid details related issue occurred.
 * @param failureError is NSString type that provide failure related detail.
 */
- (void)megoUserErrorHandler :(NSError*)failureError;
@end

/*!
 Detailed Description
 Note :–
 
 This is the main class to keep track of the currently signed in user along with first time registration, logout session and profile related Information.
 
 * 1.To Use MegoUser First you should import framework like this in AppDelegate:
 
 #import <MUFramework/MUFramework.h>
 
 within AppDelegate.m in the didFinishLaunchingWithOptions method add initSDK method for Authentication of user.
 create the MUManager class instance (megoUserObj)  and call it from didFinishLaunchingWithOptions.
 
 *  2. create the instance of MUManager class –
 
 megoUserObj =[MUManager sharedMegoManager];
 [megoUserObj initSDK];
 
 *  3. In which class you use MegoUser functionality first create the instanse of MUManager class
 within your Interface
 
 MUManager *megoUserObj;
 
 Inside the -(void)viewDidLoad Method of your ViewController assign the  MegoUser SDK Add following code for assign Background Image,App Title Image,Navigation Contoller and current Class view.
 
 *  4. In which class you use MegoUser functionality assign the following detail to it's viewDidLoad Method.
 
 megoUserObj.view=self.view;
 
 megoUserObj.delegate=self;
 
 megoUserObj.navigationController=self.navigationController;
 
 megoUserObj.backGroundImageArray=[NSArray arrayWithObjects:[UIImage imageNamed:@"BackGround.jpg"],[UIImage imageNamed:@"1.jpg"],nil];
 
 megoUserObj.muTitleImage=[UIImage imageNamed:@"title_logo.png"];
 
 *  5. For Registration and login Prompt call initiateRegistration method
 
 [megoUserObj initiateRegistration];
 */

@interface MUManager : NSObject


/**  to get the Response on successfull SignUp,login,logout,Any Connection,configuration related Error,or user Skip login or SignUp process then use MUDelegate.
 */
@property (nonatomic,strong) id <MUDelegate> delegate;

/**  The App BackGround Image Assign To MUManager class for Registration View by user.
 */
@property (nonatomic,strong)NSArray *backGroundImageArray;

/**  The App TitleImage Image Assign To MUManager class for Registration View by user.
 */
@property (nonatomic,strong)UIImage *megoUserTitleImage;

/**  Assign view To MUManager Class for View.
 */
@property (nonatomic,strong)UIView *view;

/**   Assign NavigationController To MUManager Class for Navigation.
 */
@property (nonatomic,strong)UINavigationController *navigationController;


/*!
 * for to create the instance of MUManager then call sharedMegoManager Method.
 @return it return the shared instance of MUManager class
 */
+(id)sharedMegoManager;

/**  To Initialize the MegoUser Sdk then call initSDK method,start Authentication of user or if user is authenticated then for registration configuration
 */
-(void)initSDK;


/**  To Show the SignUp or Login Prompt on any Event then Call initiateRegistration method.
 */
-(void)initiateRegistration;

/**  To Call logoutClick method for Logout Process if User is Login.
 * @return a Bool type, if Log Out was Success then return value is true, Log Out process was failed then return value is false.
 */
-(BOOL)logoutClick;

/** To Call profileSetUpClick method To show the profile details of already registered user and signed In currently and s/he has already setup his profile details or if the user is registered but s/he has not done profile setup process s/he will be prompted with a blank profile details where s/he can set all the required fields - Name,Age,Gender,Dob,Profile Picture,Address according to user need.
 */
-(void)profileSetUpClick;

/**
 To Call createNSUserDefaultBackup method for create application NSUserDefaults data backup.
 * @param here version is NSInteger type, an unique number for NSUserDefault Data backup required for restore or overwrite backup
 */
-(void)createNSUserDefaultBackup :(NSInteger)version;


/**  To Call restoreNSUserDefaultData method if user want to get and restore the Application NSUserDefaults data backup related information then call it.
 * @param here version is NSInteger type, an unique number which is set while creation of NSUserDefault Data backup.
 */
-(void)restoreNSUserDefaultData :(NSInteger)version;


/** To Call isEmailVerified method for check user email verification status whether User's email is verified or not. if Registered then get the callback by verificationStatus delegate. if verified then get true value else get false value.
 */
-(void)isEmailVerified;

/** To Call isLoggedIn method for check User status whether user is logged in or not.
 * @return a Bool type, if logged then return value is true else return value is false.
 */
-(BOOL)isLoggedIn;


/** To Call isRegistered method for check user status whether user is Registered or not.
 * @return a Bool type, if Registered then return value is true else return value is false.
 */
-(BOOL)isRegistered;


/** To call signup on custom app events on the basis of box ids then call showRegisterByBoxId Method.
 * @param boxId An NSString that help compare boxId to event id.
 */
-(void)showRegisterByBoxId:(NSString*)boxId;

/**  To call signup on custom app events on the basis of box title then call showRegisterByBox_Title Method.
 * @param boxTitle An NSString that help compare boxTitle to event id.
 */
-(void)showRegisterByBoxTitle:(NSString*)boxTitle;

/** To call updateProfilePicture Method for Update Profile picture.if you are registered and want to change Profile Picture only then use it.
 * @param base64String parameter is NSString type, pass profile image in base64 string form,
 */
-(void)updateProfilePicture :(NSString*)base64String;

/**  To call updateProfileDetails Method for Update Profile Details .
 * @param muInfoModelObj parameter is MUInfoModel type we pass the user detail in this model as a argument
 */
-(void)updateProfileDetails:(MUInfoModel*)muInfoModelObj;

/** To call getProfileDetails Method for get User Profile Details From the  MegoUser.
 */
-(void)getProfileDetails;


/**
 To call getFbLoginBoolean Method to know user login or sign up by facebook or googleSignIn,
 it's used in AppDelegate method (- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
 sourceApplication:(NSString *)sourceApplication annotation:(id)annotation)) when get call back by custom url scheme
 * @return true if login or signup by facebook else return false.
 */
+(BOOL)getFbLoginBoolean;


/** To call setFbLogin Method When User tap on facebook login button .
 * @param value parameter is BOOL type,if google and facebook both used for login/signUp then pass true value
   for facebook case and false value for google login/signUp case.
 */
+(void)setFbLogin:(BOOL)value;

/*!
 * @discussion getReSourseFromMegoUserBundle method is used to get the resourses Field related detail from the MegoUser correspond to Custom Field Id.
 * @param imageName parameter is NSString type that help pass image name as a string argument.
 * @param typeOfImage parameter is NSString type use to pass image type either png or jpg.
 * @return type is UIImage, return image from the bundle.
 */
+(UIImage*)getReSourseFromMegoUserBundle:(NSString*)imageName :(NSString*)typeOfImage;


@end
