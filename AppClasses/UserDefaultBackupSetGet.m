//
//  UserDefaultBackupSetGet.m
//  MegoUser
//
//  Created by Mohammad on 4/11/16.
//  Copyright (c) 2016 megogrid. All rights reserved.
//

#import "UserDefaultBackupSetGet.h"
#import <MegoUser/MUManager.h>

@interface UserDefaultBackupSetGet ()<MUDelegate>
{
  UIView *mainView;
  CGFloat headingSize,subheadingSize,contentSize;
  MUManager *megoUserObj;
  NSInteger selectedVersion;
   UIButton *enterButton;
}
@end

@implementation UserDefaultBackupSetGet

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self backGroundUiPart];
    [self  fontSizeCalculation];
    [self headerSection];
    [self userDefaultBackUpUi];
    megoUserObj =[MUManager sharedMegoManager];
    megoUserObj.delegate=self;
}


#pragma mark UI Part
-(void)backGroundUiPart
{
    mainView=[[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    mainView.backgroundColor=[UIColor colorWithRed:234/255.0f green:234/255.0f blue:234/255.0f alpha:1];
    [self.view addSubview:mainView];
}

-(void)headerSection
{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width,64)];
    [headerView setBackgroundColor:[UIColor colorWithRed:79/255.0f green:109/255.0f blue:147/255.0f alpha:1]];
    headerView.tag=700;
    [self.view addSubview:headerView];
    
    UIView *navView=[[UIView alloc]initWithFrame:CGRectMake(0, 19, self.view.frame.size.width,45)];
    [headerView addSubview:navView];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setFrame:CGRectMake(15,12,20,21)];
    [backButton addTarget:self action:@selector(navUserDataBackupButton)forControlEvents:UIControlEventTouchUpInside];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back_icn.png"] forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back_icn.png"] forState:UIControlStateSelected];
    [navView addSubview :backButton];
    
    
    CGSize yourLabelSize = [@"Mego User Demo" sizeWithAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:headingSize]}];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake((navView.frame.size.width-yourLabelSize.width+10)/2,0 ,yourLabelSize.width+10, 45) ];
    title.text = @"Mego User Demo";
    title.textAlignment=NSTextAlignmentCenter;
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont boldSystemFontOfSize:headingSize];
    [navView addSubview:title];
}

-(void)fontSizeCalculation
{
    if([[UIScreen mainScreen]bounds].size.height<=568){
        headingSize=20,subheadingSize=16,contentSize=14;
    }
    else{
        headingSize=22,subheadingSize=18,contentSize=14;
    }
}

-(void)userDefaultBackUpUi
{
    UIView *versionView=[[UIView alloc]initWithFrame:CGRectMake(10,10,mainView.frame.size.width-20,mainView.frame.size.height/2-20)];
    [versionView setBackgroundColor:[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1]];
    [mainView addSubview:versionView];
    
    
    CGSize yourLabelSize = [@"CHOOSE VERSION" sizeWithAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:headingSize]}];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(headingSize,headingSize/2,yourLabelSize.width+10,headingSize)];
    title.text = @"CHOOSE VERSION";
    title.textAlignment=NSTextAlignmentLeft;
    title.textColor = [UIColor colorWithRed:54/255.0f green:54/255.0f blue:54/255.0f alpha:0.8];
    title.font = [UIFont systemFontOfSize:headingSize];
    [versionView addSubview:title];

    
    UIButton *selectVersion =[[UIButton alloc]initWithFrame:CGRectMake(title.frame.origin.x,title.frame.origin.y+title.frame.size.height+15,versionView.frame.size.width-headingSize*2,headingSize*2)];
    selectVersion.tag=20;
    [selectVersion setImageEdgeInsets:UIEdgeInsetsMake(0, selectVersion.frame.size.width-30, 0, 0)];
    [selectVersion setImage:[UIImage imageNamed:@"drop_down.png"] forState:UIControlStateNormal];
    [selectVersion setImage:[UIImage imageNamed:@"Arrow_nxt.png"] forState:UIControlStateHighlighted];
    [selectVersion addTarget:self action:@selector(createBackUpPicker:) forControlEvents:UIControlEventTouchUpInside];
     selectVersion.backgroundColor=[UIColor colorWithRed:234/255.0f green:234/255.0f blue:234/255.0f alpha:1];
    [selectVersion setTitle:@"Select Version" forState:UIControlStateNormal];
    selectVersion.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    selectVersion.titleEdgeInsets=UIEdgeInsetsMake(0,headingSize/2,0,0);
    selectVersion.titleLabel.font=[UIFont boldSystemFontOfSize:subheadingSize];
    [selectVersion setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [versionView addSubview:selectVersion];
    
    
    enterButton = [[UIButton alloc]initWithFrame:CGRectMake(versionView.frame.size.width/3,versionView.frame.size.height-selectVersion.frame.size.height*1.5,versionView.frame.size.width/3,selectVersion.frame.size.height)];
    enterButton.backgroundColor=[UIColor colorWithRed:217/255.0f green:217/255.0f blue:217/255.0f alpha:1];
    enterButton.titleLabel.font = [UIFont boldSystemFontOfSize:contentSize];
    [enterButton setTitle:@"Enter" forState:UIControlStateNormal];
    [enterButton addTarget:self action:@selector(setNSUserDefaultData)forControlEvents:UIControlEventTouchUpInside];
    [enterButton setTitleColor:[UIColor colorWithRed:120/255.0f green:120/255.0f blue:120/255.0f alpha:1]forState:UIControlStateNormal];
    [enterButton setTitleColor:[UIColor colorWithRed:80/255.0f green:110/255.0f blue:149/255.0f alpha:1]forState:UIControlStateHighlighted];
    enterButton.userInteractionEnabled=FALSE;
    [versionView addSubview :enterButton];
}


-(void)createBackUpPicker:(UIButton*)sender
{
    enterButton.userInteractionEnabled=FALSE;
    
    UIView *transparentView=[[UIView alloc] initWithFrame:self.view.frame];
    transparentView.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    transparentView.tag=100;
    transparentView.userInteractionEnabled=YES;
    [self.view addSubview:transparentView];
    
    UIView *noOfVersion=[[UIView alloc]initWithFrame:CGRectMake(20,transparentView.frame.size.height/4,transparentView.frame.size.width-40,transparentView.frame.size.height/2)];
    noOfVersion.layer.cornerRadius = 5;
    noOfVersion.layer.masksToBounds = YES;
    [noOfVersion setBackgroundColor:[UIColor colorWithRed:250/255.0f green:250/255.0f blue:250/255.0f alpha:1]];
    [transparentView addSubview:noOfVersion];
    
    CGSize yourLabelSize = [@"Version" sizeWithAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:headingSize]}];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(headingSize,headingSize*1.5,yourLabelSize.width+10,yourLabelSize.height)];
    title.text = @"Version";
    title.textAlignment=NSTextAlignmentLeft;
    title.textColor = [UIColor colorWithRed:15/255.0f green:15/255.0f blue:15/255.0f alpha:0.8];
    title.font = [UIFont boldSystemFontOfSize:headingSize];
    [noOfVersion addSubview:title];
   
    
     CGSize yourOptionSize = [@"Ver 1.1.2" sizeWithAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:subheadingSize]}];
    CGFloat yPoint =title.frame.size.height+title.frame.origin.x+headingSize;
    NSArray *verArray=[NSArray arrayWithObjects:@"Ver 1.1.2",@"Ver 1.1.4",@"Ver 1.1.6",@"Ver 2.0.1",nil];
    for(int i=0;i<[verArray count];i++)
    {
        UIButton *versionOptionButton = [[UIButton alloc]initWithFrame:CGRectMake(headingSize*3,yPoint,yourOptionSize.width+10,subheadingSize*2)];
        versionOptionButton.tag=50+i;
        versionOptionButton.titleLabel.font = [UIFont boldSystemFontOfSize:subheadingSize];
        [noOfVersion addSubview :versionOptionButton];
        yPoint=yPoint+versionOptionButton.frame.size.height;
        [versionOptionButton setTitle:[verArray objectAtIndex:i] forState:UIControlStateNormal];
        [versionOptionButton addTarget:self action:@selector(setVersionNumber:)forControlEvents:UIControlEventTouchUpInside];
        [versionOptionButton setTitleColor:[UIColor colorWithRed:120/255.0f green:120/255.0f blue:120/255.0f alpha:1]forState:UIControlStateNormal];
        [versionOptionButton setTitleColor:[UIColor colorWithRed:80/255.0f green:110/255.0f blue:149/255.0f alpha:1]forState:UIControlStateHighlighted];
    }
    
    
    UIButton *okBtn =[[UIButton alloc]initWithFrame:CGRectMake(noOfVersion.frame.size.width-60,noOfVersion.frame.size.height-60,60,60)];
    [okBtn addTarget:self action:@selector(removeAddView:) forControlEvents:UIControlEventTouchUpInside];
    [okBtn setTitle:@"OK" forState:UIControlStateNormal];
    okBtn.tag=11;
    okBtn.titleLabel.font=[UIFont boldSystemFontOfSize:subheadingSize];
    [okBtn setTitleColor:[UIColor colorWithRed:120/255.0f green:120/255.0f blue:120/255.0f alpha:1]forState:UIControlStateNormal];
    [okBtn setTitleColor:[UIColor colorWithRed:80/255.0f green:110/255.0f blue:149/255.0f alpha:1]forState:UIControlStateHighlighted];
    [noOfVersion addSubview:okBtn];
    okBtn.userInteractionEnabled=FALSE;
    
    UIButton *cancelBtn =[[UIButton alloc]initWithFrame:CGRectMake(okBtn.frame.origin.x-90,okBtn.frame.origin.y,90,60)];
    cancelBtn.tag=12;
    [cancelBtn addTarget:self action:@selector(removeAddView:)forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn setTitle:@"CANCEL" forState:UIControlStateNormal];
    cancelBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
    cancelBtn.titleLabel.font=[UIFont boldSystemFontOfSize:subheadingSize];
    [cancelBtn setTitleColor:[UIColor colorWithRed:120/255.0f green:120/255.0f blue:120/255.0f alpha:1]forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor colorWithRed:80/255.0f green:110/255.0f blue:149/255.0f alpha:1]forState:UIControlStateHighlighted];
    [noOfVersion addSubview:cancelBtn];
}

-(void)setVersionNumber:(UIButton*)sender
{
    UIButton *btnTitle=(UIButton*)[self.view viewWithTag:20];
    btnTitle.titleLabel.text=sender.titleLabel.text;
    UIButton *btn=(UIButton*)[self.view viewWithTag:11];
    btn.userInteractionEnabled=YES;
    selectedVersion =sender.tag-50;
}

-(void)setNSUserDefaultData
{
    if([self.backUpGetSet isEqualToString:@"set"])
     [megoUserObj createNSUserDefaultBackup :selectedVersion]; //PrefBackup
    else
    [megoUserObj restoreNSUserDefaultData :selectedVersion];  //PrefStore
}

-(void)removeAddView:(UIButton*)sender
{
    if(sender.tag==12)
    {
        [[self.view viewWithTag:100]removeFromSuperview];
    }else
    {
        enterButton.userInteractionEnabled=TRUE;
      [[self.view viewWithTag:100]removeFromSuperview];
    }
}

-(void)navUserDataBackupButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


#pragma mark MegoUser Response Handler

- (void)muRegistrationSuccessHandler{
    NSLog(@"\n=Login And Registration Email or Sms");
}

- (void)skipButtonClick :(NSString*)response
{
    NSLog(@"%@\n=For Email,Sms cancel or Skip Case",response);
}

-(void)getProfileDetailResponse :(NSMutableDictionary*)responseGetprofileDetails
{
    NSLog(@"%@=\n",responseGetprofileDetails);
}

-(void)updateProfilePictureResponse :(NSMutableDictionary*)responsePicturePath
{
    NSLog(@"%@=\n",responsePicturePath);
}

-(void)updateProfileDetailResponse :(NSMutableDictionary*)responseUpdateProfileDetail
{
    NSLog(@"%@=\n",responseUpdateProfileDetail);
}
- (void)megoUserErrorHandler:(NSError*)failureError
{
    NSLog(@"\n%@",failureError);
}
-(void)verificationStatus :(BOOL)userVerified
{
    NSLog(@"\n=Error");
}



@end
