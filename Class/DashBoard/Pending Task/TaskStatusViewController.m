//
//  TaskStatusViewController.m
//  Task
//
//  Created by Nagarajan on 12/20/12.
//  Copyright (c) 2012 Nagarajan. All rights reserved.
//

#import "TaskStatusViewController.h"
#import "PendingTaskViewController.h"
#import "CompletedTaskViewController.h"
#import "DashBoardViewController.h"
#import "AppDelegate.h"
#import "DataBase.h"

@interface TaskStatusViewController ()

@end

@implementation TaskStatusViewController
@synthesize completedTaskViewController;
@synthesize status,colon,pending,nameLabel,taskName;
@synthesize statusField;
@synthesize completedButton;
@synthesize dashBoardViewController;
@synthesize name,date,comments;
@synthesize taskStatusDelegate;

-(id) init

{
    self = [super init];
    if(self)
    {
        toolBar = nil;
        backButton = nil;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    //create Task name label
    taskName = [[UILabel alloc]initWithFrame:CGRectMake(05, 45, 190, 40)];
    taskName.text  = @"Task Name:";
    taskName.font = [UIFont fontWithName:@"Times New Roman" size:20];
    [self.view addSubview:taskName];
     //create name Label
    nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 90, 320, 80)];
    nameLabel.text  = name;
    nameLabel.numberOfLines=3;
    nameLabel.font = [UIFont fontWithName:@"Times New Roman" size:20];
    [self.view addSubview:nameLabel];
    //Create Status Label
    status = [[UILabel alloc]initWithFrame:CGRectMake(50, 185, 190, 40)];
    status.text  = @"Status";
    status.font = [UIFont fontWithName:@"Times New Roman" size:20];
    [self.view addSubview:status];
    //create Colon Label
    colon = [[UILabel alloc]initWithFrame:CGRectMake(150, 185, 190, 40)];
    colon.text  = @":";
    colon.font = [UIFont fontWithName:@"Times New Roman" size:20];
    [self.view addSubview:colon];
    
    //create Pending Label
    pending = [[UILabel alloc]initWithFrame:CGRectMake(190, 185, 190, 40)];
    pending.text  = @"Pending";
    pending.textColor=[UIColor redColor];
    pending.font = [UIFont fontWithName:@"Times New Roman" size:20];
    [self.view addSubview:pending];

   
    //Create Toolbar
    toolBar = [[UIToolbar alloc] init];
    toolBar.barStyle = UIBarStyleDefault;
    toolBar.tintColor=[UIColor greenColor];
    
    toolBar.frame = CGRectMake(0, 0, 320, 45);
    [self.view addSubview:toolBar];
    
    UILabel *statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 0, 100, 44)];
    statusLabel.backgroundColor = [UIColor clearColor];
    statusLabel.text = @"Task Status";
    statusLabel.textColor=[UIColor blackColor];
    statusLabel.font =[UIFont fontWithName:@"Times New Roman" size:20];
    [self.view addSubview:statusLabel];
    

    
    //Create Back Bar Button Item
    backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered
                                                 target:self
                                                 action:@selector(backButtonSelected:)];
    backButton.tintColor=[UIColor grayColor];
    [backButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont fontWithName:@"Times New Roman" size:15.0], UITextAttributeFont,nil] forState:UIControlStateNormal];
    
    
    [toolBar setItems:[NSArray arrayWithObjects:backButton,nil]];
    //create Done Button
    completedButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    completedButton.frame = CGRectMake(115,245,85,40);
    completedButton.titleLabel.font = [UIFont fontWithName:@"Times New Roman" size:15];
    [completedButton setTitle:@"Completed" forState:UIControlStateNormal];
    [completedButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [completedButton addTarget:self action:@selector(completedButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:completedButton];
   

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)backButtonSelected:(id)sender{
    [self.view removeFromSuperview];
}
-(void)completedButtonSelected:(id)sender
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"ToDo.sqlite"];
    NSMutableArray *completedTask = [NSMutableArray arrayWithContentsOfFile:path];
    
    if (nil == completedTask) {
        completedTask = [[NSMutableArray alloc] initWithCapacity:0];
    }
   NSMutableDictionary *completeTask = [[NSMutableDictionary alloc]init];
    sqlite3_stmt    *statement;
    
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO CompletedTask (TaskName, Date, Comments) VALUES (\"%@\", \"%@\", \"%@\")",name,date,comments];
        
        const char *insert_stmt = [insertSQL UTF8String];
        
        if (sqlite3_prepare_v2(database, insert_stmt, -1, &statement, NULL) != SQLITE_OK) {
            NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
        }
        int success = sqlite3_step(statement);
        sqlite3_reset(statement);
        if (success != SQLITE_ERROR) {
            sqlite3_last_insert_rowid(database);
            [completeTask setObject:name forKey:@"TaskName"];
            [completeTask setObject:date forKey:@"Date"];
            [completeTask setObject:comments forKey:@"Comments"];
            [completedTask addObject:completeTask];
            
            }
        else
        {
        NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
        }
        
        
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *path = [documentsDirectory stringByAppendingPathComponent:@"ToDo.sqlite"];
        NSMutableArray *task = [NSMutableArray arrayWithContentsOfFile:path];
        
        if (nil == task) {
            task = [[NSMutableArray alloc] initWithCapacity:0];
        }
        NSMutableDictionary *newTask = [[NSMutableDictionary alloc]init];
        sqlite3_stmt    *statement;
        
        if (sqlite3_open([path UTF8String], &database) == SQLITE_OK)
        {
            NSString *deleteSQL = [NSString stringWithFormat: @"DELETE FROM NewTask WHERE TaskName = \"%@\"",name ];
            
        const char *delete_stmt = [deleteSQL UTF8String];
            
            if (sqlite3_prepare_v2(database, delete_stmt, -1, &statement, NULL) != SQLITE_OK) {
                NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
            }
            int success = sqlite3_step(statement);
            sqlite3_reset(statement);
            if (success != SQLITE_ERROR) {
                sqlite3_last_insert_rowid(database);
                [newTask setObject:name forKey:@"TaskName"];
                [newTask setObject:date forKey:@"Date"];
                [newTask setObject:comments forKey:@"Comments"];
                [task removeObject:newTask];
            }
            else
            {
                NSAssert1(0, @"Error: failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
            }

        

            DataBase *data = [[DataBase alloc]init];
            [data getValuesFromCompletedTask];
        
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@" Task Added to Completed List" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];

}
}
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
   
    if (buttonIndex == 0) {         
        [self.view removeFromSuperview];
        if(nil != taskStatusDelegate && [taskStatusDelegate respondsToSelector:@selector(removeFromView)])
        {
            [taskStatusDelegate removeFromView];
        }
    }
    
}


@end
