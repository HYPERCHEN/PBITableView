//
//  PBIManageLabelCell.m
//  PBIManageTableViewDemo
//
//  Created by eric on 2018/2/5.
//  Copyright © 2018年 eric. All rights reserved.
//

#import "PBIManageLabelCell.h"

extern CGFloat PBI_kManageLabelCellHeightPercent = 0.8;

@implementation PBIManageLabelCell

+(PBIManageLabelCell *)cellWithIdentifier:(NSString *)cellIdentifier
                                    tableView:(UITableView *)tableView
                                        style:(PBIManageLabelCellStyle)style{
    
    PBIManageLabelCell *cell = [[PBIManageLabelCell alloc] init];
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[PBIManageLabelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.style = style;
    
    [cell setUI];
    
    return cell;
}

-(void)setUI{
    self.pbi_label = [[UILabel alloc] init];
    self.pbi_label.textAlignment = NSTextAlignmentRight;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self clearSubviews];
    
    CGFloat cellWidth = self.frame.size.width;
    CGFloat cellHeight = self.frame.size.height;
    CGFloat padding = self.frame.size.width * PBI_kManageCellPaddingPercent;
    CGFloat height  = self.frame.size.height * PBI_kManageCellHeightPercent;
    
    switch (self.style) {
            
        case PBIManageLabelCellStyleLeftIcon:
        {
            
            self.titleLabel.size = CGSizeMake(cellWidth/2 - 3*padding - height , height);
            self.titleLabel.centerY = cellHeight/2;
            self.titleLabel.left = padding*2 + height;
            
            self.leftIcon.size = CGSizeMake(height, height);
            self.leftIcon.centerY = cellHeight / 2;
            self.leftIcon.left = padding;
            
            
            self.pbi_label.centerY = cellHeight/2;
            self.pbi_label.size = CGSizeMake(cellWidth / 2 - 2*padding, PBI_kManageCellHeightPercent * cellHeight);
            self.pbi_label.left = cellWidth/2 + padding;
            self.pbi_label.top = (0.5 - PBI_kManageCellHeightPercent/2)*cellHeight;
            
            
            [self addSubview:self.titleLabel];
            [self addSubview:self.leftIcon];
            [self addSubview:self.pbi_label];
            
        }
            break;
            
        case PBIManageLabelCellStyleDefault:
        {
            self.titleLabel.size = CGSizeMake(cellWidth/2 - 2*padding,height);
            self.titleLabel.centerY = cellHeight/2;
            self.titleLabel.left = padding;
            
            self.pbi_label.centerY = cellHeight/2;
            self.pbi_label.size = CGSizeMake(cellWidth / 2 - 2*padding, PBI_kManageCellHeightPercent * cellHeight);
            self.pbi_label.left = cellWidth/2 + padding;
            self.pbi_label.top = (0.5 - PBI_kManageCellHeightPercent/2)*cellHeight;
            
            [self addSubview:self.titleLabel];
            [self addSubview:self.pbi_label];
        }
            break;
            
        default:
            break;
    }
    
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
