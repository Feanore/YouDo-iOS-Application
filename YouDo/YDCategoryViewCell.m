//
//  YDCategoryViewCell.m
//  YouDo
//
//  Created by Zhanserik Kenes on 13.04.14.
//  Copyright (c) 2014 Kenes. All rights reserved.
//

#import "YDCategoryViewCell.h"

@implementation YDCategoryViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 50, 50)];
        [self.contentView addSubview:self.iconImage];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(65, 0, 195, 60)];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:22.0f];
        
        [self.contentView addSubview:self.titleLabel];
        
        self.starButton = [[UIButton alloc] initWithFrame:CGRectMake(260, 15, 30, 30)];
        [self.starButton setImage:[[UIImage imageNamed:@"star_normal.png"] imageWithColor:MAIN_COLOR] forState:UIControlStateNormal];
        [self.starButton setImage:[[UIImage imageNamed:@"star_highlighted.png"] imageWithColor:MAIN_COLOR] forState:UIControlStateSelected];
        
        [self.starButton addTarget:self
                            action:@selector(changeState:)
                  forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:self.starButton];
    }
    return self;
}

- (void) changeState: (UIButton *)sender{
    sender.selected = !sender.isSelected;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
