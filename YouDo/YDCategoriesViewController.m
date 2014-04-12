//
//  YDCategoriesViewController.m
//  YouDo
//
//  Created by Zhanserik Kenes on 04.04.14.
//  Copyright (c) 2014 Kenes. All rights reserved.
//

#import "YDCategoriesViewController.h"
#import "YDCategoryViewCell.h"
@interface YDCategoriesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *categoriesTableView;

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
	// Do any additional setup after loading the view.
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Cancel", nil)
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                              action:@selector(dissmissControllerView)];
    self.navigationItem.rightBarButtonItem = cancel;
    cancel.tintColor = MAJOR_COLOR;
    
    self.categoriesTableView.dataSource = self;
    self.categoriesTableView.delegate   = self;
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YDCategoryViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"eventCell"];
    
    if(!cell){
        cell = [[YDCategoryViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"eventCell"];
    }


    
    cell.iconImage.backgroundColor = [UIColor orangeColor];
    
    cell.titleLabel.text = @"Category";
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}
@end
