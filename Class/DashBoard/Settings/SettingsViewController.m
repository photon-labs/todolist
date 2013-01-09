//
//  SettingsViewController.m
//  Task
//
//  Created by Nagarajan on 12/12/12.
//  Copyright (c) 2012 Nagarajan. All rights reserved.
//

#import "SettingsViewController.h"
#import "DashBoardViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

-(id)init{
    
        self = [super init];
        if(self)
        {
            settings = nil;
            toolBar = nil;
            backButton=nil;
            
        }
        return self;
    

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
       
    //Create ToolBar And Back bar Button Item
    toolBar = [[UIToolbar alloc] init];
    toolBar.barStyle = UIBarStyleDefault;
    toolBar.tintColor = [UIColor greenColor];
    toolBar.frame = CGRectMake(0, 0, 320, 45);
    [self.view addSubview:toolBar];

    
    settings = [[UILabel alloc] initWithFrame:CGRectMake(120, 0, 100, 44)];
    settings.backgroundColor = [UIColor clearColor];
    settings.text = @"Settings";
    settings.textColor=[UIColor blackColor];
    settings.font =[UIFont fontWithName:@"Times New Roman" size:20];
    [self.view addSubview:settings];

    
  
    backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered
                                                 target:self
                                                 action:@selector(backButtonSelected:)];

    [backButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont fontWithName:@"Times New Roman" size:15.0], UITextAttributeFont,nil] forState:UIControlStateNormal];
    backButton.tintColor = [UIColor grayColor];
    [toolBar setItems:[NSArray arrayWithObjects:backButton,nil]];

   
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)backButtonSelected:(id)sender
{
   [self.view removeFromSuperview]; 
}

@end
