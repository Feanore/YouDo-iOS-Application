//
//  YDTaskViewCell.m
//  YouDo
//
//  Created by Zhanserik Kenes on 13.04.14.
//  Copyright (c) 2014 Kenes. All rights reserved.
//

#import "YDTaskViewCell.h"

@implementation YDTaskViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 50, 50)];
        [self.contentView addSubview:self.iconImage];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(65, 0, 195, 40)];
        self.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        self.titleLabel.numberOfLines = 3;
        [self.contentView addSubview:self.titleLabel];
        
        self.subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(65, 45, 260, 15)];
        self.subtitleLabel.textColor = [UIColor lightGrayColor];
        self.subtitleLabel.font = [UIFont systemFontOfSize:12.0f];
        [self.contentView addSubview:self.subtitleLabel];
        
        self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(260, 0, 60, 40)];
        self.priceLabel.font = [UIFont boldSystemFontOfSize:18.0];
        [self.contentView addSubview:self.priceLabel];
        
        
    }
    return self;
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
