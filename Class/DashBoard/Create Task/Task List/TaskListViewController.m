//
//  TaskListViewController.m
//  Task
//
//  Created by Nagarajan on 12/11/12.
//  Copyright (c) 2012 Nagarajan. All rights reserved.
//

#import "TodoModel.h"
#import "SharedObject.h"
#import "TaskListViewController.h"
#import "NewTaskViewController.h"
#import "TaskListViewController.h"
#import "AppDelegate.h"
#import "PendingTaskViewController.h"
#import "DataBase.h"
@interface TaskListViewController ()

@end

@implementation TaskListViewController
@synthesize taskDetailsViewController;
@synthesize selectedArray;
@synthesize pending;
-(id) init

{
    self = [super init];
    
    if(self)
    {
        tableview = nil;
       backButton = nil;
        toolBar = nil;
        editButton = nil;
        taskList = nil;
        nameArray = nil;
        date = nil;
        comments = nil;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    // Do any additional setup after loading the view from its nib.
    [self testGetDataFromNewTask];
    
    
    if(nil == tableview)
    {
        tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 45,[UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height-45) style:UITableViewStylePlain];
    }
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    
    
    
    toolBar = [[UIToolbar alloc] init];
    toolBar.barStyle = UIBarStyleDefault;
    toolBar.tintColor=[UIColor greenColor];

    toolBar.frame = CGRectMake(0, 0, 320, 45);
    [self.view addSubview:toolBar];
    //Create Create Task List Label
    taskList = [[UILabel alloc] initWithFrame:CGRectMake(130, 0, 100, 44)];
    taskList.backgroundColor = [UIColor clearColor];
    taskList.text = @"Task List";
    taskList.textColor=[UIColor blackColor];
    taskList.font =[UIFont fontWithName:@"Times New Roman" size:20];
    [self.view addSubview:taskList];
    
    //Create Back Bar Button Item
    backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:@selector(backButtonSelected:)];
    backButton.tintColor=[UIColor grayColor];
    [backButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont fontWithName:@"Times New Roman" size:15.0], UITextAttributeFont,nil] forState:UIControlStateNormal];
    UIBarButtonItem* fixedSpace  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [fixedSpace setWidth:195];
    
    //Create Edit Bar Button Item
    editButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleBordered
                                                 target:self
                                                 action:@selector(editButtonSelected:)];
     
     editButton.tintColor=[UIColor grayColor];
    [editButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont fontWithName:@"Times New Roman" size:15.0], UITextAttributeFont,nil] forState:UIControlStateNormal];
   
     [toolBar setItems:[NSArray arrayWithObjects:backButton,fixedSpace,editButton,nil]];
    

}

-(void)backButtonSelected:(id)sender {
    [self.view removeFromSuperview];
    
}
-(void)editButtonSelected:(id)sender{
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
   
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    return [nameArray count];
    

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [nameArray objectAtIndex:indexPath.row];
   cell.detailTextLabel.text = [date objectAtIndex:indexPath.row];;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TaskDetailsViewController *tempTaskDetailsViewController = [[TaskDetailsViewController alloc] init];
  
    NSArray *array = [self getDataFromSelectedRow:indexPath.row];
    for(int i=0;i<[array count];i++)
    {
        tempTaskDetailsViewController.name = [[array objectAtIndex:i] objectForKey:@"taskname"];
        tempTaskDetailsViewController.date = [[array objectAtIndex:i] objectForKey:@"date"];
        tempTaskDetailsViewController.comments = [[array objectAtIndex:i] objectForKey:@"comments"];
    }

    tempTaskDetailsViewController.taskDetailsDelegate = self;
tempTaskDetailsViewController.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.taskDetailsViewController = tempTaskDetailsViewController;
    [self.view addSubview:taskDetailsViewController.view];
}
-(void) removeFromView
{
    [self.view removeFromSuperview];
}

-(void) testGetDataFromNewTask
{
    if(nil == date)
    {
        date = [[NSMutableArray alloc] init];
    }
    if(nil == nameArray)
    {
        nameArray = [[NSMutableArray alloc] init];
    }
    if(nil == comments)
    {
        comments = [[NSMutableArray alloc]init];
    }
    
    DataBase *data = [[DataBase alloc]init];
    [data getValuesFromNewTask];
    
    modelEntity = [SharedObject sharedInstance].todoModelEntity;
        for(int i=0;i<[modelEntity.modelArray count];i++)
    {
        NSMutableArray *array = [modelEntity.modelArray objectAtIndex:i];
        
        for(int i=0;i<[array count];i++)
        {
            [date addObject:[[array objectAtIndex:i] objectForKey:@"date"]];
            [nameArray addObject:[[array objectAtIndex:i] objectForKey:@"taskname"]];
            [comments addObject:[[array objectAtIndex:i] objectForKey:@"comments"]];
        }
    }

}
-(NSArray*) getDataFromSelectedRow:(int) index{
    modelEntity = [SharedObject sharedInstance].todoModelEntity;
    for(int i=0;i<[modelEntity.modelArray count];i++)
    {
        NSArray *array = [modelEntity.modelArray objectAtIndex:index];
        return array;
    }
    return nil;
}





@end
