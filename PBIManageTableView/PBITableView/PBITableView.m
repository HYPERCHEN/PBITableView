//
//  PBITableView.m
//  PBIManageTableViewDemo
//
//  Created by eric on 2018/2/5.
//  Copyright © 2018年 eric. All rights reserved.
//

#import "PBITableView.h"

@implementation PBITableView

-(void)headerView:(PBILinkSectionBlock)header
        withCells:(PBILinkCellsArrayBlock)cells
       footerView:(PBILinkSectionBlock)footer{
    
    PBITableViewSectionModel *model = [[PBITableViewSectionModel alloc] init];
    header(model);
    cells(model.cellModelArray);
    footer(model);
    [self.tableViewModel.sectionModelArray addObject:model];
    
}

-(PBITableViewModel *)tableViewModel{
    if (!_tableViewModel) {
    
        _tableViewModel = [[PBITableViewModel alloc] init];
        self.delegate = _tableViewModel;
        self.dataSource = _tableViewModel;
        
    }
    return _tableViewModel;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
