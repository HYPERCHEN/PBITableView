//
//  PBITableView.h
//  PBIManageTableViewDemo
//
//  Created by eric on 2018/2/5.
//  Copyright © 2018年 eric. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PBITableViewModel.h"

@interface PBITableView : UITableView

@property(nonatomic,strong)PBITableViewModel *tableViewModel;

//Use to func way to generate a section
-(void)headerView:(PBILinkSectionBlock)header
     withCells:(PBILinkCellsArrayBlock)cells
      footerView:(PBILinkSectionBlock)footer;

@end
