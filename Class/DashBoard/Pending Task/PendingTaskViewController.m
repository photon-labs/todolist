//
//  PendingTaskViewController.m
//  Task
//
//  Created by Nagarajan on 12/12/12.
//  Copyright (c) 2012 Nagarajan. All rights reserved.
//

#import "PendingTaskViewController.h"
#import "DashBoardViewController.h"
#import "TaskStatusViewController.h"
#import "NewTaskViewController.h"
#import "CompletedTaskViewController.h"
#import "TaskListViewController.h"
#import "AppDelegate.h"
#import "TodoModel.h"
#import "SharedObject.h"
#import "DataBase.h"

@interface PendingTaskViewController ()

@end

@implementation PendingTaskViewController
@synthesize taskStatusViewController;
-(id) init

{
    self = [super init];
    if(self)
    {
        tableview = nil;
        backButton = nil;
        toolBar = nil;
        pendingList = nil;
       
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
 
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
        NSMutableArray *pendingArray = [modelEntity.modelArray objectAtIndex:i];
        
        for(int i=0;i<[pendingArray count];i++)
        {
            [date addObject:[[pendingArray objectAtIndex:i] objectForKey:@"date"]];
            [nameArray addObject:[[pendingArray objectAtIndex:i] objectForKey:@"taskname"]];
            [comments addObject:[[pendingArray objectAtIndex:i] objectForKey:@"comments"]];
        }
        
    }
   if(nil == tableview)
    {
        tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 45,[UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height-45) style:UITableViewStylePlain];
    }
    [self.view addSubview:tableview];
   
    tableview.delegate = self;
    tableview.dataSource = self;
    
    toolBar = [[UIToolbar alloc] init];
    toolBar.barStyle = UIBarStyleDefault;
    toolBar.tintColor=[UIColor greenColor];
    toolBar.frame = CGRectMake(0, 0, 320, 45);
    [self.view addSubview:toolBar];
    

    
//Create Create PendingTask Lisk Label
    pendingList = [[UILabel alloc] initWithFrame:CGRectMake(110, 0, 150, 44)];
    pendingList.backgroundColor = [UIColor clearColor];
    pendingList.text = @"Pending List";
    pendingList.textColor=[UIColor blackColor];
    pendingList.font =[UIFont fontWithName:@"Times New Roman" size:20];
    [self.view addSubview:pendingList];
    
    backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered
                                                 target:self
                                                 action:@selector(backButtonSelected:)];

    [backButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont fontWithName:@"Times New Roman" size:15.0], UITextAttributeFont,nil] forState:UIControlStateNormal];
     backButton.tintColor = [UIColor grayColor];
    [toolBar setItems:[NSArray arrayWithObjects:backButton,nil]];
    
    

  }

-(void)backButtonSelected:(id)sender
{
    [self.view removeFromSuperview];
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
    cell.detailTextLabel.text = [date objectAtIndex:indexPath.row];
    return cell;
   
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TaskStatusViewController *tempTaskStatusViewController = [[TaskStatusViewController alloc] init];
     NSArray *array = [self getDataFromSelectedRow:indexPath.row];
    
   for(int i=0;i<[array count];i++)
    {
        tempTaskStatusViewController.name = [[array objectAtIndex:i] objectForKey:@"taskname"];
         tempTaskStatusViewController.date = [[array objectAtIndex:i] objectForKey:@"date"];
         tempTaskStatusViewController.comments = [[array objectAtIndex:i] objectForKey:@"comments"];
    }
    

    
    tempTaskStatusViewController.taskStatusDelegate = self;
         tempTaskStatusViewController.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.taskStatusViewController = tempTaskStatusViewController;
    [self.view addSubview:tempTaskStatusViewController.view];
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
-(void) removeFromView
{
    [self.view removeFromSuperview];
}


@end
