//
//  PBIMangeSwitchCell.h
//  PBIManageTableViewDemo
//
//  Created by eric on 2018/2/5.
//  Copyright © 2018年 eric. All rights reserved.
//

#import "PBIManageBaseCell.h"

typedef NS_ENUM(NSInteger,PBIMangeSwitchCellStyle){
    PBIMangeSwitchCellStyleWithLeftIcon, //LeftIcon + Title + Switch
    PBIMangeSwitchCellStyleDefault   //Title + Switch
};

typedef void(^PBISwitchValueBlock)(BOOL switchValue);

@interface PBIMangeSwitchCell : PBIManageBaseCell

@property(nonatomic,strong)UISwitch *pbi_Switch;

@property(nonatomic,copy)PBISwitchValueBlock switchBlock;

+(PBIMangeSwitchCell *)cellWithIdentifier:(NSString *)cellIdentifier
                                tableView:(UITableView *)tableView
                                    style:(PBIMangeSwitchCellStyle)style;




@end
