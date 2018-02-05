//
//  PBIManageCustomView.h
//  PBIManageTableViewDemo
//
//  Created by eric on 2018/2/5.
//  Copyright © 2018年 eric. All rights reserved.
//

#import "PBIManageBaseCell.h"

@interface PBIManageCustomCell : PBIManageBaseCell

@property(nonatomic,strong)UIView *customView;

+(PBIManageCustomCell *)cellWithIdentifier:(NSString *)cellIdentifier
                                 tableView:(UITableView *)tableView;

@end
