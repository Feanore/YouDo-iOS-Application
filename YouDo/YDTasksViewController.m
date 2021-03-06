//
//  YDTasksViewController.m
//  YouDo
//
//  Created by Zhanserik Kenes on 04.04.14.
//  Copyright (c) 2014 Kenes. All rights reserved.
//

#import "YDTasksViewController.h"
#import "YDTaskViewCell.h"
#import <MapKit/MapKit.h>
#import "MBProgressHUD.h"
#import "AFNetworking.h"
#import "UIProgressView+AFNetworking.h"

@interface YDTasksViewController ()


@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UITableView *tasksTableView;
@property DataRepresentingType representingType;
@property (nonatomic, strong) MKMapView *map;
@property (nonatomic) BOOL mapSelected;
@property (nonatomic) NSArray *taskList;

@end

@implementation YDTasksViewController

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
    
    self.taskList = [[NSArray alloc] init];
    
    self.mapSelected = NO;
    
    CGRect mapFrame = self.tasksTableView.frame;
    self.map = [[MKMapView alloc] initWithFrame:mapFrame];
    self.representingType = byDistance;
    
    self.mapSelected = NO;

    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self
                       action:@selector(downloadTasks:)
             forControlEvents:UIControlEventValueChanged];
    
    [self.tasksTableView addSubview:refreshControl];
    self.tasksTableView.delegate   = self;
    self.tasksTableView.dataSource = self;
    
    self.headerView.backgroundColor = MAIN_COLOR;
    
    [self.segmentedControl addTarget:self
                              action:@selector(downloadTasks:)
                    forControlEvents:UIControlEventValueChanged];
    
    [self.segmentedControl setTitle:NSLocalizedString(@"Distance", nil) forSegmentAtIndex:0];
    [self.segmentedControl setTitle:NSLocalizedString(@"Price", nil) forSegmentAtIndex:1];
    [self.segmentedControl setTitle:NSLocalizedString(@"Map", nil) forSegmentAtIndex:2];
    
    [self.segmentedControl setTintColor:MAJOR_COLOR];
    
    [self setTitle:NSLocalizedString(@"Tasks", nil)];
    
    [self.navigationController.navigationBar setTintColor:MAIN_COLOR];
    
    UIBarButtonItem *categories = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Categories", nil)
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(presentCategory:)];
    categories.tintColor = MAJOR_COLOR;
    self.navigationItem.leftBarButtonItem = categories;
    
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Add", nil) style:UIBarButtonItemStylePlain target:self action:@selector(addTask:)];
    
    add.tintColor = MAJOR_COLOR;
    self.navigationItem.rightBarButtonItem = add;
    
    
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar setShadowImage:[[UIImage imageNamed:@"1x1.png"] imageWithColor:MAIN_COLOR]];
    
    [self downloadTasks:nil];
    
}

- (void) downloadTasks: (id) sender{
    MBProgressHUD *hud;
    UIRefreshControl *refresher;
    
    if(!sender){
        hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.labelText = @"Loading";
    }
    else{
        refresher = (UIRefreshControl *)sender;
    }
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *link = [NSString stringWithFormat:@"%@%@",API_LINK,@"api/jobs"];
    
    [manager GET:link
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"[AFNetworking api/jobs]: %@", responseObject);

             self.taskList = (NSArray *)responseObject;
             [self.tasksTableView reloadData];
             
             if(!sender){
                 [hud hide:YES];
             }
             else{
                 [refresher endRefreshing];
             }
             
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
             [hud hide:YES];
         }];
    
}

- (void) presentCategory: (id) sender{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"categoryController"];
    
    [self presentViewController:controller
                       animated:YES
                     completion:nil];
    
}

- (void) addTask: (id) sender{
    NSLog(@"[YDTasksViewController addTask:]");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"newTaskController"];
    [self.tabBarController.navigationController pushViewController:controller animated:YES];
}

- (void) appearMapView{
    self.map.alpha = 0.0;
    
    [self.view addSubview:self.map];
    
    [UIView animateWithDuration:0.3f
                     animations:^(void){
                         self.map.alpha = 1.0f;
                     }
                     completion:^(BOOL finished){
                         self.mapSelected = YES;
                     }];
}
- (void) disappearMapView{
    
    if(!self.mapSelected)
        return;
    
    [UIView animateWithDuration:0.3f
                     animations:^(void){
                         self.map.alpha = 0.0f;
                     }
                     completion:^(BOOL finished){
                         [self.map removeFromSuperview];
                     }];
}

- (void) refreshDataView{
    
    
    
    NSMutableArray *list = [[NSMutableArray alloc] init];
    for (int i=0; i<20; i++)
        [list addObject:[NSIndexPath indexPathForRow:i inSection:0]];
    
    
    if (self.representingType == byDistance){
        [self.tasksTableView beginUpdates];
        [self.tasksTableView reloadRowsAtIndexPaths:list withRowAnimation:UITableViewRowAnimationFade];
        [self.tasksTableView endUpdates];
        [self disappearMapView];
    }
    else if (self.representingType == byPrice){
        //sorting array by distance
        [self.tasksTableView beginUpdates];
        [self.tasksTableView reloadRowsAtIndexPaths:list withRowAnimation:UITableViewRowAnimationFade];
        [self.tasksTableView endUpdates];
        [self disappearMapView];
        [self.tasksTableView reloadData];
    }
    else if (self.representingType == onMap){
        //show map
        NSLog(@"Map Appear");
        [self appearMapView];
    }
}


- (void) segmentedControlDidChange: (UISegmentedControl *)control{
    NSInteger index = control.selectedSegmentIndex;
    
    switch (index) {
        case 0:
            self.representingType = byDistance;
            break;
        case 1:
            self.representingType = byPrice;
            break;
        case 2:
            self.representingType = onMap;
            break;
        default:
            break;
    }
    [self refreshDataView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.taskList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YDTaskViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"eventCell"];
    
    if(!cell){
        cell = [[YDTaskViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"eventCell"];
    }
    
    NSDictionary *info = [self.taskList objectAtIndex:indexPath.row];
    
    
    cell.iconImage.backgroundColor = [UIColor orangeColor];
    cell.titleLabel.text = [info objectForKey:@"title"];
    
    cell.subtitleLabel.text = [info objectForKey:@"should_impl_at"];
    
    cell.priceLabel.text = [[info objectForKey:@"price"] stringValue];
    
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
