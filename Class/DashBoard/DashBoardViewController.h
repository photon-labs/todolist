//
//  DashBoardViewController.h
//  Task
//
//  Created by Nagarajan on 12/11/12.
//  Copyright (c) 2012 Nagarajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@class AppDelegate;
@class DataBase;
@class NewTaskViewController;
@class PendingTaskViewController;
@class CompletedTaskViewController;
@class SettingsViewController;
@interface DashBoardViewController : UIViewController{
    UIButton *createTask;
    UIButton *completedTask;
    UIButton *pendingTask;
    UIButton *settings;
    NewTaskViewController *createTaskViewController;
    PendingTaskViewController *pendingTaskViewController;
    CompletedTaskViewController *completedTaskViewController;
    SettingsViewController *settingsViewController;
    sqlite3 *database;
    
}
@property(nonatomic, strong) NewTaskViewController* createTaskViewController;
@property(nonatomic, strong)PendingTaskViewController *pendingTaskViewController;
@property(nonatomic, strong)CompletedTaskViewController *completedTaskViewController;
@property(nonatomic, strong) SettingsViewController *settingsViewController;
@property(nonatomic, retain) UIButton *createTask;
@property(nonatomic, retain) UIButton *pendingTask;
@property(nonatomic, retain) UIButton *completedTask;
@property(nonatomic, retain) UIButton *settings;

-(IBAction)createTaskClicked:(id)sender;
-(IBAction)pendingTaskClicked:(id)sender;
-(IBAction)completedTaskClicked:(id)sender;
-(IBAction)settingsClicked:(id)sender;
@end
