//
//  ViewController.m
//  PBIManageTableViewDemo
//
//  Created by eric on 2018/2/1.
//  Copyright © 2018年 eric. All rights reserved.
//

#import "ViewController.h"
#import "PBIManageCell.h"
#import "PBITableView.h"


@interface ViewController ()

@property(nonatomic,strong)PBITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView = [[PBITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];

    //Every Func generate a "section"
    [self addBaseCellView];
    [self addTextFieldCellView];
    [self addLabelCellView];
    [self addSwitchCellView];
    [self addCustomView];
    
}

#pragma mark - Table View Func
-(void)addBaseCellView{
    [self.tableView headerView:^(PBITableViewSectionModel *sectionModel){
        
        sectionModel.headerTitle = @"Base Cell";
        sectionModel.headerHeight = 20;
        
    } withCells:^(NSMutableArray *cellArray) {
    
        PBITableViewCellModel *base1 = [[PBITableViewCellModel alloc] init];
        base1.height = 50;
        base1.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
            PBIManageBaseCell *cell = [PBIManageBaseCell cellWithIdentifier:@"123" tableView:tableView style:PBIMangeBaseCellStyleDefault];
            cell.imageView.image = [UIImage imageNamed:@"avator"];
            cell.titleLabel.text = @"Introduction One";
            return cell;
        };
        [cellArray addObject:base1];
        
        PBITableViewCellModel *base2 = [[PBITableViewCellModel alloc] init];
        base2.height = 50;
        base2.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
            PBIManageBaseCell *cell = [PBIManageBaseCell cellWithIdentifier:@"123" tableView:tableView style:PBIMangeBaseCellStyleWithLeftIcon];
            cell.leftIcon.image = [UIImage imageNamed:@"avator"];
            cell.titleLabel.text = @"Introduction Two";
            return cell;
        };
        [cellArray addObject:base2];
        
        PBITableViewCellModel *base3 = [[PBITableViewCellModel alloc] init];
        base3.height = 100;
        base3.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
            PBIManageBaseCell *cell = [PBIManageBaseCell cellWithIdentifier:@"123" tableView:tableView style:PBIMangeBaseCellStyleWithLeftIconRightIcon];
            
            cell.rightIcon.image = [UIImage imageNamed:@"avator"];
            
            cell.leftIcon.image  = [UIImage imageNamed:@"avator"];
            
            cell.titleLabel.text = @"Introduction Three";
            
            return cell;
        };
        [cellArray addObject:base3];

        
    } footerView:^(PBITableViewSectionModel *sectionModel){
        sectionModel.footerHeight = 20;
    }];
}

-(void)addTextFieldCellView{
    
    [self.tableView headerView:^(PBITableViewSectionModel *sectionModel){
        
        sectionModel.headerTitle = @"TextField Cell";
        sectionModel.headerHeight = 20;
        
    } withCells:^(NSMutableArray *cellArray) {
        
        PBITableViewCellModel *base1 = [[PBITableViewCellModel alloc] init];
        base1.height = 50;
        base1.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
            PBIManageTextFieldCell *cell = [PBIManageTextFieldCell cellWithIdentifier:@"123" tableView:tableView style:PBIManageTextFieldCellStyleDefault];
            cell.titleLabel.text = @"Address";
            cell.pbi_TextField.text = @"Hangzhou";
            return cell;
        };
        [cellArray addObject:base1];
        
        PBITableViewCellModel *base2 = [[PBITableViewCellModel alloc] init];
        base2.height = 50;
        base2.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
            
            PBIManageTextFieldCell *cell = [PBIManageTextFieldCell cellWithIdentifier:@"123" tableView:tableView style:PBIManageTextFieldCellStyleWithLeftIcon];
            cell.leftIcon.image = [UIImage imageNamed:@"avator"];
            cell.titleLabel.text = @"Signature";
            cell.pbi_TextField.placeholder = @"Say Something";
            __weak __typeof__(PBIManageTextFieldCell *) weak_cell = cell;
            cell.textEndEditingBlock = ^(NSString *textValue) {
                weak_cell.titleLabel.text = textValue;
            };
            
            return cell;
        };
        [cellArray addObject:base2];
        
    } footerView:^(PBITableViewSectionModel *sectionModel){
        sectionModel.footerHeight = 20;
    }];
}

-(void)addLabelCellView{
    
    [self.tableView headerView:^(PBITableViewSectionModel *sectionModel){
    
        sectionModel.headerTitle = @"Label Cell";
        sectionModel.headerHeight = 20;
        
    } withCells:^(NSMutableArray *cellArray) {
        
        PBITableViewCellModel *base2 = [[PBITableViewCellModel alloc] init];
        base2.height = 50;
        base2.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
            PBIManageLabelCell *cell = [PBIManageLabelCell cellWithIdentifier:@"123" tableView:tableView style:PBIManageLabelCellStyleDefault];
            cell.titleLabel.text = @"Mood";
            NSTextAttachment *attch = [[NSTextAttachment alloc] init];
            attch.image = [UIImage imageNamed:@"warning"];
            attch.bounds = CGRectMake(0, 0, 20, 20);
            NSMutableAttributedString *allString = [[NSMutableAttributedString alloc] initWithString:@"U guess"];
        
            NSAttributedString *phoneString = [NSAttributedString attributedStringWithAttachment:attch];
            [allString appendAttributedString:phoneString];
            cell.pbi_label.attributedText = allString;
            
            return cell;
        };
        [cellArray addObject:base2];
        
        
        PBITableViewCellModel *base1 = [[PBITableViewCellModel alloc] init];
        base1.height = 50;
        base1.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
            
            PBIManageLabelCell *cell = [PBIManageLabelCell cellWithIdentifier:@"123" tableView:tableView style:PBIManageLabelCellStyleLeftIcon];
            cell.titleLabel.text = @"Mood";
            cell.leftIcon.image = [UIImage imageNamed:@"avator"];
            NSTextAttachment *attch = [[NSTextAttachment alloc] init];
            attch.image = [UIImage imageNamed:@"warning"];
            attch.bounds = CGRectMake(0, 0, 20, 20);
            NSMutableAttributedString *allString = [[NSMutableAttributedString alloc] initWithString:@"U guess"];
          
            NSAttributedString *phoneString = [NSAttributedString attributedStringWithAttachment:attch];
            [allString appendAttributedString:phoneString];
            cell.pbi_label.attributedText = allString;
            
            return cell;
        };
        [cellArray addObject:base1];
        
    } footerView:^(PBITableViewSectionModel *sectionModel){
        
        sectionModel.footerHeight = 50;
        sectionModel.footerTitle = @"IM THE LABEL FOOTER";
        
    }];
    
}

-(void)addSwitchCellView{
    [self.tableView headerView:^(PBITableViewSectionModel *sectionModel){
        
        sectionModel.headerTitle = @"Switch Cell";
        sectionModel.headerHeight = 20;
        
    } withCells:^(NSMutableArray *cellArray) {
        
        PBITableViewCellModel *base1 = [[PBITableViewCellModel alloc] init];
        base1.height = 50;
        base1.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
            PBIMangeSwitchCell *cell = [PBIMangeSwitchCell cellWithIdentifier:@"123" tableView:tableView style:PBIMangeSwitchCellStyleDefault];
            cell.titleLabel.text = @"Try Switch";
            return cell;
        };
        [cellArray addObject:base1];
        
        PBITableViewCellModel *base2 = [[PBITableViewCellModel alloc] init];
        base2.height = 50;
        base2.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
            PBIMangeSwitchCell *cell = [PBIMangeSwitchCell cellWithIdentifier:@"123" tableView:tableView style:PBIMangeSwitchCellStyleWithLeftIcon];
            cell.titleLabel.text = @"Switch Change Cell Background";
            cell.leftIcon.image = [UIImage imageNamed:@"warning"];
            __weak __typeof__(PBIMangeSwitchCell *) weak_cell = cell;
            cell.switchBlock = ^(BOOL switchValue) {
                if (switchValue == YES) {
                    weak_cell.backgroundColor = [UIColor greenColor];
                }else{
                    weak_cell.backgroundColor = [UIColor yellowColor];
                }
            };
            
            return cell;
        };
        [cellArray addObject:base2];
        
    } footerView:^(PBITableViewSectionModel *sectionModel){
        sectionModel.footerHeight = 20;
    }];
}

-(void)addCustomView{
    
    [self.tableView headerView:^(PBITableViewSectionModel *sectionModel){
        
        sectionModel.headerTitle = @"Custom Cell";
        sectionModel.headerHeight = 20;
        
    } withCells:^(NSMutableArray *cellArray) {
    
        
        PBITableViewCellModel *base2 = [[PBITableViewCellModel alloc] init];
        base2.height = 70;
        base2.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
            PBIManageCustomCell *cell = [PBIManageCustomCell cellWithIdentifier:@"123" tableView:tableView ];
            cell.customView = [self getAvatorView];
            return cell;
        };
        [cellArray addObject:base2];
        
    } footerView:^(PBITableViewSectionModel *sectionModel){
        sectionModel.footerHeight = 20;
    }];
}

#pragma mark - Private Func

-(UIView *)getAvatorView{
    UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 70)];
    
    UIImageView *avator = [[UIImageView alloc] initWithFrame:CGRectMake(20, (70-45)/2, 45, 45)];
    
    avator.image = [UIImage imageNamed:@"avator"];
    [view addSubview:avator];
    avator.layer.cornerRadius = 45/2;
    avator.layer.masksToBounds = YES;
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(avator.frame.origin.x + 45 + 20, (70 - 40)/2, self.view.frame.size.width, 40)];
    name.text = @"HYPERCHEN";
    [view addSubview:name];
    
    return view;
}

@end
