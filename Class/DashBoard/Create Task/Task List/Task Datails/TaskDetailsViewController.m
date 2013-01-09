//
//  TaskDetailsViewController.m
//  Task
//
//  Created by Nagarajan on 12/19/12.
//  Copyright (c) 2012 Nagarajan. All rights reserved.
//

#import "TaskDetailsViewController.h"
#import "NewTaskViewController.h"
@interface TaskDetailsViewController ()

@end

@implementation TaskDetailsViewController
@synthesize dateLabel,createTask;
@synthesize listArray;
@synthesize name;
@synthesize date, comments;
@synthesize nameLabel,dueDate,comment;
@synthesize commentsView,taskName;
@synthesize createTaskViewController;
@synthesize taskDetailsDelegate;

-(id) init
{
    self = [super init];
    if(self)
    {
        toolBar=nil;
        backButton=nil;
        createTask = nil;
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
 [toolBar setItems:[NSArray arrayWithObjects:backButton,nil]];
    
    
    //Create Create Task Label
    createTask = [[UILabel alloc] initWithFrame:CGRectMake(110, 0, 200, 44)];
    createTask.backgroundColor = [UIColor clearColor];
    createTask.text = @"Task Details";
    createTask.textColor=[UIColor blackColor];
    createTask.font =[UIFont fontWithName:@"Times New Roman" size:20];
    [self.view addSubview:createTask];

    
   // create Task Name Text View
    taskName = [[UILabel alloc] initWithFrame:CGRectMake(10,70,320, 160)];
    taskName.backgroundColor = [UIColor clearColor];
    taskName.text = name;
    taskName.numberOfLines= 6;
    taskName.textAlignment=UITextAlignmentLeft;
    taskName.font =[UIFont fontWithName:@"Times New Roman" size:16];
    taskName.textColor=[UIColor blackColor];
    [self.view addSubview:taskName];
   
    //Create Due Date Label
    dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 210, 170, 44)];
    dateLabel.backgroundColor = [UIColor clearColor];
    dateLabel.text = date;
    dateLabel.font =[UIFont fontWithName:@"Times New Roman" size:16];
    dateLabel.textColor=[UIColor blackColor];
    [self.view addSubview:dateLabel];
    
    //create Comments Comments View
    commentsView = [[UILabel alloc] initWithFrame:CGRectMake(10, 285, 130, 170)];
    commentsView.backgroundColor = [UIColor clearColor];
    commentsView.text = comments;
    commentsView.numberOfLines = 8;
    commentsView.textAlignment=UITextAlignmentLeft;
    commentsView.textColor=[UIColor blackColor];
    commentsView.font =[UIFont fontWithName:@"Times New Roman" size:16];
    [self.view addSubview:commentsView];

    
    nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(05, 45, 100, 44)];
    nameLabel.text = @"Task Name:";
    nameLabel.textColor=[UIColor redColor];
    [self.view addSubview:nameLabel];
    
    dueDate = [[UILabel alloc] initWithFrame:CGRectMake(05, 210, 100, 44)];
    dueDate.text = @"Due Date:";
    dueDate.textColor=[UIColor blueColor];
    [self.view addSubview:dueDate];
    
    comment = [[UILabel alloc] initWithFrame:CGRectMake(05, 245, 100, 44)];
    comment.text = @"Comments:";
    comment.textColor=[UIColor magentaColor];
    [self.view addSubview:comment];



}

- (void)viewDidUnload
{
    [super viewDidUnload];
   }

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)backButtonClicked:(id)sender {

    
    [self.view removeFromSuperview];
    if(nil != taskDetailsDelegate && [taskDetailsDelegate respondsToSelector:@selector(removeFromView)])
    {
        [taskDetailsDelegate removeFromView];
    }


    
}

@end
