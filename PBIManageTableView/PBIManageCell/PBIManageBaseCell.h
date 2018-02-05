//
//  PBIManageBaseCell.h
//  PBIManageTableViewDemo
//
//  Created by eric on 2018/2/1.
//  Copyright © 2018年 eric. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIView+PBIManageLayout.h"
#import "PBIManageCellConst.h"

typedef NS_ENUM(NSInteger,PBIMangeBaseCellStyle){
    PBIMangeBaseCellStyleDefault,      //Title
    PBIMangeBaseCellStyleWithLeftIcon, //LeftIcon + Title
    PBIMangeBaseCellStyleWithRightIcon, //Title + RightIcon
    PBIMangeBaseCellStyleWithLeftIconRightIcon,//LeftIcon + Title - RightIcon
};

extern CGFloat PBI_kManageCellHeightPercent;
extern CGFloat PBI_kManageCellPaddingPercent;

@interface PBIManageBaseCell : UITableViewCell

@property(nonatomic,strong)UIImageView *leftIcon;

@property(nonatomic,strong)UILabel     *titleLabel;

@property(nonatomic,strong)UIImageView *rightIcon;

@property(nonatomic,assign)NSInteger style;

+(PBIManageBaseCell *)cellWithIdentifier:(NSString *)cellIdentifier
                                tableView:(UITableView *)tableView
                                    style:(PBIMangeBaseCellStyle)style;

- (void)clearSubviews;


@end
