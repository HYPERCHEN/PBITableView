//
//  PBIManageLabelCell.h
//  PBIManageTableViewDemo
//
//  Created by eric on 2018/2/5.
//  Copyright © 2018年 eric. All rights reserved.
//

#import "PBIManageBaseCell.h"

typedef NS_ENUM(NSInteger,PBIManageLabelCellStyle){
    PBIManageLabelCellStyleLeftIcon, //LeftIcon + Title + TextField
    PBIManageLabelCellStyleDefault   //Title + TextField
};

extern CGFloat PBI_kManageLabelCellHeightPercent;

@interface PBIManageLabelCell : PBIManageBaseCell

@property(nonatomic,strong)UILabel *pbi_label;

+(PBIManageLabelCell *)cellWithIdentifier:(NSString *)cellIdentifier
                                    tableView:(UITableView *)tableView
                                        style:(PBIManageLabelCellStyle)style;

@end
