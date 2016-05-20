//
//  HelpPage.m
//  Mego Shop Demo
//
//  Created by Mohammad on 2/24/16.
//  Copyright (c) 2016 unity. All rights reserved.
//

#import "HelpPage.h"


@interface HelpPage ()<UIScrollViewDelegate>
{
  UIView *mainView;
  UIScrollView *helpScrollView;
  CGFloat headingSize,subheadingSize,contentSize,totalHelpScrollHeight;
  NSMutableArray *typesNameArray,*contentArray;
}
@end

@implementation HelpPage

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self backGroundUiPart];
    [self  fontSizeCalculation];
    [self headerSection];
    [self  descriptionOfHelpController];
}

#pragma mark UI Part
-(void)backGroundUiPart
{
    mainView=[[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    mainView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:mainView];
    helpScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,mainView.frame.size.width,mainView.frame.size.height)];
    [helpScrollView setBackgroundColor:[UIColor clearColor]];
    helpScrollView.delegate=self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [mainView addSubview:helpScrollView];
    helpScrollView.userInteractionEnabled=TRUE;
    helpScrollView.scrollEnabled=YES;
    helpScrollView.showsVerticalScrollIndicator=TRUE;
    [helpScrollView setContentSize: CGSizeMake(helpScrollView.bounds.size.width,mainView.frame.size.height)];
}

-(void)headerSection
{
    UIView*headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width,64)];
    [headerView setBackgroundColor:[UIColor colorWithRed:79/255.0f green:109/255.0f blue:147/255.0f alpha:1]];
    [self.view addSubview:headerView];
    
    UIView *navView=[[UIView alloc]initWithFrame:CGRectMake(0, 19, self.view.frame.size.width,45)];
    [headerView addSubview:navView];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setFrame:CGRectMake(15,12,20,21)];
    [backButton addTarget:self action:@selector(navBackButton)forControlEvents:UIControlEventTouchUpInside];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back_icn.png"] forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back_icn.png"] forState:UIControlStateSelected];
    [navView addSubview :backButton];
    
    
    CGSize yourLabelSize = [@"Help" sizeWithAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:headingSize]}];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake((navView.frame.size.width-yourLabelSize.width+10)/2,0 ,yourLabelSize.width+10, 45) ];
    title.text = @"Help";
    title.textAlignment=NSTextAlignmentCenter;
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont boldSystemFontOfSize:headingSize];
    [navView addSubview:title];
}

-(void)fontSizeCalculation
{
    if([[UIScreen mainScreen]bounds].size.height<=568) // iPhone4S,iPhone5
    {
        headingSize=20;
        subheadingSize=16;
        contentSize=14;
    }
    else //iPhone6
    {
        headingSize=22;
        subheadingSize=14;
        contentSize=14;
    }
}

#pragma mark Content Part

-(void)descriptionOfHelpController
{
    typesNameArray=[[NSMutableArray alloc]initWithObjects:@"Account",@"Preference Backup",@"Preference Restore",@"Configuration",nil];
    
    contentArray=[[NSMutableArray alloc]initWithObjects:@"All the account details submitted at the time of the registration will be shown in this section of the app!\n\nThis section shows the entire process which your app users will be going through once you integrate MeUser in you app!\n\nThe 3 registration modes supported by MeUser are - FB, G+ and Email.\n\nAfter the user has registered he has a well drafted form to fill all his personal information.",
        
        @"This section allows to take the backup of all the information related to the specific app.\n\nIt aims at reducing the efforts of again and again filling the same info to use the app in desired manner!",
                  
        @"This will help you in restoring all the information that is backed up using the \"Preference Backup\".",
        
        @"You can choose new configuration using this option.",
                  
        nil];
    
    
    for(int i=0;i<[typesNameArray count];i++)
    {
        [self  detailForTypes:[typesNameArray objectAtIndex:i]:[contentArray objectAtIndex:i]];
    }
}

-(void)detailForTypes:(NSString*)typesName :(NSString*)content
{
    float myTextHeight = 0;
    totalHelpScrollHeight=totalHelpScrollHeight+26;
    
    CGSize yourLabelSize = [typesName sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize :subheadingSize]}];
    
    UILabel *contentType = [[UILabel alloc]initWithFrame:CGRectMake(10,totalHelpScrollHeight,yourLabelSize.width+20,yourLabelSize.height)];
    contentType.text=[typesName stringByAppendingString:@" "];
    contentType.font=[UIFont boldSystemFontOfSize :subheadingSize];
    contentType.textColor = [UIColor blackColor];
    contentType.textAlignment = NSTextAlignmentLeft;
    [helpScrollView addSubview:contentType];
    totalHelpScrollHeight=totalHelpScrollHeight+yourLabelSize.height+10;
    
    
    UILabel *contentLabel=[[UILabel alloc]initWithFrame:CGRectMake(10,totalHelpScrollHeight,helpScrollView.frame.size.width-20,myTextHeight)];
    CGSize maximumSize = CGSizeMake(self.view.frame.size.width-20,CGFLOAT_MAX);
    UIFont *myFont = [UIFont fontWithName:@"Arial" size:contentSize];
    
    CGRect myTextRect = [content boundingRectWithSize:maximumSize
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:myFont}
                                              context:nil];
    
    CGSize myTextSize = myTextRect.size;
    CGRect newFrame = contentLabel.frame;
    newFrame.size.height = myTextSize.height;
    contentLabel.frame = newFrame;
    contentLabel.numberOfLines=0;
    contentLabel.font = myFont;
    contentLabel.textAlignment = NSTextAlignmentLeft;
    myTextHeight = myTextSize.height;
    contentLabel.text = content;
    contentLabel.textColor = [UIColor grayColor];
    [helpScrollView addSubview:contentLabel];
    totalHelpScrollHeight=contentLabel.frame.origin.y+contentLabel.frame.size.height;
   
    
    if(helpScrollView.frame.size.height<totalHelpScrollHeight)
    {
     [helpScrollView setContentSize: CGSizeMake(helpScrollView.bounds.size.width,totalHelpScrollHeight+20)];
    }
}

-(void)navBackButton{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
