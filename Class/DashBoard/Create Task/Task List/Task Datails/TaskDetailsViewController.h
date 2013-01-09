//
//  TaskDetailsViewController.h
//  Task
//
//  Created by Nagarajan on 12/19/12.
//  Copyright (c) 2012 Nagarajan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewTaskViewController;
@protocol TaskDetailsDelegate <NSObject>


-(void) removeFromView;

@end

@interface TaskDetailsViewController : UIViewController
{
    UILabel* nameLabel,*dueDate,*comment;
   
    UILabel *taskName,*commentsView;
    
    UILabel* dateLabel;
     UIToolbar *toolBar;
    UIBarButtonItem *backButton;
    UILabel* createTask;
    NSArray *listArray;
    
    NSString *name;
    NSString *date;
    NSString *comments;
    NewTaskViewController *createTaskViewController;
  __weak id taskDetailsDelegate;
     
}
@property (nonatomic, strong) UILabel* nameLabel,*dueDate,*comment;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, strong) UILabel* dateLabel,* createTask;
@property (nonatomic, strong) UILabel *taskName;
@property (nonatomic, strong) UILabel* commentsView;
@property (strong,nonatomic) UIBarButtonItem *backButton;
@property (strong,nonatomic) UIToolbar *toolBar;
@property (nonatomic,retain) NSArray* listArray;
-(void)backButtonClicked:(id)sender;
@property (weak) id taskDetailsDelegate;

@property(nonatomic, strong) NewTaskViewController* createTaskViewController;
@end
