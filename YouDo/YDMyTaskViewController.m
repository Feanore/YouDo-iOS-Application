//
//  YDMyTaskViewController.m
//  YouDo
//
//  Created by Zhanserik Kenes on 04.04.14.
//  Copyright (c) 2014 Kenes. All rights reserved.
//

#import "YDMyTaskViewController.h"
#import "YDTaskViewCell.h"

@interface YDMyTaskViewController ()
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UITableView *tasksTableView;
@property DataRepresentingType representingType;
@end

@implementation YDMyTaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.representingType = MyTasks;
    
    self.tasksTableView.delegate   = self;
    self.tasksTableView.dataSource = self;
    
    self.headerView.backgroundColor = MAIN_COLOR;
    
    [self.segmentedControl addTarget:self
                              action:@selector(segmentedControlDidChange:)
                    forControlEvents:UIControlEventValueChanged];

    self.segmentedControl.tintColor = MAJOR_COLOR;
    [self.segmentedControl setTitle:NSLocalizedString(@"In Process", nil) forSegmentAtIndex:0];
    [self.segmentedControl setTitle:NSLocalizedString(@"Done", nil) forSegmentAtIndex:1];
    
    [self setTitle:NSLocalizedString(@"My Tasks", nil)];
    
}

- (void) refreshDataView{
    
    
    
    NSMutableArray *list = [[NSMutableArray alloc] init];
    for (int i=0; i<20; i++)
        [list addObject:[NSIndexPath indexPathForRow:i inSection:0]];
    
    
    if (self.representingType == MyTasks){
        [self.tasksTableView beginUpdates];
        [self.tasksTableView reloadRowsAtIndexPaths:list withRowAnimation:UITableViewRowAnimationFade];
        [self.tasksTableView endUpdates];
     
    }
    else if (self.representingType == ExecutingTasks){
        //sorting array by distance
        [self.tasksTableView beginUpdates];
        [self.tasksTableView reloadRowsAtIndexPaths:list withRowAnimation:UITableViewRowAnimationFade];
        [self.tasksTableView endUpdates];
        
        [self.tasksTableView reloadData];
    }

}


- (void) segmentedControlDidChange: (UISegmentedControl *)control{
    NSInteger index = control.selectedSegmentIndex;
    
    switch (index) {
        case 0:
            self.representingType = MyTasks;
            break;
        case 1:
            self.representingType = ExecutingTasks;
            break;
        default:
            break;
    }
    [self refreshDataView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YDTaskViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"eventCell"];
    
    if(!cell){
        cell = [[YDTaskViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"eventCell"];
    }
    
//    if (self.representingType == MyTasks)
//        cell.textLabel.text = @"My Tasks";
//    else if (self.representingType == ExecutingTasks)
//        cell.textLabel.text = @"Executing Tasks";
    
    if (self.representingType == MyTasks)
        cell.titleLabel.text = @"My Tasks";
    else if (self.representingType == ExecutingTasks)
        cell.titleLabel.text = @"Executing Tasks";
    
    cell.subtitleLabel.text = @"Open until 17:00, 17 April";
    
    cell.iconImage.backgroundColor = [UIColor orangeColor];
    
    cell.priceLabel.text = @"20000";
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
