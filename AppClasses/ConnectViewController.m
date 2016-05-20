//
//  ConnectViewController.m
//  Mego Shop Demo
//
//  Created by ankit-iphone on 2/12/16.
//  Copyright (c) 2016 unity. All rights reserved.
//

#import "ConnectViewController.h"


@interface ConnectViewController ()<UIGestureRecognizerDelegate,UIAlertViewDelegate>
{
    UIView *mainView;
}

@end

@implementation ConnectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    mainView=[[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    mainView.backgroundColor=[UIColor colorWithRed:206/255.0f green:206/255.0f blue:206/255.0f alpha:1];
    [self.view addSubview:mainView];
    
    [self headerSection];
    [self loadMainView];
    
}

-(void)headerSection
{
    UIView*headerView = [[UIView alloc]initWithFrame:CGRectMake(0,
                                                                0,
                                                                self.view.frame.size.width,
                                                                64)];
    
    [headerView setBackgroundColor:[UIColor colorWithRed:79/255.0f green:109/255.0f blue:147/255.0f alpha:1]];
    [self.view addSubview:headerView];
    
    UIView *navView=[[UIView alloc]initWithFrame:CGRectMake(0, 19, self.view.frame.size.width,45)];
    [headerView addSubview:navView];
    
    UIButton *sliderButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [sliderButton setFrame:CGRectMake(15,15,15,15)];
    [sliderButton addTarget:self action:@selector(getSlider)forControlEvents:UIControlEventTouchUpInside];
    [sliderButton setBackgroundImage:[UIImage imageNamed:@"back_icn.png"] forState:UIControlStateNormal];
    [sliderButton setBackgroundImage:[UIImage imageNamed:@"back_icn.png"] forState:UIControlStateSelected];
    [navView addSubview :sliderButton];
    
    
    UILabel*groupLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0 ,navView.frame.size.width, 45) ];
    groupLabel.text = @"Mego User Demo";
    groupLabel.textAlignment=NSTextAlignmentCenter;
    groupLabel.textColor = [UIColor whiteColor];
    groupLabel.font = [UIFont boldSystemFontOfSize:17];
    [navView addSubview:groupLabel];
    
    
    
//    UIButton *rightMenu = [[UIButton alloc]initWithFrame:CGRectMake(navView.frame.size.width-20, 15, 4, 15)];
//    [rightMenu addTarget:self action:@selector(rightMenuClick)forControlEvents:UIControlEventTouchUpInside];
//    [rightMenu setBackgroundImage:[UIImage imageNamed:@"Right_menu.png"] forState:normal ];
//    [navView addSubview :rightMenu];
//    
//    
//    UIButton *searchButton = [[UIButton alloc]initWithFrame:CGRectMake(navView.frame.size.width-60, 14.5, 16, 16)];
//    [searchButton addTarget:self action:@selector(searchButtonClick)forControlEvents:UIControlEventTouchUpInside];
//    [searchButton setBackgroundImage:[UIImage imageNamed:@"search_icn.png"] forState:normal ];
//    [navView addSubview :searchButton];
}

-(void)loadMainView
{
    UIImageView *FacebookView=[[UIImageView alloc]initWithFrame:CGRectMake(8, 10, self.view.frame.size.width-16, (self.view.frame.size.height-64)/3-15)];
    FacebookView.image=[UIImage imageNamed:@"facebookscreen_card.png"];
    FacebookView.userInteractionEnabled=YES;
    [mainView addSubview:FacebookView];
    UITapGestureRecognizer *configurationTapFBGmail = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resetConfigurationClickFBGmail)];
    configurationTapFBGmail.delegate = self;
    [FacebookView addGestureRecognizer:configurationTapFBGmail];
    
    
    UIImageView *emailView=[[UIImageView alloc]initWithFrame:CGRectMake(8, FacebookView.frame.size.height+20, self.view.frame.size.width-16, (self.view.frame.size.height-64)/3-15)];
    emailView.image=[UIImage imageNamed:@"facebookscreen_card.png"];
    emailView.userInteractionEnabled=YES;
    [mainView addSubview:emailView];
    UITapGestureRecognizer *configurationTapEmail = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resetConfigurationClickEmail)];
    configurationTapEmail.delegate = self;
    [emailView addGestureRecognizer:configurationTapEmail];
    
    UIImageView *PhoneNumberView=[[UIImageView alloc]initWithFrame:CGRectMake(8, emailView.frame.origin.y+emailView.frame.size.height+10, self.view.frame.size.width-16, (self.view.frame.size.height-64)/3-15)];
    PhoneNumberView.image=[UIImage imageNamed:@"facebookscreen_card.png"];
    PhoneNumberView.userInteractionEnabled=YES;
    [mainView addSubview:PhoneNumberView];
    UITapGestureRecognizer *configurationTapSms = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resetConfigurationClickSms)];
    configurationTapSms.delegate = self;
    [PhoneNumberView addGestureRecognizer:configurationTapSms];
    
    
    
    UIButton *fb=[[UIButton alloc]initWithFrame:CGRectMake((FacebookView.frame.size.width/3)/2-10, (FacebookView.frame.size.height-30)/2-10, FacebookView.frame.size.width/3, 30)];
    [fb setImage:[UIImage imageNamed:@"facebook.png"] forState:normal];
    fb.tag=10;
    [fb addTarget:self action:@selector(resetConfigurationClick:) forControlEvents:UIControlEventTouchUpInside];
    [FacebookView addSubview:fb];
    
    UIButton *google=[[UIButton alloc]initWithFrame:CGRectMake(fb.frame.origin.x+fb.frame.size.width+20, (FacebookView.frame.size.height-30)/2-10, FacebookView.frame.size.width/3, 30)];
    [google setImage:[UIImage imageNamed:@"google+.png"] forState:normal];
    google.tag=11;
    [google addTarget:self action:@selector(resetConfigurationClick:) forControlEvents:UIControlEventTouchUpInside];
    [FacebookView addSubview:google];
    
    
    UIButton *email=[[UIButton alloc]initWithFrame:CGRectMake(FacebookView.frame.size.width/3, (FacebookView.frame.size.height-30)/2-10, FacebookView.frame.size.width/3, 30)];
    [email setImage:[UIImage imageNamed:@"emailApp.png"] forState:normal];
    email.tag=12;
    [email addTarget:self action:@selector(resetConfigurationClick:) forControlEvents:UIControlEventTouchUpInside];
    [emailView addSubview:email];
    
    UIButton *phoneNo=[[UIButton alloc]initWithFrame:CGRectMake(FacebookView.frame.size.width/3, (FacebookView.frame.size.height-30)/2-10, FacebookView.frame.size.width/3, 30)];
    [phoneNo setImage:[UIImage imageNamed:@"phone_No.png"] forState:normal];
    phoneNo.tag=13;
    [phoneNo addTarget:self action:@selector(resetConfigurationClick:) forControlEvents:UIControlEventTouchUpInside];
    [PhoneNumberView addSubview:phoneNo];
    
    UILabel *fbLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, fb.frame.origin.y+fb.frame.size.height+10, FacebookView.frame.size.width, 20)];
    [FacebookView addSubview:fbLabel];
    fbLabel.text=@"Connect With Facebook, Google";
    fbLabel.font=[UIFont systemFontOfSize:12];
    fbLabel.textAlignment=NSTextAlignmentCenter;
    
    UILabel *emailLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, fb.frame.origin.y+fb.frame.size.height+10, FacebookView.frame.size.width, 20)];
    [emailView addSubview:emailLabel];
    emailLabel.text=@"Connect With Your Email";
    emailLabel.font=[UIFont systemFontOfSize:12];
    emailLabel.textAlignment=NSTextAlignmentCenter;
    
    UILabel *phnLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, fb.frame.origin.y+fb.frame.size.height+10, FacebookView.frame.size.width, 20)];
    [PhoneNumberView addSubview:phnLabel];
    phnLabel.text=@"Connect With Personal Number";
    phnLabel.font=[UIFont systemFontOfSize:12];
    phnLabel.textAlignment=NSTextAlignmentCenter;
    
}

#pragma mark - Header Buttons Click
-(void)getSlider
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)searchButtonClick
{
    
}

-(void)rightMenuClick
{
    
}



#pragma mark - Social Buttons Click


-(void)resetConfigurationClick:(id)sender
{
    int getTag;
    if([sender isKindOfClass:[UIButton class]])
    {
        UIButton *value=sender;
        getTag=(int)value.tag;
    }else{
        getTag=[sender intValue];
    }
    
    UIAlertView *alertConfig=[[UIAlertView alloc]initWithTitle:@"Alert !" message:@"Please Press Ok to get new configuration" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok"  , nil];
    alertConfig.tag=getTag;
    [alertConfig show];
}

-(void)resetConfigurationClickFBGmail
{
    [self resetConfigurationClick :[NSNumber numberWithInt:11]];
}
-(void)resetConfigurationClickEmail
{
    [self resetConfigurationClick :[NSNumber numberWithInt:12]];
}
-(void)resetConfigurationClickSms
{
    [self resetConfigurationClick :[NSNumber numberWithInt:13]];
}

-(void)deleteNSUserDefaultData
{
    
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    NSDictionary * dict = [defs dictionaryRepresentation];
    for (id key in dict) {
        [defs removeObjectForKey:key];
    }
    [defs synchronize];
}

#pragma mark Alert view delegate
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1)
    {
        int getTag =(int)alertView.tag;
        
        [self deleteNSUserDefaultData];
        
        NSMutableArray *appSecretData=[[NSMutableArray alloc]init];
        if((getTag==10)||(getTag==11))
        {
            [appSecretData addObject:@"S9DNMQPAA"];
            [appSecretData addObject:@"F4EGPD14O"];
            [appSecretData addObject:@"3"];
        }
        else if(getTag==12)
        {
            [appSecretData addObject:@"T274TVIZE"];//GXR9YJE16
            [appSecretData addObject:@"QUO0D5D3N"];//57NNX2X39
            [appSecretData addObject:@"3"];//2*/
            
//            [appSecretData addObject:@"GXR9YJE16"];//GXR9YJE16
//            [appSecretData addObject:@"57NNX2X39"];//57NNX2X39
//            [appSecretData addObject:@"2"];//2
        }
        else if(getTag==13)
        {
            [appSecretData addObject:@"VJEFLBK1R"];
            [appSecretData addObject:@"3JVMZW847"];
            [appSecretData addObject:@"3"];
        }
        [[NSUserDefaults standardUserDefaults]setObject:appSecretData forKey:@"meuserAppSecretKey"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Alert !"
                                  message:@"Please Relaunch Application For New Configuration"
                                  delegate:nil
                                  cancelButtonTitle:nil otherButtonTitles:nil];
            [alert show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
