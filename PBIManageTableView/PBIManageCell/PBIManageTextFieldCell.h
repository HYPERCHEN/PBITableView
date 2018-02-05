//
//  PBIManageTextFieldCell.h
//  PBIManageTableViewDemo
//
//  Created by eric on 2018/2/5.
//  Copyright © 2018年 eric. All rights reserved.
//

#import "PBIManageBaseCell.h"

typedef NS_ENUM(NSInteger,PBIManageTextFieldCellStyle){
    PBIManageTextFieldCellStyleWithLeftIcon, //LeftIcon + Title + TextField
    PBIManageTextFieldCellStyleDefault   //Title + TextField
};

extern CGFloat PBI_kManageTextFieldCellHeightPercent;

typedef void(^PBITextValueBlock)(NSString * textValue);

@interface PBIManageTextFieldCell : PBIManageBaseCell

@property(nonatomic,strong)UITextField *pbi_TextField;

@property(nonatomic,copy)PBITextValueBlock textEndEditingBlock;

+(PBIManageTextFieldCell *)cellWithIdentifier:(NSString *)cellIdentifier
                                tableView:(UITableView *)tableView
                                    style:(PBIManageTextFieldCellStyle)style;

@end
