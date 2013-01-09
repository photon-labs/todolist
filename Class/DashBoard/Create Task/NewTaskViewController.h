//
//  NewTaskViewController.h
//  Task
//
//  Created by Nagarajan on 12/11/12.
//  Copyright (c) 2012 Nagarajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
@class DataBase;
@class DashBoardViewController;
@class TaskListViewController;
@class PendingTaskViewController;

@interface NewTaskViewController : UIViewController <NSFetchedResultsControllerDelegate,UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate,UITextViewDelegate>{
    UIBarButtonItem *backButton;
    UIBarButtonItem *doneButton;
    UIToolbar *toolBar;
    UITextField* createNewTask;
    UITextField* taskCreatedDate;
    UIDatePicker* datePickerView;
    UILabel* taskName;
    UILabel* dateLabel,*commentslabel;
    UILabel* createTask;
    UITextView *comments;
    sqlite3 *database;

    TaskListViewController *taskListViewController;
    PendingTaskViewController *pendingTaskViewController;
    DashBoardViewController* dashBoardViewController;
    UILabel *status;
    
    NSString *databasePath;
    }
@property (strong,nonatomic) UIBarButtonItem *backButton;
@property(nonatomic, retain) UIBarButtonItem *doneButton;
@property (strong,nonatomic) UIToolbar *toolBar;
@property(nonatomic, strong) UITextField* createNewTask;
@property(nonatomic, strong) UITextField* taskCreatedDate;
@property (nonatomic, strong) UILabel* taskName;
@property (nonatomic, strong) UILabel* dateLabel,*commentsLabel;
@property (nonatomic, strong) UITextView *comments;
@property (nonatomic, strong) UILabel* createTask;
@property (nonatomic, strong) NSString* createNewTaskString;
@property (nonatomic, strong)UIDatePicker* datePickerView;
@property (nonatomic, retain) NSMutableArray *eventArray;
@property(nonatomic, strong) TaskListViewController* taskListViewController;
@property(nonatomic, strong) PendingTaskViewController *pendingTaskViewController;
@property(nonatomic, strong)DashBoardViewController* dashBoardViewController;
@property (nonatomic, strong)UILabel *status;

-(void)doneButtonClicked:(id)sender;
-(void)backButtonClicked:(id)sender;


@end
