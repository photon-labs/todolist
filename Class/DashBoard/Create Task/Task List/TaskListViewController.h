//
//  TaskListViewController.h
//  Task
//
//  Created by Nagarajan on 12/11/12.
//  Copyright (c) 2012 Nagarajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskDetailsViewController.h"
@class NewTaskViewController;
@class TaskDetailsViewController;
@class TodoModelEntity;
@class ToDoModel;
@class PendingTaskViewController;
@class DataBase;
@interface TaskListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,TaskDetailsDelegate>
{
    UITableView *tableview;
    UIBarButtonItem *backButton;
    UIBarButtonItem *editButton;
    UIToolbar *toolBar;
    UILabel *taskList;
    NSMutableArray *nameArray;
    NSMutableArray *date;
    NSMutableArray *comments;
    NSMutableDictionary *dataFromPlistDict;
    TaskDetailsViewController *taskDetailsViewController;
    TodoModelEntity *modelEntity;
    NSMutableArray *selectedArray;
    PendingTaskViewController *pending;
    
   

   }
@property (nonatomic, retain) UITableView *tableview;
@property (strong,nonatomic) UIBarButtonItem *backButton;
@property (strong,nonatomic) UIBarButtonItem *editButton;
@property (strong,nonatomic) UIToolbar *toolBar;
@property (strong,nonatomic) UILabel *taskList;
-(void)backButtonSelected:(id)sender;
-(void)editButtonSelected:(id)sender;

@property (nonatomic,retain) NSMutableDictionary *dataFromPlistDict;
@property (nonatomic,retain)NSMutableArray *selectedArray;
@property(nonatomic, strong) TaskDetailsViewController *taskDetailsViewController;
@property(nonatomic, strong)PendingTaskViewController *pending;

-(void) testGetDataFromNewTask;
@end
