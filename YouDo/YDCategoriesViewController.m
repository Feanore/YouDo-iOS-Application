//
//  YDCategoriesViewController.m
//  YouDo
//
//  Created by Zhanserik Kenes on 04.04.14.
//  Copyright (c) 2014 Kenes. All rights reserved.
//

#import "YDCategoriesViewController.h"
#import "YDCategoryViewCell.h"
#import "MBProgressHUD.h"
#import "AFNetworking.h"

@interface YDCategoriesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *categoriesTableView;
@property (nonatomic) NSArray *categoriesList;

@end

@implementation YDCategoriesViewController

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
	
    self.categoriesList = [[NSArray alloc] init];
    
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc]
                               initWithTitle:NSLocalizedString(@"Cancel", nil)
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                              action:@selector(dissmissControllerView)];
    
    
    
    self.navigationItem.rightBarButtonItem = cancel;
    cancel.tintColor = MAJOR_COLOR;
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self
                       action:@selector(downloadCategories:)
             forControlEvents:UIControlEventValueChanged];
    
    [self.categoriesTableView addSubview:refreshControl];
    self.categoriesTableView.dataSource = self;
    self.categoriesTableView.delegate   = self;
    
    [self downloadCategories:nil];
}
- (void) dissmissControllerView{
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) downloadCategories: (id) sender{
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
    
    NSString *link = [NSString stringWithFormat:@"%@%@",API_LINK,@"api/categories"];
    
    [manager GET:link
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"[AFNetworking api/jobs]: %@", responseObject);
             
             self.categoriesList = (NSArray *)responseObject;
             [self.categoriesTableView reloadData];
             
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.categoriesList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YDCategoryViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"eventCell"];
    
    if(!cell){
        cell = [[YDCategoryViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"eventCell"];
    }

    NSDictionary *info = [self.categoriesList objectAtIndex:indexPath.row];
    
    cell.iconImage.backgroundColor = [UIColor orangeColor];
    
    cell.titleLabel.text = [info objectForKey:@"title"];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}
@end
