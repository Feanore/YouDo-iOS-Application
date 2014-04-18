//
//  YDCategoryCell.m
//  YouDo
//
//  Created by Zhanserik Kenes on 15.04.14.
//  Copyright (c) 2014 Kenes. All rights reserved.
//

#import "YDCategoryCell.h"

@implementation YDCategoryCell

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
