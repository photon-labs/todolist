//
//  SettingsViewController.h
//  Task
//
//  Created by Nagarajan on 12/12/12.
//  Copyright (c) 2012 Nagarajan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SettingsViewController : UIViewController{
    UILabel* settings;
    UIBarButtonItem *backButton;
    UIToolbar *toolBar;
    

}
@property(nonatomic,strong)UILabel* settings;
@property (strong,nonatomic) UIBarButtonItem *backButton;
@property (strong,nonatomic) UIToolbar *toolBar;
-(void)backButtonSelected:(id)sender;

@end
