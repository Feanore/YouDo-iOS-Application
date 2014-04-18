//
//  YDTextView.h
//  YouDo
//
//  Created by Zhanserik Kenes on 18.04.14.
//  Copyright (c) 2014 Kenes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YDTextView : UITextView

@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, retain) UIColor *placeholderColor;

-(void)textChanged:(NSNotification*)notification;

@end
