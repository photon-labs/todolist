//
//  PendingTaskViewController.h
//  Task
//
//  Created by Nagarajan on 12/12/12.
//  Copyright (c) 2012 Nagarajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskStatusViewController.h"
@class AppDelegate;
@class DataBase;
@class TaskStatusViewController;
@class NewTaskViewController;
@class CompletedTaskViewController;
@class TasklistViewController;
@class TodoModelEntity;
@class ToDoModel;
@interface PendingTaskViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,TaskStatusDelegate>
{
    UITableView *tableview;
    UIBarButtonItem *backButton;
    UIToolbar *toolBar;
    UILabel* pendingList;
    NSMutableArray *nameArray;
    NSMutableArray *date;
    NSMutableArray *comments;
    
    TodoModelEntity *modelEntity; 
    TaskStatusViewController* taskStatusViewController;
    
}
@property (nonatomic, retain) UITableView *tableview;
@property (strong,nonatomic) UIBarButtonItem *backButton;
@property (strong,nonatomic) UIToolbar *toolBar;
@property (strong,nonatomic) UILabel *pendingList;
@property(nonatomic, strong) TaskStatusViewController* taskStatusViewController;

-(void)backButtonSelected:(id)sender;
-(NSArray*) getDataFromSelectedRow:(int) index;
@end
