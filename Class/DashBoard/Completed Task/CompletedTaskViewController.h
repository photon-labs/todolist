//
//  CompletedTaskViewController.h
//  Task
//
//  Created by Nagarajan on 12/12/12.
//  Copyright (c) 2012 Nagarajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@class AppDelegate;
@class DataBase;
@class PendingTaskViewController;
@class TaskStatusViewController;
@class TodoModelEntity;
@class CompletedModelEntity;
@class ToDoModel;
@interface CompletedTaskViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *tableview;
    UIBarButtonItem *backButton;
    UIToolbar *toolBar;
    UILabel *completedList;
    NSArray *completedListArray;
    
    TodoModelEntity *modelEntity;
    CompletedModelEntity *completedEntity;
    NSMutableArray *nameArray;
    NSMutableArray *date;
    NSMutableArray *comments;
}
@property (nonatomic, retain) UITableView *tableview;
@property (strong,nonatomic) UIBarButtonItem *backButton;
@property (strong,nonatomic) UIToolbar *toolBar;
@property (strong,nonatomic)UILabel *completedList;

@property (nonatomic,retain) NSArray* completedListArray;
-(void)backButtonSelected:(id)sender;


-(void) testGetDataFromCompletedTask;

@end
