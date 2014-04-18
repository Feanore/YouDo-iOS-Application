//
//  YDNewTaskViewController.m
//  YouDo
//
//  Created by Zhanserik Kenes on 04.04.14.
//  Copyright (c) 2014 Kenes. All rights reserved.
//

#import "YDNewTaskViewController.h"
#import "YDCategoryCell.h"
#import "YDTaskDetailsViewController.h"

@interface YDNewTaskViewController ()
@property (weak, nonatomic) IBOutlet UITableView *categoriesTableView;

@end

@implementation YDNewTaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void) viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setHidden:NO];
}
- (void) viewDidDisappear:(BOOL)animated{
    //[self.navigationController.navigationBar setHidden:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setWhiteBackButtonItem];
    
    self.categoriesTableView.delegate  = self;
    self.categoriesTableView.dataSource = self;
    
    [self setTitle:NSLocalizedString(@"Select Category", nil)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YDCategoryCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"eventCell"];
    
    if(!cell){
        cell = [[YDCategoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"eventCell"];
    }
    
    cell.iconImage.backgroundColor = [UIColor orangeColor];
    
    cell.titleLabel.text = @"Category";
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    YDTaskDetailsViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"taskDetailsContoller"];
    [self.navigationController pushViewController:controller animated:YES];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}


@end
