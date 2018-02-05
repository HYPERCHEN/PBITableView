//
//  PBIManageTextFieldCell.m
//  PBIManageTableViewDemo
//
//  Created by eric on 2018/2/5.
//  Copyright © 2018年 eric. All rights reserved.
//

#import "PBIManageTextFieldCell.h"

extern CGFloat PBI_kManageTextFieldCellHeightPercent = 0.8;

@implementation PBIManageTextFieldCell

#pragma mark - View Cycle

+(PBIManageTextFieldCell *)cellWithIdentifier:(NSString *)cellIdentifier
                                    tableView:(UITableView *)tableView
                                        style:(PBIManageTextFieldCellStyle)style{
    
    PBIManageTextFieldCell *cell = [[PBIManageTextFieldCell alloc] init];
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[PBIManageTextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.style = style;
    [cell setUI];
    
    return cell;
}

-(void)setUI{
    
    self.pbi_TextField = [[UITextField alloc] init];
    self.pbi_TextField.textAlignment = NSTextAlignmentRight;
    
    [self.pbi_TextField addTarget:self action:@selector(textEditingEnd:) forControlEvents:UIControlEventEditingDidEnd];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self clearSubviews];
    
    CGFloat cellWidth = self.frame.size.width;
    CGFloat cellHeight = self.frame.size.height;
    CGFloat padding = self.frame.size.width * PBI_kManageCellPaddingPercent;
    CGFloat height  = self.frame.size.height * PBI_kManageCellHeightPercent;
    
    switch (self.style) {
            
        case PBIManageTextFieldCellStyleWithLeftIcon:
        {
            
            self.titleLabel.size = CGSizeMake(cellWidth/2 - 3*padding - height , height);
            self.titleLabel.centerY = cellHeight/2;
            self.titleLabel.left = padding*2 + height;
            
            self.leftIcon.size = CGSizeMake(height, height);
            self.leftIcon.centerY = cellHeight / 2;
            self.leftIcon.left = padding;
            
            self.pbi_TextField.size = CGSizeMake(cellWidth / 2 - 2*padding, PBI_kManageTextFieldCellHeightPercent * cellHeight);
            self.pbi_TextField.centerY = cellHeight / 2;
            self.pbi_TextField.left = cellWidth/2 + padding;
            self.pbi_TextField.top = (0.5 - PBI_kManageTextFieldCellHeightPercent/2)*cellHeight;
            
            [self addSubview:self.titleLabel];
            [self addSubview:self.leftIcon];
            [self addSubview:self.pbi_TextField];
            
        }
            break;
            
        case PBIManageTextFieldCellStyleDefault:
        {
            self.titleLabel.size = CGSizeMake(cellWidth/2 - 2*padding,height);
            self.titleLabel.centerY = cellHeight/2;
            self.titleLabel.left = padding;
            
            self.pbi_TextField.centerY = cellHeight/2;
            self.pbi_TextField.size = CGSizeMake(cellWidth / 2 - 2*padding, PBI_kManageTextFieldCellHeightPercent * cellHeight);
            self.pbi_TextField.left = cellWidth/2 + padding;
            self.pbi_TextField.top = (0.5 - PBI_kManageTextFieldCellHeightPercent/2)*cellHeight;
            
            
            [self addSubview:self.titleLabel];
            [self addSubview:self.pbi_TextField];
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark - Targer Action

-(void)textEditingEnd:(UITextField *)textField{
    if(self.textEndEditingBlock){
        self.textEndEditingBlock(textField.text);
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
