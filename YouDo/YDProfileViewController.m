//
//  YDProfileViewController.m
//  YouDo
//
//  Created by Zhanserik Kenes on 04.04.14.
//  Copyright (c) 2014 Kenes. All rights reserved.
//

#import "YDProfileViewController.h"

@interface YDProfileViewController ()
@property (weak, nonatomic) IBOutlet UITableView *profileTableView;

@property (nonatomic) UIView *profileView;
@property (nonatomic) UIImageView *profileImage;
@property (nonatomic) UIView *socialView;
@property (nonatomic) UILabel *nameLabel;
@property (nonatomic) UILabel *ageLabel;
@property (nonatomic) UIView *rateView;

@end

@implementation YDProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void) viewWillAppear:(BOOL)animated{
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationController.navigationBar setTranslucent:NO];
    [self setTitle:NSLocalizedString(@"Profile", nil)];
    
    UIImage *settingsIcon = [[UIImage imageNamed:@"settings.png"] scaledToSize:CGSizeMake(25, 25)];
    UIBarButtonItem *settings = [[UIBarButtonItem alloc] initWithImage:settingsIcon
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(presentSettingsView)];
    settings.tintColor = MAJOR_COLOR;
    self.navigationItem.rightBarButtonItem = settings;
    
    self.profileTableView.delegate = self;
    self.profileTableView.dataSource = self;
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height/2;
    CGFloat offset = 20;
    self.profileView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, width, height)];
    self.profileView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    self.profileImage = [[UIImageView alloc] initWithFrame:CGRectMake(40, offset, 160, 160)];
    self.profileImage.layer.masksToBounds = YES;
    self.profileImage.layer.cornerRadius = self.profileImage.frame.size.height/2;
    self.profileImage.backgroundColor = MAIN_COLOR;
    [self.profileView addSubview:self.profileImage];
    
    self.socialView = [[UIView alloc] initWithFrame:CGRectMake(220, offset, 60, 160)];
    self.socialView.layer.masksToBounds = YES;
    self.socialView.layer.cornerRadius = 20.0f;
    self.socialView.backgroundColor = [UIColor orangeColor];
    [self.profileView addSubview:self.socialView];
    
    offset += self.profileImage.frame.size.height +10;
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, offset, 320, 30)];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    self.nameLabel.text = @"Kenes Zhanserik";
    self.nameLabel.textColor = [UIColor darkGrayColor];
    [self.profileView addSubview:self.nameLabel];
    
    offset += self.nameLabel.frame.size.height;
    
    self.ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, offset, 320, 30)];
    self.ageLabel.textAlignment = NSTextAlignmentCenter;
    self.ageLabel.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    self.ageLabel.text = @"20 years";
    self.ageLabel.textColor = [UIColor darkGrayColor];
    [self.profileView addSubview:self.ageLabel];
    
    offset += self.ageLabel.frame.size.height;
    
    self.rateView = [[UIView alloc] initWithFrame:CGRectMake(10, offset, 320, 40)];
    self.rateView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    [self.profileView addSubview:self.rateView];
    
    self.profileTableView.tableHeaderView = self.profileView;
}
- (void) presentSettingsView{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    YDViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"settingsController"];
    
    [self.navigationController pushViewController:controller animated:YES];
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
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"eventCell"];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"eventCell"];
    }
    
    
    cell.textLabel.text = @"Profile";
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}

@end
