//
//  DashBoardViewController.m
//  Task
//
//  Created by Nagarajan on 12/11/12.
//  Copyright (c) 2012 Nagarajan. All rights reserved.
//

#import "DashBoardViewController.h"
#import "NewTaskViewController.h"
#import "PendingTaskViewController.h"
#import "CompletedTaskViewController.h"
#import "SettingsViewController.h"
#import "AppDelegate.h"
#import "DataBase.h"
@interface DashBoardViewController ()

@end

@implementation DashBoardViewController
@synthesize createTask,completedTask,pendingTask,settings;
@synthesize createTaskViewController;
@synthesize pendingTaskViewController;
@synthesize completedTaskViewController;
@synthesize settingsViewController;



-(id) init

{
    self = [super init];
    if(self)
    {
        createTask = nil;
        completedTask = nil;
        pendingTask =   nil;
        settings = nil;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
       self.view.backgroundColor =[UIColor whiteColor];
    //Create Task Button
    if(nil == createTask)
    {
        createTask = [[UIButton alloc] init];
    }
    createTask = [UIButton buttonWithType:UIButtonTypeCustom];
    createTask.frame = CGRectMake(45,80,100,100);
    createTask.titleLabel.font = [UIFont fontWithName:@"Times New Roman" size:15];
    createTask.titleEdgeInsets = UIEdgeInsetsMake(105.0, 8.0, 0.0, 0.0);
   [createTask setTitle:@"Create Task" forState:UIControlStateNormal];
  
    [createTask setTitleColor:[UIColor colorWithRed:36/255.0 green:71/255.0 blue:113/255.0 alpha:1.0] forState:UIControlStateNormal];
    [createTask addTarget:self action:@selector(createTaskClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:createTask];
    
    
    UIImage *createTaskImage = [UIImage imageNamed:@"create_icon.png"];
       
    //set image as background
    [createTask setBackgroundImage:createTaskImage forState:UIControlStateNormal];
    [self.view addSubview:createTask];
  
    
    
    //Create completed Task Button
    if(nil == completedTask)
    {
        completedTask = [[UIButton alloc] init];
    }
    completedTask = [UIButton buttonWithType:UIButtonTypeCustom];
    completedTask.frame = CGRectMake(45,210,100,100);
    
    completedTask.titleLabel.font = [UIFont fontWithName:@"Times New Roman" size:15];
    completedTask.titleEdgeInsets = UIEdgeInsetsMake(105.0, 0.0, 0.0, 0.0);
    [completedTask setTitle:@"CompletedTask" forState:UIControlStateNormal];
    [completedTask setTitleColor:[UIColor colorWithRed:36/255.0 green:71/255.0 blue:113/255.0 alpha:1.0] forState:UIControlStateNormal];
    [completedTask addTarget:self action:@selector(completedTaskClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:completedTask];
    
    UIImage *completedTaskImage = [UIImage imageNamed:@"completed_icon.png"];
    
    //set image as background
    [completedTask setBackgroundImage:completedTaskImage forState:UIControlStateNormal];
    [self.view addSubview:completedTask];
    
    //Create pending Task Button
    if(nil == pendingTask)
    {
        pendingTask = [[UIButton alloc] init];
    }
    pendingTask = [UIButton buttonWithType:UIButtonTypeCustom];
    pendingTask.frame = CGRectMake(170,80,100,100);
    pendingTask.titleLabel.font = [UIFont fontWithName:@"Times New Roman" size:15];
    pendingTask.titleEdgeInsets = UIEdgeInsetsMake(105.0, 0.0, 0.0, 0.0);
    [pendingTask setTitle:@"Pending Task" forState:UIControlStateNormal];
    [pendingTask setTitleColor:[UIColor colorWithRed:36/255.0 green:71/255.0 blue:113/255.0 alpha:1.0] forState:UIControlStateNormal];

    [pendingTask addTarget:self action:@selector(pendingTaskClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pendingTask];
    
    UIImage *pendingTaskImage = [UIImage imageNamed:@"pending_icon.png"];
    
    //set image as background
    [pendingTask setBackgroundImage:pendingTaskImage forState:UIControlStateNormal];
    [self.view addSubview:pendingTask];

    
    //Create pending Settings Button
    if(nil == settings)
    {
        settings = [[UIButton alloc] init];
    }
    settings = [UIButton buttonWithType:UIButtonTypeCustom];
    settings.frame = CGRectMake(170,210,100,100);
    settings.titleLabel.font = [UIFont fontWithName:@"Times New Roman" size:15];
    settings.titleEdgeInsets = UIEdgeInsetsMake(105.0, 0.0, 0.0, 0.0);

    [settings setTitle:@"Settings" forState:UIControlStateNormal];
    [settings setTitleColor:[UIColor colorWithRed:36/255.0 green:71/255.0 blue:113/255.0 alpha:1.0] forState:UIControlStateNormal];
    [settings addTarget:self action:@selector(settingsClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:settings];
    
    UIImage *settingsImage = [UIImage imageNamed:@"settings_icon.png"];
    
    //set image as background
    [settings setBackgroundImage:settingsImage forState:UIControlStateNormal];
    [self.view addSubview:settings];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(void)createTaskClicked:(id)sender {
    
    NewTaskViewController *tempNewTaskViewController = [[NewTaskViewController alloc] init];
    tempNewTaskViewController.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height);
    self.createTaskViewController = tempNewTaskViewController;
    [self.view addSubview:createTaskViewController.view];
    [self.view bringSubviewToFront:createTaskViewController.view];
    
}
-(void)pendingTaskClicked:(id)sender {
    
    int taskCount = [self getNewTaskCount];
   if(taskCount > 0)
   {
       DataBase *data = [[DataBase alloc]init];
       [data getValuesFromNewTask];
       
        PendingTaskViewController *tempPendingTaskViewController = [[PendingTaskViewController alloc]init];
        tempPendingTaskViewController.view.frame = CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
        self.pendingTaskViewController = tempPendingTaskViewController;
        [self.view addSubview:pendingTaskViewController.view];
    }
    else
    {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"No Tasks Available" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
        
    }
}

-(void)completedTaskClicked:(id)sender {
    int taskCount = [self getCompletedTaskCount];
    if(taskCount > 0){
        DataBase *data = [[DataBase alloc]init];
        [data getValuesFromCompletedTask];

    CompletedTaskViewController *tempCompletedTaskViewController = [[CompletedTaskViewController alloc]init];
    tempCompletedTaskViewController.view.frame = CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
    self.completedTaskViewController = tempCompletedTaskViewController;
    [self.view addSubview:completedTaskViewController.view];
    }
    else
    {
   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"No Tasks available" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
       [alert show];
    }

    
}
-(void)settingsClicked:(id)sender{
    SettingsViewController *tempSettingsViewController = [[SettingsViewController alloc] init];
    tempSettingsViewController.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.settingsViewController = tempSettingsViewController;
    [self.view addSubview:settingsViewController.view];
    
}

-(int) getCompletedTaskCount
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"ToDo.sqlite"];
    int count = 0;
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK)
    {
        const char* sqlStatement = "SELECT COUNT(*) FROM CompletedTask";
        sqlite3_stmt *statement;
        
        if( sqlite3_prepare_v2(database, sqlStatement, -1, &statement, NULL) == SQLITE_OK )
        {
            while( sqlite3_step(statement) == SQLITE_ROW )
            {
                count = sqlite3_column_int(statement, 0);
            }
        }
        else
        {
            NSLog( @"Failed from sqlite3_prepare_v2. Error is:  %s", sqlite3_errmsg(database) );
        }
        
       sqlite3_finalize(statement);
        sqlite3_close(database);
    }
    
    return count;
}
-(int) getNewTaskCount
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"ToDo.sqlite"];
    int count = 0;
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK)
    {
        const char* sqlStatement = "SELECT COUNT(*) FROM NewTask";
        sqlite3_stmt *statement;
        
        if( sqlite3_prepare_v2(database, sqlStatement, -1, &statement, NULL) == SQLITE_OK )
        {
            while( sqlite3_step(statement) == SQLITE_ROW )
            {
                count = sqlite3_column_int(statement, 0);
            }
        }
        else
        {
            NSLog( @"Failed from sqlite3_prepare_v2. Error is:  %s", sqlite3_errmsg(database) );
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(database);
    }
    
    return count;

}


@end
