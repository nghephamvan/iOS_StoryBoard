//
//  TaskListViewController.m
//  iOS_StoryBoard
//
//  Created by TMA103 on 4/19/17.
//  Copyright © 2017 TMA. All rights reserved.
//

#import "TaskListViewController.h"
#import "Task.h"
#import "AddTaskController.h"
#import "EditTaskController.h"

@interface TaskListViewController ()

@end

@implementation TaskListViewController
@synthesize tasks = _tasks;
@synthesize filerTasks = _filerTasks;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    
    self.tasks = [[NSMutableArray alloc] init];
    
    Task *task = [[Task alloc] initWithName:@"First task" done:NO];
    [self.tasks addObject:task];
    Task *doneTask = [[Task alloc] initWithName:@"Second task" done:YES];
    [self.tasks addObject:doneTask];
    
    [self.tableView reloadData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchText.length == 0) {
        isFiltered = NO;
    } else {
        isFiltered = YES;
        self.filerTasks = [[NSMutableArray alloc] init];

        for (Task *currentTask in self.tasks) {
            NSRange range = [currentTask.name rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (range.location != NSNotFound) {
                [self.filerTasks addObject:currentTask];
            }
        }
    }
    
    [self.tableView reloadData];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.tableView resignFirstResponder];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (isFiltered) {
        return self.filerTasks.count;
    }
    return self.tasks.count;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddTaskSegue"]) {
        UINavigationController *nav = segue.destinationViewController;
        AddTaskController *addTask = [nav.viewControllers objectAtIndex:0];
        addTask.taskListViewController = self;
    } else if ([segue.identifier isEqualToString:@"editDoneTaskSegue"] || [segue.identifier isEqualToString:@"editNotDoneTaskSegue"]) {
        EditTaskController *editTaskController = segue.destinationViewController;
        editTaskController.task = [self.tasks objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *NotDoneCellIdentifier = @"NotDoneTaskCell";
    static NSString *DoneCellIdentifier = @"DoneTaskCell";
    Task *currentTask;
    if (!isFiltered) {
        currentTask = [self.tasks objectAtIndex:indexPath.row];
    } else {
        currentTask = [self.filerTasks objectAtIndex:indexPath.row];
    }
    
    NSString *CellIdentifier = currentTask.done ? DoneCellIdentifier : NotDoneCellIdentifier;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = currentTask.name;
    
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.tasks removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


- (IBAction)btnEditListTask:(id)sender {
    self.editing = !self.editing;
}

//-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle==UITableViewCellEditingStyleDelete) {
//        [self.tasks removeObjectAtIndex:indexPath.row];
//        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        
//    }
//}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    Task *moveTask = [self.tasks objectAtIndex:fromIndexPath.row];
    [self.tasks removeObjectAtIndex:fromIndexPath.row];
    [self.tasks insertObject:moveTask atIndex:toIndexPath.row];
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
