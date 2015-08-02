//
//  ViewItems.m
//  GW2BroH
//
//  Created by CoodyChou on 2015/8/1.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "ViewItems.h"

// for tools
#import "GW2BroH_Tools.h"
#import "Constants.h"

// for UI
#import "TableViewCell_SeparateCell.h"


// define UI Position
#define D_AddButton_Width 61
#define D_AddButton_Height 44

@interface ViewItems() < UITableViewDelegate , UITableViewDataSource >

@property (nonatomic , strong) UITableView *itemsTableView;
@property (nonatomic , strong) NSMutableArray *itemsArray;
@property (nonatomic , strong) UIButton *addItemButton;

@end

@implementation ViewItems

-(id)init{
    self = [super init];
    if ( self ) {
        CGRect tempFrame = [UIScreen mainScreen].bounds;
        float statusHight = [GW2BroH_Tools statusBarHeight];
        [self setFrame:CGRectMake(0,
                                  [GW2BroH_Tools statusBarHeight] + 44.2,
                                  tempFrame.size.width,
                                  tempFrame.size.height - statusHight - 49 - 44.2 )];
        [self setBackgroundColor:VC_OTHERS_BACKGROUND_COLOR];
        
        _itemsArray = [[NSMutableArray alloc] init];
        
        [self createItemsTableView];
        
        [self createAddButton];
    }
    return self;
}

#pragma mark - UI Component initial
-(void)createItemsTableView{
    if ( _itemsTableView == nil ) {
        _itemsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,
                                                                        self.frame.size.width,
                                                                        self.frame.size.height)];
        [_itemsTableView setBackgroundColor:[UIColor clearColor]];
        [_itemsTableView setSeparatorStyle:(UITableViewCellSeparatorStyleSingleLine)];
        _itemsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _itemsTableView.dataSource = self;
        _itemsTableView.delegate = self;
        _itemsTableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    }
    [self addSubview:_itemsTableView];
}

-(void)createAddButton{
    if ( _addItemButton == nil ) {
        _addItemButton = [[UIButton alloc] init];
    }
    _addItemButton.frame = CGRectMake(self.frame.size.width - D_AddButton_Width + 10,
                                      self.frame.size.height - D_AddButton_Height - 15 ,
                                      D_AddButton_Width,
                                      D_AddButton_Height);
    [_addItemButton setImage:[GW2BroH_Tools getImageWithString:@"ViewControllerItems" withImageName:@"addItemButton"]
                    forState:(UIControlStateNormal)];
    [self addSubview:_addItemButton];
}

#pragma mark - 開放方法
-(void)addItemsWithArray:(NSArray *)tempItemsArray{
    [_itemsArray removeAllObjects];
    [_itemsArray addObjectsFromArray:tempItemsArray];
    [_itemsTableView reloadData];
}

#pragma mark - UITableView Data Source
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell_SeparateCell * cell = [[TableViewCell_SeparateCell alloc] init];;
    if ( indexPath.row == 0 ) {
        
        [cell setupCell:_itemsArray[indexPath.row] withType:EnumSeparatorTableViewCell_Coins];
    }
    else if ( indexPath.row == 1 ){
        [cell setupCell:_itemsArray[indexPath.row] withType:EnumSeparatorTableViewCell_Gems];
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_itemsArray count];
}



#pragma mark - UITableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 取消選擇
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    TableViewCell_SeparateCell *cell = (TableViewCell_SeparateCell *)[_itemsTableView cellForRowAtIndexPath:indexPath];
    [cell setIsSelectCell:NO withAnimation:NO];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
