//
//  NSObject+Task.m
//  iOS_StoryBoard
//
//  Created by TMA103 on 4/18/17.
//  Copyright © 2017 TMA. All rights reserved.
//

#import "Task.h"

@implementation Task
@synthesize name = _name;
@synthesize done = _done;

-(id) initWithName: (NSString *)name done: (BOOL) done {
    self = [super init];
    if (self) {
        self.name = name;
        self.done = done;
    }
    return self;
}

@end
