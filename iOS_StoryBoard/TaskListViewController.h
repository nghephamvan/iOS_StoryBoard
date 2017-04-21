//
//  TaskListViewController.h
//  iOS_StoryBoard
//
//  Created by TMA103 on 4/19/17.
//  Copyright © 2017 TMA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskListViewController : UITableViewController<UISearchBarDelegate, UITableViewDataSource> {
    BOOL isFiltered;
}

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) NSMutableArray *tasks;
@property (nonatomic, strong) NSMutableArray *filerTasks;

- (IBAction)btnEditListTask:(id)sender;
@end
