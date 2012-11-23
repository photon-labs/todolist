//
//  RootViewController.h
//  todo
//
//  Created by Brandon Trebitowski on 8/17/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
@class todoAppDelegate;

@interface RootViewController : UITableViewController {
    IBOutlet UIWindow *window;
    IBOutlet UINavigationController *navigationController;
    todoAppDelegate* todoObject;

}
@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UINavigationController *navigationController;

@end
