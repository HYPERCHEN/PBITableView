//
//  PBIMangeSwitchCell.m
//  PBIManageTableViewDemo
//
//  Created by eric on 2018/2/5.
//  Copyright © 2018年 eric. All rights reserved.
//

#import "PBIMangeSwitchCell.h"

@implementation PBIMangeSwitchCell

#pragma mark - View Cycle

+(PBIMangeSwitchCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView style:(PBIMangeSwitchCellStyle)style{
    
    PBIMangeSwitchCell *cell = [[PBIMangeSwitchCell alloc] init];
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[PBIMangeSwitchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.style = style;
    
    [cell setUI];
    
    return cell;
    
}


-(void)setUI{
    
    self.pbi_Switch = [[UISwitch alloc] init];
    self.pbi_Switch.onTintColor = PBI_kManageCellDefaultColor;
    [self.pbi_Switch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self clearSubviews];
    
    CGFloat cellWidth = self.frame.size.width;
    CGFloat cellHeight = self.frame.size.height;
    CGFloat padding = self.frame.size.width * PBI_kManageCellPaddingPercent;
    CGFloat height  = self.frame.size.height * PBI_kManageCellHeightPercent;
    
    switch (self.style) {
            
        case PBIMangeSwitchCellStyleWithLeftIcon:
        {
            
            self.pbi_Switch.centerY = cellHeight/2;
            self.pbi_Switch.right = cellWidth - (self.pbi_Switch.size.width -padding*2);
            
            self.titleLabel.size = CGSizeMake(cellWidth - 4*padding - height - self.pbi_Switch.frame.size.width,height);
            self.titleLabel.centerY = cellHeight/2;
            self.titleLabel.left = padding*2 + height;
            
            self.leftIcon.size = CGSizeMake(height, height);
            self.leftIcon.centerY = cellHeight / 2;
            self.leftIcon.left = padding;
            
            [self addSubview:self.titleLabel];
            [self addSubview:self.leftIcon];
            [self addSubview:self.pbi_Switch];
            
        }
            break;
            
        case PBIMangeSwitchCellStyleDefault:
        {
            self.titleLabel.size = CGSizeMake(cellWidth/2 - 2*padding,height);
            self.titleLabel.centerY = cellHeight/2;
            self.titleLabel.left = padding;
            
            self.pbi_Switch.centerY = cellHeight/2;
            self.pbi_Switch.right = cellWidth - (self.pbi_Switch.size.width -padding*2);
            
            [self addSubview:self.titleLabel];
            [self addSubview:self.pbi_Switch];
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark - Targer Action

-(void)switchValueChanged:(UISwitch *)sender{
    if (self.switchBlock) {
        self.switchBlock(sender.isOn);
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
