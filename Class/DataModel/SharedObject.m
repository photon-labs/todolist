//
//  SharedObject.m
//  Task
//
//  Created by Nagarajan on 1/2/13.
//  Copyright (c) 2013 Nagarajan. All rights reserved.
//

#import "SharedObject.h"
#import "ToDoModel.h"

static SharedObject *sharedObjectDelegate = nil;
@implementation SharedObject
@synthesize todoModelEntity;
@synthesize completedModelEntity;
-(id) init
{
    self = [super init];
    if(self)
    {
        self.todoModelEntity = [[TodoModelEntity alloc] init];
        self.completedModelEntity = [[CompletedModelEntity alloc]init];
    }
    return self;
}

+(SharedObject*) sharedInstance
{
    @synchronized(self)
    {
        if(sharedObjectDelegate == nil)
        {
            sharedObjectDelegate = [[self alloc] init];
        }
    }
    return sharedObjectDelegate;
}
@end
