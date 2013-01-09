//
//  NewTaskViewController.m
//  Task
//
//  Created by Nagarajan on 12/11/12.
//  Copyright (c) 2012 Nagarajan. All rights reserved.
//

#import "NewTaskViewController.h"
#import "TaskListViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
#import "PendingTaskViewController.h"
#import "DashBoardViewController.h"
#import "AppDelegate.h"
#import "DataBase.h"

@interface NewTaskViewController ()

@end

@implementation NewTaskViewController
@synthesize taskListViewController;
@synthesize taskCreatedDate,createNewTask;
@synthesize taskName;
@synthesize dateLabel,commentsLabel,createTask;
@synthesize datePickerView;
@synthesize pendingTaskViewController;
@synthesize dashBoardViewController;
@synthesize status;
-(id) init

{
    self = [super init];
    if(self)
    {
        taskName = nil;
        commentslabel = nil;
        createTask = nil;
        toolBar=nil;
        backButton=nil;
        doneButton = nil;
        comments = nil;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];

    toolBar = [[UIToolbar alloc] init];
    toolBar.barStyle = UIBarStyleDefault;
    toolBar.tintColor=[UIColor greenColor];
    toolBar.frame = CGRectMake(0, 0, 320, 45);
    [self.view addSubview:toolBar];
   
  backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered
                                                 target:self
                                                 action:@selector(backButtonClicked:)];
    [backButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIColor blackColor], UITextAttributeTextColor,nil] forState:UIControlStateNormal];
    backButton.tintColor=[UIColor grayColor];
    [backButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont fontWithName:@"Times New Roman" size:15.0], UITextAttributeFont,nil] forState:UIControlStateNormal];

  
     UIBarButtonItem* fixedSpace  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [fixedSpace setWidth:195];
    //Create Create Task Label
    createTask = [[UILabel alloc] initWithFrame:CGRectMake(110, 0, 100, 44)];
    createTask.backgroundColor = [UIColor clearColor];
    createTask.text = @"Create Task";
    createTask.textColor=[UIColor blackColor];
    createTask.font =[UIFont fontWithName:@"Times New Roman" size:20];
   [self.view addSubview:createTask];
    
     doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered
     target:self
     action:@selector(doneButtonClicked:)];
    [doneButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIColor blackColor], UITextAttributeTextColor,nil] forState:UIControlStateNormal];
    [doneButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont fontWithName:@"Times New Roman" size:15.0], UITextAttributeFont,nil] forState:UIControlStateNormal];
    

        doneButton.tintColor=[UIColor grayColor];
    [toolBar setItems:[NSArray arrayWithObjects:backButton,fixedSpace,doneButton,nil]];
    
    //Create Task Label
    if(nil == taskName)
    {
        taskName = [[UILabel alloc] init];
    }
    taskName = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, 90, 40)];
    taskName.text  = @"Task";
    taskName.font = [UIFont fontWithName:@"Times New Roman" size:15];
    [self.view addSubview:taskName];
    
    //Create text Field For Create a task
    if(nil==createNewTask)
    {
        createNewTask = [[UITextField alloc]init];
    }
    createNewTask = [[UITextField alloc]initWithFrame:CGRectMake(110, 50, 200, 30)];
    createNewTask.borderStyle = UITextBorderStyleBezel;
    createNewTask.textAlignment = UITextAlignmentLeft;
    createNewTask.layer.borderWidth = 1;
    createNewTask.layer.borderColor = [[UIColor grayColor]CGColor];
    createNewTask.delegate = self;
    createNewTask.keyboardType = UIKeyboardTypeDefault;
       createNewTask.returnKeyType = UIReturnKeyNext;
    createNewTask.tag = 1;
    createNewTask.font = [UIFont fontWithName:@"Times New Roman" size:15];
    [self.view addSubview: createNewTask];
    //Create Label for Date
    if(nil == dateLabel)
    {
        dateLabel = [[UILabel alloc]init];
    }
    dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 90, 90, 40)];
    dateLabel.text  = @"Due Date";
    dateLabel.font = [UIFont fontWithName:@"Times New Roman" size:15];
    [self.view addSubview:dateLabel];
    //Create TextField For Task Created
    if(nil == taskCreatedDate)
    {
        taskCreatedDate = [[UITextField alloc]init];
    }
    taskCreatedDate = [[UITextField alloc]initWithFrame:CGRectMake(110, 90, 200, 30)];
    taskCreatedDate.borderStyle = UITextBorderStyleBezel;
    taskCreatedDate.textAlignment = UITextAlignmentLeft;
    taskCreatedDate.layer.borderWidth = 1;
    taskCreatedDate.layer.borderColor = [[UIColor grayColor]CGColor];
    taskCreatedDate.delegate = self;
    
    taskCreatedDate.keyboardType = UIKeyboardTypeDefault;
    taskCreatedDate.font = [UIFont fontWithName:@"Times New Roman" size:15];
    taskCreatedDate.tag = 2;
    [self.view addSubview: taskCreatedDate];
    
   //Create Comments Label
    if(nil == commentsLabel)
    {
        commentsLabel = [[UILabel alloc]init];
    }
    commentsLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 135, 90, 40)];
    commentsLabel.text  = @"Comments";
    commentsLabel.font = [UIFont fontWithName:@"Times New Roman" size:15];
    [self.view addSubview:commentsLabel];
     //Create Comments text view
    if(nil == comments)
    {
        comments = [[UITextView alloc]init];
    }
    comments = [[UITextView alloc] initWithFrame:CGRectMake(110.0f, 135.0f, 200.0f, 80.0f)];
    comments.font =[UIFont fontWithName:@"Times New Roman" size:15];
    comments.layer.borderWidth = 1;
    comments.layer.borderColor = [[UIColor blackColor]CGColor];
   comments.returnKeyType = UIReturnKeyDone;
    comments.delegate = self;
    [self.view addSubview:comments];
    
    //create Data picker
    if(nil == datePickerView)
    {
        datePickerView = [[UIDatePicker alloc]init];
       
    }
    datePickerView = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 250, 250, 250)];
    datePickerView.datePickerMode = UIDatePickerModeDateAndTime;
    datePickerView.hidden = NO;
    datePickerView.date = [NSDate date];
   
    taskCreatedDate.inputView = datePickerView;
    [datePickerView addTarget:self
                       action:@selector(ValueChanged:)
             forControlEvents:UIControlEventValueChanged];
}
- (void)ValueChanged:(id)sender{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.timeStyle = NSDateFormatterMediumStyle;
    df.dateStyle = NSDateFormatterMediumStyle;
    taskCreatedDate.text = [NSString stringWithFormat:@"%@",
                            [df stringFromDate:datePickerView.date]];
    [datePickerView resignFirstResponder];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
        
    for (UITextField *textField in self.view.subviews) {
        if ([textField isFirstResponder]) {
            [textField resignFirstResponder];
        }
    }
    [super touchesBegan:touches withEvent:event];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)doneButtonClicked:(id)sender{
       
    if(nil != createNewTask)
    {
        [createNewTask resignFirstResponder];
    }
    if(nil != taskCreatedDate)
    {
        [taskCreatedDate resignFirstResponder];
    }
    if(nil != comments)
    {
        [comments resignFirstResponder];
    }
    
    NSString* str1 =createNewTask.text ;
    
    NSString* str2 =taskCreatedDate.text ;
    
    if( ([str1 length] == 0) && ([str2 length] > 0) ){
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Enter  Task " delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        
    }
    else if( ([str1 length] > 0 ) && ([str2 length]== 0) )
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Enter  Due Date " delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        
    }
    
    else if(([str1 length] == 0 ) && ([str2 length]== 0) ){
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Enter Task and Due Date " delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        
        
    }
    else{
        [self saveData];
        
        TaskListViewController *tempTaskListViewController = [[TaskListViewController alloc]init];
        tempTaskListViewController.view.frame = CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
        self.taskListViewController = tempTaskListViewController;
        [self.view addSubview:taskListViewController.view];
        
        [createNewTask setText:nil];
        [taskCreatedDate setText:nil];
        [comments setText:nil];

        }
          
    }

-(void) saveData
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"ToDo.sqlite"];
    NSMutableArray *task = [NSMutableArray arrayWithContentsOfFile:path];
    
    if (nil == task)
    {
        task = [[NSMutableArray alloc] initWithCapacity:0];
    }
    NSMutableDictionary *newTask = [[NSMutableDictionary alloc]init];

    
    sqlite3_stmt    *statement;
    
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO NewTask (TaskName, Date, Comments) VALUES (\"%@\", \"%@\", \"%@\")", createNewTask.text, taskCreatedDate.text, comments.text];
        
        const char *insert_stmt = [insertSQL UTF8String];

        if (sqlite3_prepare_v2(database, insert_stmt, -1, &statement, NULL) != SQLITE_OK) {
            NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
        }
        int success = sqlite3_step(statement);
        sqlite3_reset(statement);
        if (success != SQLITE_ERROR) {
            sqlite3_last_insert_rowid(database);
            [newTask setObject:createNewTask.text forKey:@"TaskName"];
            [newTask setObject:taskCreatedDate.text forKey:@"Date"];
            [newTask setObject:comments.text forKey:@"Comments"];
            [task addObject:newTask];
            } 
        else
        {
            NSAssert1(0, @"Error:failed to insert into the database with message '%s'.", sqlite3_errmsg(database));
        }
        
        DataBase *data = [[DataBase alloc]init];
        [data getValuesFromCompletedTask];
   
    }
    
 
    
}

-(void)backButtonClicked:(id)sender {
   
    if(nil != createNewTask)
    {
        [createNewTask resignFirstResponder];
    }
    if(nil != taskCreatedDate)
    {
        [taskCreatedDate resignFirstResponder];
    }
    if(nil != comments)
    {
        [comments resignFirstResponder];
    }

    [self.view removeFromSuperview];
    
}


@end
