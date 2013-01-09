//
//  CompletedTaskViewController.m
//  Task
//
//  Created by Nagarajan on 12/12/12.
//  Copyright (c) 2012 Nagarajan. All rights reserved.
//
#import "TodoModel.h"
#import "SharedObject.h"
#import "CompletedTaskViewController.h"
#import "DashBoardViewController.h"
#import "PendingTaskViewController.h"
#import "TaskStatusViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "DataBase.h"
@interface CompletedTaskViewController ()

@end

@implementation CompletedTaskViewController
@synthesize completedListArray;
-(id) init

{
    self = [super init];
    if(self)
    {
        tableview = nil;
        backButton = nil;
        toolBar = nil;
        completedList = nil;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
    [self testGetDataFromCompletedTask];
    

        
    
    if(nil == tableview)
    {
        tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 45,[UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height - 45) style:UITableViewStylePlain];
    }
    [self.view addSubview:tableview];
    
    //Create Toolbar And backbar Button Item
    toolBar = [[UIToolbar alloc] init];
    toolBar.barStyle = UIBarStyleDefault;
    toolBar.tintColor = [UIColor greenColor];
    toolBar.frame = CGRectMake(0, 0, 320, 45);
    [self.view addSubview:toolBar];
    //Create Create PendingTask Lisk Label
    completedList = [[UILabel alloc] initWithFrame:CGRectMake(110, 0, 150, 44)];
    completedList.backgroundColor = [UIColor clearColor];
    completedList.text = @"Completed List";
    completedList.textColor=[UIColor blackColor];
    completedList.font =[UIFont fontWithName:@"Times New Roman" size:20];
    
    [self.view addSubview:completedList];
    tableview.delegate= self;
    tableview.dataSource=self;
 
    backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered
                                                 target:self
                                                 action:@selector(backButtonSelected:)];

    [backButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont fontWithName:@"Times New Roman" size:15.0], UITextAttributeFont,nil] forState:UIControlStateNormal];
    backButton.tintColor = [UIColor grayColor];
       
    [toolBar setItems:[NSArray arrayWithObjects:backButton,nil]];
    
}

-(void)backButtonSelected:(id)sender {
    [self.view removeFromSuperview];
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
     [self.tableview reloadData];
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

-(void) testGetDataFromCompletedTask
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
      [data getValuesFromCompletedTask];
    
    
    
    completedEntity = [SharedObject sharedInstance].completedModelEntity;
    for(int i=0;i<[completedEntity.completedModelArray count];i++)
    {
        NSMutableArray *array = [completedEntity.completedModelArray objectAtIndex:i];
        
        for(int i=0;i<[array count];i++)
        {
            [date addObject:[[array objectAtIndex:i] objectForKey:@"date"]];
            [nameArray addObject:[[array objectAtIndex:i] objectForKey:@"taskname"]];
            [comments addObject:[[array objectAtIndex:i] objectForKey:@"comments"]];
        }
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}




@end
