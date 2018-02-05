//
//  PBIManageBaseCell.m
//  PBIManageTableViewDemo
//
//  Created by eric on 2018/2/1.
//  Copyright © 2018年 eric. All rights reserved.
//

#import "PBIManageBaseCell.h"

extern CGFloat PBI_kManageCellHeightPercent = 0.5;
extern CGFloat PBI_kManageCellPaddingPercent = 0.04;

@interface PBIManageBaseCell() <UITextFieldDelegate,UITextViewDelegate>

@end

@implementation PBIManageBaseCell

#pragma mark - View Cycle

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self initUI];
    }
    return self;
}


+(PBIManageBaseCell *)cellWithIdentifier:(NSString *)cellIdentifier
                               tableView:(UITableView *)tableView
                                   style:(PBIMangeBaseCellStyle)style{
    
    PBIManageBaseCell *cell = [[PBIManageBaseCell alloc] init];
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[PBIManageBaseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.style = style;
    
    return cell;
}

-(void)initUI{
    _titleLabel     = [UILabel new];
    _leftIcon       = [UIImageView new];
    _rightIcon      = [UIImageView new];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat cellWidth = self.frame.size.width;

    CGFloat cellHeight = self.frame.size.height;

    CGFloat padding = self.frame.size.width * PBI_kManageCellPaddingPercent;

    CGFloat height  = self.frame.size.height * PBI_kManageCellHeightPercent;
    
    [self clearSubviews];

    switch (self.style) {

        case PBIMangeBaseCellStyleDefault:
        {

            self.titleLabel.size = CGSizeMake(cellWidth - 2*padding, height);
            self.titleLabel.centerY = cellHeight/2;
            self.titleLabel.left = padding;

            [self addSubview:self.titleLabel];

        }
            break;
            
        case PBIMangeBaseCellStyleWithLeftIcon:
        {
            
            self.titleLabel.size = CGSizeMake(cellWidth - 3*padding - height,height);
            self.titleLabel.centerY = cellHeight/2;
            self.titleLabel.left = padding*2 + height;
            
            self.leftIcon.size = CGSizeMake(height, height);
            self.leftIcon.centerY = cellHeight / 2;
            self.leftIcon.left = padding;
            
            [self addSubview:self.titleLabel];
            [self addSubview:self.leftIcon];
        }
            break;
            
        case PBIMangeBaseCellStyleWithRightIcon:
        {
            
            self.titleLabel.size = CGSizeMake(cellWidth - 3*padding - height,height);
            self.titleLabel.centerY = cellHeight/2;
            self.titleLabel.left = padding;
            
            self.rightIcon.size = CGSizeMake(height, height);
            self.rightIcon.centerY = cellHeight / 2;
            self.rightIcon.right = cellWidth - padding - height;
            
            [self addSubview:self.titleLabel];
            [self addSubview:self.rightIcon];
            
        }
            break;
            
        case PBIMangeBaseCellStyleWithLeftIconRightIcon:
        {
            self.titleLabel.size = CGSizeMake(cellWidth - 4*padding - height*2,height);
            self.titleLabel.centerY = cellHeight/2;
            self.titleLabel.left = padding*2 + height;
            
            self.leftIcon.size = CGSizeMake(height, height);
            self.leftIcon.centerY = cellHeight / 2;
            self.leftIcon.left = padding;
            
            self.rightIcon.size = CGSizeMake(height, height);
            self.rightIcon.centerY = cellHeight / 2;
            self.rightIcon.left = cellWidth - padding - self.rightIcon.size.width;
            
            [self addSubview:self.titleLabel];
            [self addSubview:self.leftIcon];
            [self addSubview:self.rightIcon];
            
        }
            break;
    }
}

#pragma mark - Public Func

-(void)clearSubviews{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}







@end
