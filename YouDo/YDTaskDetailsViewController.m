//
//  YDTaskDetailsViewController.m
//  YouDo
//
//  Created by Zhanserik Kenes on 18.04.14.
//  Copyright (c) 2014 Kenes. All rights reserved.
//

#import "YDTaskDetailsViewController.h"
#import "YDAddressViewController.h"
#import "YDAdditionalConViewController.h"
#import "YDCostViewController.h"

#import "YDTextView.h"

#define MARGIN_TOP  10
#define MARGIN_LEFT  5
#define PADDING_LEFT 10

@interface YDTaskDetailsViewController ()

@property (nonatomic) UIImagePickerController *pickerController;

@property (nonatomic) UIScrollView    *scrollView;
@property (nonatomic) UIView          *contentView;

@property (nonatomic) UIView          *descriptionView;
@property (nonatomic) UITextField     *titleTextField;
@property (nonatomic) YDTextView      *descriptionTextView;
@property (nonatomic) UISwitch        *privateInfoSwitch;
@property (nonatomic) YDTextView      *privateInfoTextView;
@property (nonatomic) UILabel         *warningLabel;

@property (nonatomic) UIView          *additionalInfoView;

@property (nonatomic) UIView          *dateView;
@property (nonatomic) UITextField     *dateTextField;

@property (nonatomic) UIView          *imagePickView;
@property (nonatomic) UIImageView     *placeholderView;

@property (nonatomic) UIView          *addressView;

@property (nonatomic) UIView          *phoneView;
@property (nonatomic) UITextField     *stateNumberTextField;
@property (nonatomic) UITextField     *phoneNumberTextField;

@property (nonatomic) UIView          *priceView;

@property (nonatomic) UIView          *additionalConditionsView;

@end

@implementation YDTaskDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void) viewDidDisappear:(BOOL)animated{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
}
- (void) viewWillAppear:(BOOL)animated{
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setWhiteBackButtonItem];
    [self setTitle:@"Category"];
    
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 800)];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.scrollView setContentSize:self.contentView.frame.size];
    [self.scrollView addSubview:self.contentView];
    self.scrollView.delegate = self;
    
    [self.view addSubview:self.scrollView];
    self.contentView.backgroundColor = [UIColor lightGrayColor];
    
    /*
        Description view
     */
    
//    NSLayoutConstraint* cn = [NSLayoutConstraint constraintWithItem:self.descriptionView
//                                      attribute:NSLayoutAttributeHeight
//                                      relatedBy:NSLayoutRelationEqual
//                                         toItem:nil
//                                      attribute:NSLayoutAttributeNotAnAttribute
//                                     multiplier:1
//                                       constant:400];
//    
//    [self.descriptionView addConstraint:cn];
//    
//    cn = [NSLayoutConstraint constraintWithItem:self.descriptionView
//                                      attribute:NSLayoutAttributeTop
//                                      relatedBy:NSLayoutRelationEqual
//                                         toItem:nil
//                                      attribute:NSLayoutAttributeNotAnAttribute
//                                     multiplier:1
//                                       constant:10];
//    
//    [self.descriptionView addConstraint:cn];
//    
//    cn = [NSLayoutConstraint constraintWithItem:self.descriptionView
//                                      attribute:NSLayoutAttributeWidth
//                                      relatedBy:NSLayoutRelationEqual
//                                         toItem:nil
//                                      attribute:NSLayoutAttributeNotAnAttribute
//                                     multiplier:1
//                                       constant:310];
//    
//    [self.descriptionView addConstraint:cn];
   
    CGFloat verticalOffset = MARGIN_TOP;
    
    self.descriptionView = [[UIView alloc] initWithFrame:CGRectMake(MARGIN_LEFT,
                                                                   MARGIN_TOP,
                                                                   self.view.frame.size.width - MARGIN_LEFT*2,
                                                                    320)];
    
    CGFloat width = self.descriptionView.frame.size.width - PADDING_LEFT*2;
    
    self.descriptionView.backgroundColor = [UIColor whiteColor];
    
    CGFloat margin_top = 5.0f;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(PADDING_LEFT,
                                                                   margin_top,
                                                                   width,
                                                                    30)];
    margin_top += titleLabel.frame.size.height;
    
    titleLabel.text = NSLocalizedString(@"I need", nil);
    titleLabel.textColor = [UIColor lightGrayColor];
    titleLabel.backgroundColor = [UIColor whiteColor];
    
    
    [self.descriptionView addSubview:titleLabel];
    
    self.titleTextField = [[UITextField alloc] initWithFrame:CGRectMake(PADDING_LEFT,
                                                                       margin_top,
                                                                        width,
                                                                        40)];
    self.titleTextField.backgroundColor = [UIColor whiteColor];
    self.titleTextField.layer.masksToBounds = YES;
    self.titleTextField.layer.borderWidth = 0.5f;
    self.titleTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    //self.titleTextField.placeholder = @"Example: Need slaves to build a ship";
    
    [self.descriptionView addSubview:self.titleTextField];
    
    margin_top += self.titleTextField.frame.size.height + 10;
    
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(PADDING_LEFT,
                                                                         margin_top,
                                                                         width,
                                                                          30)];
    descriptionLabel.text = NSLocalizedString(@"Task Description", nil);
    descriptionLabel.textColor = [UIColor lightGrayColor];
    descriptionLabel.backgroundColor = [UIColor whiteColor];
    
    [self.descriptionView addSubview:descriptionLabel];
    
    margin_top += descriptionLabel.frame.size.height;
    
    self.descriptionTextView = [[YDTextView alloc] initWithFrame:CGRectMake(PADDING_LEFT,
                                                                           margin_top,
                                                                           width,
                                                                            120)];
    self.descriptionTextView.layer.masksToBounds = YES;
    self.descriptionTextView.layer.borderWidth = 0.5f;
    self.descriptionTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
   // self.descriptionTextView.placeholder = @"Example: Lorem ipsum dolar sit amet something ";
    [self.descriptionView addSubview:self.descriptionTextView];
    
    margin_top += self.descriptionTextView.frame.size.height + 5;
    
    UILabel *privateInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(PADDING_LEFT,
                                                                         margin_top + 5,
                                                                         2*width/3,
                                                                          60)];
    privateInfoLabel.text = NSLocalizedString(@"Add Private Information", nil);
    privateInfoLabel.textColor = [UIColor lightGrayColor];
    privateInfoLabel.backgroundColor = [UIColor whiteColor];
    privateInfoLabel.layer.masksToBounds = YES;
    privateInfoLabel.layer.borderWidth = 0;
    
    [self.descriptionView addSubview:privateInfoLabel];
    
    self.privateInfoSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(PADDING_LEFT + privateInfoLabel.frame.size.width + 20,
                                                                        margin_top + 20,
                                                                        width/3,
                                                                        0)];
    [self.privateInfoSwitch addTarget:self
                               action:@selector(switchStateDidChange:)
                     forControlEvents:UIControlEventValueChanged];
    
    [self.descriptionView addSubview:self.privateInfoSwitch];
    
    [self.contentView addSubview:self.descriptionView];
    
    margin_top += privateInfoLabel.frame.size.height + 15;
    
    self.privateInfoTextView = [[YDTextView alloc] initWithFrame:CGRectMake(PADDING_LEFT,
                                                                            margin_top,
                                                                            width,
                                                                            80)];
    
    self.privateInfoTextView.layer.masksToBounds = YES;
    self.privateInfoTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.privateInfoTextView.layer.borderWidth = 0.5f;
    
    margin_top += self.privateInfoTextView.frame.size.height + 15;
    
    self.warningLabel = [[UILabel alloc] initWithFrame:CGRectMake(PADDING_LEFT,
                                                                 margin_top,
                                                                  width,
                                                                  30)];
    self.warningLabel.textColor = [UIColor lightGrayColor];
    self.warningLabel.text = NSLocalizedString(@"This information will be available only to the selected executer", nil);
    self.warningLabel.numberOfLines = 2;
    self.warningLabel.font = [UIFont systemFontOfSize:12.0f];
    
    /*
        Additional Information view
     */
    
    verticalOffset += self.descriptionView.frame.size.height + MARGIN_TOP;
    self.additionalInfoView = [[UIView alloc] initWithFrame:CGRectMake(MARGIN_LEFT,
                                                                      verticalOffset,
                                                                       self.view.frame.size.width - MARGIN_LEFT*2, 400)];
    self.additionalInfoView.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:self.additionalInfoView];
    
    width = (self.additionalInfoView.frame.size.width - 10)/2;
    /*
        Date view
     */
    self.dateView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                            0,
                                                             width,
                                                             70)];
    self.dateView.backgroundColor = [UIColor whiteColor];
    
    [self.additionalInfoView addSubview:self.dateView];
    
    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 30)];
    
    dateLabel.text = NSLocalizedString(@"Date and Time", nil);
    dateLabel.textAlignment = NSTextAlignmentCenter;
    dateLabel.textColor = [UIColor lightGrayColor];
    [self.dateView addSubview:dateLabel];
    
    self.dateTextField = [[UITextField alloc] initWithFrame:CGRectMake(PADDING_LEFT, 30, width - PADDING_LEFT*2, 30)];
    self.dateTextField.layer.masksToBounds = YES;
    self.dateTextField.layer.borderWidth = 0.5f;
    self.dateTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    UIDatePicker *picker = [[UIDatePicker alloc] init];
    
    self.dateTextField.inputView = picker;
    [self.dateView addSubview:self.dateTextField];
    
   
    
    /*
        Image Picker View
     */
    self.imagePickView = [[UIView alloc] initWithFrame:CGRectMake(self.dateView.frame.size.width + 10,
                                                                 0,
                                                                 width,
                                                                  70)];
    self.imagePickView.backgroundColor = [UIColor whiteColor];
    
    [self.additionalInfoView addSubview:self.imagePickView];
    
    UILabel *photoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 30)];
    
    photoLabel.text = NSLocalizedString(@"Photo", nil);
    photoLabel.textAlignment = NSTextAlignmentCenter;
    photoLabel.textColor = [UIColor lightGrayColor];
    [self.imagePickView addSubview:photoLabel];
    
    UIButton *photoButton = [[UIButton alloc] initWithFrame:CGRectMake(PADDING_LEFT, 30, width - PADDING_LEFT*2, 30)];
    
    [photoButton addTarget:self
                    action:@selector(imagePickerButtonDidPress:)
          forControlEvents:UIControlEventTouchUpInside];
    
    
    UIImageView *photoImage = [[UIImageView alloc] initWithFrame:CGRectMake(50, 0, 30, 30)];
    photoImage.image = [[UIImage imageNamed:@"camera.png"] imageWithColor:[UIColor lightGrayColor]];
    
    [photoButton addSubview:photoImage];
    
    [self.imagePickView addSubview:photoButton];
    
    /*
        Address View
     */
    verticalOffset = self.dateView.frame.size.height + MARGIN_TOP;
    self.addressView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                               verticalOffset,
                                                               self.view.frame.size.width - MARGIN_LEFT*2,
                                                                40)];
    self.addressView.backgroundColor = [UIColor whiteColor];
    
    UIButton *addressButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    [addressButton addTarget:self
                      action:@selector(selectAddressButtonDidPress)
            forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *buttonTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 40)];
    buttonTitleLabel.text = NSLocalizedString(@"Select address", nil);
    buttonTitleLabel.textColor = [UIColor lightGrayColor];
    buttonTitleLabel.textAlignment = NSTextAlignmentLeft;
    
    [addressButton addSubview:buttonTitleLabel];
    
    UIImageView *arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(290, 10, 13, 20)];
    arrowImage.image = [[UIImage imageNamed:@"arrow_right_gray"] imageWithColor:[UIColor lightGrayColor]];
    
    [addressButton addSubview:arrowImage];
    
    [self.addressView addSubview:addressButton];
    [self.additionalInfoView addSubview:self.addressView];
    
    /*
        Phone View
     */
    
    verticalOffset += self.addressView.frame.size.height + MARGIN_TOP;
    
    self.phoneView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                             verticalOffset,
                                                             self.view.frame.size.width - MARGIN_LEFT*2,
                                                              80)];
    
    self.phoneView.backgroundColor = [UIColor whiteColor];
    
    UILabel *phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.phoneView.frame.size.width, 40)];
    phoneLabel.text = NSLocalizedString(@"Your phone number", nil);
    phoneLabel.textColor = [UIColor lightGrayColor];
    [self.phoneView addSubview:phoneLabel];
    
    self.stateNumberTextField = [[UITextField alloc] initWithFrame:CGRectMake(PADDING_LEFT, 40, 50, 30)];
    self.stateNumberTextField.text = @"+7";
    self.stateNumberTextField.textAlignment = NSTextAlignmentRight;
    self.stateNumberTextField.layer.masksToBounds = YES;
    self.stateNumberTextField.layer.borderWidth = 0.5f;
    self.stateNumberTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.phoneView addSubview:self.stateNumberTextField];
    
    CGFloat offset = self.stateNumberTextField.frame.origin.x + self.stateNumberTextField.frame.size.width + PADDING_LEFT;
    self.phoneNumberTextField = [[UITextField alloc] initWithFrame:CGRectMake(offset, 40, 230, 30)];
    self.phoneNumberTextField.layer.masksToBounds = YES;
    self.phoneNumberTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.phoneNumberTextField.layer.borderWidth = 0.5f;
    [self.phoneView addSubview:self.phoneNumberTextField];
    [self.additionalInfoView addSubview:self.phoneView];
    
    
    /*
        Price View
     */
    
    verticalOffset += self.phoneView.frame.size.height + MARGIN_TOP;
    
    self.priceView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                              verticalOffset,
                                                              self.view.frame.size.width - MARGIN_LEFT*2,
                                                              40)];
    self.priceView.backgroundColor = [UIColor whiteColor];
    
    UIButton *priceButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    [priceButton addTarget:self
                      action:@selector(taskCostButtonDidPress)
            forControlEvents:UIControlEventTouchUpInside];
    
    buttonTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 40)];
    buttonTitleLabel.text = NSLocalizedString(@"The cost of the task", nil);
    buttonTitleLabel.textColor = [UIColor lightGrayColor];
    buttonTitleLabel.textAlignment = NSTextAlignmentLeft;
    
    [priceButton addSubview:buttonTitleLabel];
    
    arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(290, 10, 13, 20)];
    arrowImage.image = [[UIImage imageNamed:@"arrow_right_gray"] imageWithColor:[UIColor lightGrayColor]];

    [priceButton addSubview:arrowImage];
    [self.priceView addSubview:priceButton];
    
    [self.additionalInfoView addSubview:self.priceView];
    
    /*
        Additional conditions view
     */
    
    verticalOffset += self.priceView.frame.size.height + MARGIN_TOP;
    
    self.additionalConditionsView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                             verticalOffset,
                                                                             self.view.frame.size.width - MARGIN_LEFT*2,
                                                                             40)];
    self.additionalConditionsView.backgroundColor = [UIColor whiteColor];
    
    UIButton *conditionsButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    [conditionsButton addTarget:self
                    action:@selector(conditionsButtonDidPress)
          forControlEvents:UIControlEventTouchUpInside];
    
    buttonTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 40)];
    buttonTitleLabel.text = NSLocalizedString(@"Additional Conditions", nil);
    buttonTitleLabel.textColor = [UIColor lightGrayColor];
    buttonTitleLabel.textAlignment = NSTextAlignmentLeft;
    
    [conditionsButton addSubview:buttonTitleLabel];
    
    arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(290, 10, 13, 20)];
    arrowImage.image = [[UIImage imageNamed:@"arrow_right_gray"] imageWithColor:[UIColor lightGrayColor]];
    
    [conditionsButton addSubview:arrowImage];
    
    [self.additionalConditionsView addSubview:conditionsButton];
    [self.additionalInfoView addSubview:self.additionalConditionsView];
    
    /*
        Continue button
     */
    verticalOffset += self.additionalConditionsView.frame.size.height + MARGIN_TOP;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0,
                                                                 verticalOffset,
                                                                  self.view.frame.size.width - MARGIN_LEFT*2,
                                                                  60)];
    button.backgroundColor = MAIN_COLOR;
    button.titleLabel.text = NSLocalizedString(@"Continue", nil);
    button.titleLabel.textColor = MAJOR_COLOR;
    
    [button setTitle:NSLocalizedString(@"Continue", nil)
            forState:UIControlStateNormal];
    [button setTitle:NSLocalizedString(@"Continue", nil)
            forState:UIControlStateHighlighted];
    
    [self.additionalInfoView addSubview:button];
}

- (void) switchStateDidChange: (UISwitch *) sender{
    NSLog(@"[YDTaskDetailsViewController switchStateDidChange:] %@", sender.on?@"YES":@"NO");
    
    if (sender.on)
        [self addPrivateInfoFieldAppear];
    else
        [self addPrivateInfoFieldDisappear];
}
- (void) addPrivateInfoFieldAppear{
    
    CGFloat offset = 125;
    
    CGRect desFrame = self.descriptionView.frame;
    desFrame.size.height += offset;
    
    CGRect contentFrame = self.contentView.frame;
    contentFrame.size.height += offset;
    
    CGSize scrollSize = self.scrollView.contentSize;
    scrollSize.height += offset;
    
    CGRect addFrame = self.additionalInfoView.frame;
    addFrame.origin.y += offset;
    
    
    self.privateInfoTextView.alpha = 0;
    [self.descriptionView addSubview:self.privateInfoTextView];
    
    self.warningLabel.alpha = 0;
    [self.descriptionView addSubview:self.warningLabel];
    
    [UIView animateWithDuration:0.3f
                     animations:^(void){
                         self.descriptionView.frame = desFrame;
                         self.contentView.frame = contentFrame;
                         self.scrollView.contentSize = scrollSize;
                         self.additionalInfoView.frame = addFrame;
                         self.privateInfoTextView.alpha = 1.0;
                         self.warningLabel.alpha = 1.0;
                     }
                     completion:^(BOOL finished){
        
                     }];
    
}
- (void) addPrivateInfoFieldDisappear{
    CGFloat offset = 125;
    
    CGRect desFrame = self.descriptionView.frame;
    desFrame.size.height -= offset;
    
    CGRect contentFrame = self.contentView.frame;
    contentFrame.size.height -= offset;
    
    CGSize scrollSize = self.scrollView.contentSize;
    scrollSize.height -= offset;
    
    CGRect addFrame = self.additionalInfoView.frame;
    addFrame.origin.y -= offset;
    
    [UIView animateWithDuration:0.3f
                     animations:^(void){
                         self.descriptionView.frame = desFrame;
                         self.contentView.frame = contentFrame;
                         self.scrollView.contentSize = scrollSize;
                         self.additionalInfoView.frame = addFrame;
                         self.privateInfoTextView.alpha = 0;
                         self.warningLabel.alpha = 0;
                     }
                     completion:^(BOOL finished){
                         [self.privateInfoTextView removeFromSuperview];
                         [self.warningLabel removeFromSuperview];
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) keyboardDidShow:(id) sender{
    CGRect frame = self.scrollView.frame;
    frame.size.height -= 216;
    [UIView animateWithDuration:0.3f
                     animations:^(void){
                         self.scrollView.frame = frame;
                     }
                     completion:^(BOOL finished){
        
                     }];
}
- (void) keyboardDidHide:(id) sender{
    CGRect frame = self.scrollView.frame;
    frame.size.height += 216;
    [UIView animateWithDuration:0.3f
                     animations:^(void){
                         self.scrollView.frame = frame;
                     }
                     completion:^(BOOL finished){
                         
                     }];
}
- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.titleTextField       resignFirstResponder];
    [self.descriptionTextView  resignFirstResponder];
    [self.dateTextField        resignFirstResponder];
    [self.stateNumberTextField resignFirstResponder];
    [self.phoneNumberTextField resignFirstResponder];
    [self.privateInfoTextView  resignFirstResponder];
}
- (void) imagePickerButtonDidPress: (UIButton *) sender{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@""
															 delegate:(id)self
													cancelButtonTitle:NSLocalizedString(@"Cancel", nil)
											   destructiveButtonTitle:nil
													otherButtonTitles:NSLocalizedString(@"Take photo", nil), NSLocalizedString(@"Choose from gallery", nil), nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    self.pickerController = [[UIImagePickerController alloc] init];
    self.pickerController.delegate = self;
    
    switch (buttonIndex) {
            
        case 0:
            [self takePhotoFromCamera];
            break;
        case 1:
            [self takePhotoFromAlbum];
            break;
        default:
            break;
    }
    
    
}

-(void)takePhotoFromCamera{
    
    self.pickerController.sourceType    = UIImagePickerControllerSourceTypeCamera;
    self.pickerController.allowsEditing = YES;
    
    [self presentViewController:self.pickerController
                       animated:YES
                     completion:NULL];
    
}
-(void)takePhotoFromAlbum{
    
    self.pickerController.sourceType    = UIImagePickerControllerSourceTypePhotoLibrary;
    self.pickerController.allowsEditing = YES;
    
    [self presentViewController:self.pickerController
                       animated:YES
                     completion:NULL];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
//    UIImage *image = [info valueForKey:UIImagePickerControllerEditedImage];
//    NSLog(@"didFinishPicking");
//    self.photoPlaceholder.image = image;
//    self.photoPicked = YES;
//    [[SFDefaultUser sharedSFUserDefaults] setMSizedImage:image];
//    [[SFDefaultUser sharedSFUserDefaults] setBSizedImage:[info valueForKey:UIImagePickerControllerOriginalImage]];
//    [self.photoPicker dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void) selectAddressButtonDidPress{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    YDAddressViewController *controller =[storyboard instantiateViewControllerWithIdentifier:@"addressController"];
    
    [self.navigationController pushViewController:controller
                                         animated:YES];
}
- (void) taskCostButtonDidPress{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    YDCostViewController *controller =[storyboard instantiateViewControllerWithIdentifier:@"costController"];
    
    [self.navigationController pushViewController:controller
                                         animated:YES];
}
- (void) conditionsButtonDidPress{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    YDAdditionalConViewController *controller =[storyboard instantiateViewControllerWithIdentifier:@"conditionsController"];
    
    [self.navigationController pushViewController:controller
                                         animated:YES];
}

@end
