//
//  YDCostViewController.m
//  YouDo
//
//  Created by Zhanserik Kenes on 21.04.14.
//  Copyright (c) 2014 Kenes. All rights reserved.
//

#import "YDCostViewController.h"

#define MARGIN_LEFT 10
#define MARGIN_TOP 10

@interface YDCostViewController ()

@property (nonatomic) UIScrollView *scrollView;

@property (nonatomic) UIView       *switchView;
@property (nonatomic) UISwitch     *costSwitch;

@property (nonatomic) UIView       *costView;
@property (nonatomic) UISlider     *costSlider;

@property (nonatomic) UILabel      *priceLabel;
@property (nonatomic) UILabel      *otherLabel;

@end

@implementation YDCostViewController

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
    [self setWhiteBackButtonItem];
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]  initWithTitle:NSLocalizedString(@"Ready", nil)
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:self
                                                                      action:@selector(rightBarbuttonDidPress)];
    rightBarButton.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.scrollView.contentSize = CGSizeMake(320, 400);
    self.scrollView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.scrollView];
    
    /*
        Header Label
     */
    
    CGFloat offset = 0;
    CGFloat width = self.view.frame.size.width - MARGIN_LEFT * 2;
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, offset, width, 50)];
    headerLabel.numberOfLines = 3;
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:20.0f];
    headerLabel.text = NSLocalizedString(@"How many executer get to work?", nil);
    headerLabel.textAlignment = NSTextAlignmentCenter;
    [self.scrollView addSubview:headerLabel];

    
    
    /*
        Switch view
     */
    offset += headerLabel.frame.size.height + MARGIN_TOP;
    
    self.switchView = [[UIView alloc] initWithFrame:CGRectMake(MARGIN_LEFT,
                                                               offset,
                                                               width,
                                                               70)];
    self.switchView.backgroundColor = [UIColor whiteColor];
    
    UILabel *switchLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN_LEFT, 0, 200, 70)];
    switchLabel.text = NSLocalizedString(@"Let executer propose a price", nil);
    switchLabel.numberOfLines = 4;
    switchLabel.textColor = [UIColor lightGrayColor];
    
    [self.switchView addSubview:switchLabel];
    
    self.costSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(240, 20, 60, 30)];
    
    [self.costSwitch addTarget:self
                        action:@selector(switchValueDidChange:)
              forControlEvents:UIControlEventValueChanged];
    
    [self.switchView addSubview:self.costSwitch];
    
    [self.scrollView addSubview:self.switchView];
    
  
    
    offset += self.switchView.frame.size.height + MARGIN_TOP;
    
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN_LEFT,
                                                                          offset,
                                                                          width,
                                                                          80)];
    descriptionLabel.textColor = [UIColor darkGrayColor];
    descriptionLabel.textAlignment = NSTextAlignmentCenter;
    descriptionLabel.font = [UIFont systemFontOfSize:16.0f];
    descriptionLabel.text = NSLocalizedString(@"Executer will indicate in its proposals the price for which will be ready to perform your job", nil);
    descriptionLabel.numberOfLines = 5;
    
    [self.scrollView addSubview:descriptionLabel];
    
    
    offset += descriptionLabel.frame.size.height + MARGIN_TOP;
    
    
    self.costView = [[UIView alloc] initWithFrame:CGRectMake(MARGIN_LEFT,
                                                             offset,
                                                             width,
                                                             120)];
    self.costView.backgroundColor = [UIColor whiteColor];
    
    self.costSlider = [[UISlider alloc] initWithFrame:CGRectMake(MARGIN_LEFT, 20, 280, 30)];
    
    [self.costSlider addTarget:self
                        action:@selector(sliderValueDidChange:)
              forControlEvents:UIControlEventValueChanged];
    
    [self.costView addSubview:self.costSlider];
    
    [self.scrollView addSubview:self.costView];
    
    
    /*
     Additional Label
     */
    
    self.otherLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN_LEFT, offset, width, 80)];
    self.otherLabel.textAlignment = NSTextAlignmentCenter;
    self.otherLabel.font = [UIFont systemFontOfSize:16.0f];
    self.otherLabel.text = NSLocalizedString(@"You pay for the work personally executor after your task will be executed", nil);
    self.otherLabel.numberOfLines = 5;
    self.otherLabel.textColor = [UIColor darkGrayColor];
    
    
    offset += self.costView.frame.size.height + MARGIN_TOP;
    
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN_LEFT, offset, width, 120)];
    self.priceLabel.backgroundColor = [UIColor darkGrayColor];
    self.priceLabel.textAlignment = NSTextAlignmentCenter;
    self.priceLabel.textColor = [UIColor whiteColor];
    self.priceLabel.font = [UIFont boldSystemFontOfSize:46.0f];
    [self.scrollView addSubview:self.priceLabel];
    
    
}
- (void) sliderValueDidChange: (UISlider *)sender{
    self.priceLabel.text = [NSString stringWithFormat:@"%0.1f", 5000*sender.value];
}
- (void) switchValueDidChange: (UISwitch *)sender{
    
    if(sender.on){
        self.otherLabel.alpha = 0.0f;
        [self.scrollView addSubview:self.otherLabel];
        [UIView animateWithDuration:0.3f
                         animations:^(void){
                             self.costView.alpha = 0.0f;
                             self.priceLabel.alpha = 0.0f;
                             self.otherLabel.alpha = 1.0f;
                         }
                         completion:^(BOOL finished){
            
                         }];
    }
    
    else{
        

        [UIView animateWithDuration:0.3f
                         animations:^(void){
                             self.costView.alpha = 1.0f;
                             self.priceLabel.alpha = 1.0f;
                             self.otherLabel.alpha = 0.0f;
                         }
                         completion:^(BOOL finished){
                             [self.otherLabel removeFromSuperview];
                         }];
        
    }
    
}
- (void) rightBarbuttonDidPress{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
