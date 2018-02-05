//
//  PBIManageCustomView.m
//  PBIManageTableViewDemo
//
//  Created by eric on 2018/2/5.
//  Copyright © 2018年 eric. All rights reserved.
//

#import "PBIManageCustomCell.h"

@implementation PBIManageCustomCell

+(PBIManageCustomCell *)cellWithIdentifier:(NSString *)cellIdentifier
                                 tableView:(UITableView *)tableView{
    
    PBIManageCustomCell *cell = [[PBIManageCustomCell alloc] init];
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[PBIManageCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setUI];
    
    return cell;
}

-(void)setUI{
    self.customView = [[UIView alloc] init];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self clearSubviews];
    
    self.customView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    [self addSubview:self.customView];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
