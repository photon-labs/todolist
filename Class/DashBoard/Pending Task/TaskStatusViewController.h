//
//  TaskStatusViewController.h
//  Task
//
//  Created by Nagarajan on 12/20/12.
//  Copyright (c) 2012 Nagarajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
@class AppDelegate;
@class DataBase;
@class CompletedTaskViewController;
@class DashBoardViewController;

@protocol TaskStatusDelegate <NSObject>


-(void) removeFromView;

@end

@interface TaskStatusViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate,UITextViewDelegate>{
    UILabel *status,*colon,*pending,*nameLabel,*taskName;
    UITextField *statusField;
     UIToolbar *toolBar;
    UIBarButtonItem *backButton;
    UIButton *completedButton;
    
    NSString *name;
    NSString *date;
    NSString *comments;
    __weak id taskStatusDelegate;
    
    sqlite3 *database;
    sqlite3 *taskDB;
    
    CompletedTaskViewController *completedTaskViewController;
    DashBoardViewController *dashBoardViewController;
}
@property (nonatomic, strong) UILabel *status,*colon,*pending,*nameLabel,*taskName;
@property (nonatomic, strong)UITextField *statusField;
@property (nonatomic, strong)UIToolbar *toolBar;
@property (nonatomic, strong)UIBarButtonItem *backButton;
@property (strong,nonatomic) UIButton *completedButton;
@property (nonatomic, strong) NSString *name,*date,*comments;
@property (weak) id taskStatusDelegate;
@property(nonatomic, strong)CompletedTaskViewController *completedTaskViewController;
@property(nonatomic, strong)DashBoardViewController *dashBoardViewController;
-(void)backButtonSelected:(id)sender;
-(void)completedButtonSelected:(id)sender;
@end
