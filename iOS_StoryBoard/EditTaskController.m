//
//  EditTaskController.m
//  iOS_StoryBoard
//
//  Created by TMA103 on 4/20/17.
//  Copyright © 2017 TMA. All rights reserved.
//

#import "EditTaskController.h"
#import "Task.h"

@interface EditTaskController ()

@end

@implementation EditTaskController

@synthesize txtName = _txtName;
@synthesize switchDone = _switchDone;
@synthesize task = _task;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.txtName.text = self.task.name;
    [self.switchDone setOn: self.task.done];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)taskDataChanged:(id)sender {
    self.task.name = self.txtName.text;
    self.task.done = self.switchDone.isOn;
}



@end
