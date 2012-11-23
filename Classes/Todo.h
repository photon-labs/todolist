//
//  Todo.h
//  todo
//
//  Created by Brandon Trebitowski on 8/17/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface Todo : NSObject {
	sqlite3 *database;
	NSInteger primaryKey;
	NSString *text;
}

@property (assign, nonatomic, readonly) NSInteger primaryKey;
@property (nonatomic, retain) NSString *text;

- (id)initWithPrimaryKey:(NSInteger)pk database:(sqlite3 *)db;

@end
