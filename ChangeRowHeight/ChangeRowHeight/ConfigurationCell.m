//
//  ConfigurationCell.m
//  ChangeRowHeight
//
//  Created by 李阳 on 16/1/2016.
//  Copyright © 2016 LiChunYang. All rights reserved.
//

#import "ConfigurationCell.h"
#import <Masonry/Masonry.h>

@implementation ConfigurationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.7];
        UILabel * label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor redColor];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self);
            make.left.mas_equalTo(self);
            make.height.mas_equalTo(25);
            make.right.mas_equalTo(self);
        }];
        label.text = @"10JQKA";
    }
    return self;
}

- (void)layoutSubviews {
    
}

@end
