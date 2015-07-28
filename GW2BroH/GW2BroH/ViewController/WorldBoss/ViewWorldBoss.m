//
//  ViewWorldBoss.m
//  GW2BroH
//
//  Created by CoodyChou on 7/19/15.
//  Copyright (c) 2015 CoodyChou. All rights reserved.
//

#import "ViewWorldBoss.h"

// for tools
#import "Constants.h"
#import "GW2BroH_Tools.h"

// for TableViewCell
#import "TableViewCell_SeparateCell.h"

// TODO:多國語系
#define D_String_NoDataString @"目前沒有任何世界王！\n\n請確認網路狀態、\n\n或是重新開啟 App！"


#pragma mark -
@interface ViewWorldBoss() < UITableViewDataSource,
                             UITableViewDelegate >

@property (nonatomic , strong) UILabel *noDataLabel;
@property (nonatomic , strong) UITableView *worldBossTableView;
@property (nonatomic , strong) NSMutableArray *worldBossArray;

@property (nonatomic) NSInteger recentSelectIndex;
@property (nonatomic , strong) NSMutableDictionary *selectDic;

@end

#pragma mark -
@implementation ViewWorldBoss
-(id)init
{
    self = [super init];
    if ( self != nil ) {
        CGRect tempFrame = [UIScreen mainScreen].bounds;
        float statusHight = [GW2BroH_Tools statusBarHeight];
        [self setFrame:CGRectMake(0,
                                  [GW2BroH_Tools statusBarHeight] + 45,
                                  tempFrame.size.width,
                                  tempFrame.size.height - statusHight - 50 - 45 )];
        [self setBackgroundColor:VC_OTHERS_BACKGROUND_COLOR];
        
        _worldBossArray = [[NSMutableArray alloc] init];
        _selectDic = [[NSMutableDictionary alloc] init];
        _recentSelectIndex = NSNotFound;
        
        [self createWorldBossTableView];
        
        [self createNoDataLabel];
    }
    return self;
}

#pragma mark - initial ui 元件
- (void)createWorldBossTableView{
    if ( _worldBossTableView == nil ) {
        _worldBossTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                            0,
                                                                            self.frame.size.width,
                                                                            self.frame.size.height)];
        [_worldBossTableView setBackgroundColor:[UIColor clearColor]];
        [_worldBossTableView setSeparatorStyle:(UITableViewCellSeparatorStyleSingleLine)];
        _worldBossTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _worldBossTableView.delegate = self;
        _worldBossTableView.dataSource = self;
    }
    [_worldBossTableView setHidden:NO];
    
    [self addSubview:_worldBossTableView];
}

-(void)createNoDataLabel{
    if ( _noDataLabel == nil ) {
        _noDataLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width*0.5 - 150,
                                                                 0,
                                                                 300,
                                                                 self.frame.size.height)];
        [_noDataLabel setText:D_String_NoDataString];
        _noDataLabel.numberOfLines = 0;
        [_noDataLabel setTextColor:VC_NAVIGATION_BAR_COLOR];
        [_noDataLabel setTextAlignment:(NSTextAlignmentCenter)];
        [_noDataLabel setFont:[UIFont boldSystemFontOfSize:22.0f]];
        [_noDataLabel setHidden:YES];
    }
    [self addSubview:_noDataLabel];
}

#pragma mark - 開放方法
-(void)addWorldBossWithArray:(NSArray *)tempWorldBossArray{
    [_worldBossArray removeAllObjects];
    [_selectDic removeAllObjects];
    
    // 判斷陣列內是否有 World Boss Model 資料
    if ( [tempWorldBossArray count] <= 0 ) {
        [self hideTableView:YES];
    }
    else{
        [self hideTableView:NO];
        [_worldBossArray addObjectsFromArray:tempWorldBossArray];
        [_worldBossTableView reloadData];
        NSInteger unitIndex = 0;
        
        // 將所有 cell 的狀態設定為「未選擇」，並且設定 Key 為此 cell 的 index
        for ( id unit in _worldBossArray ) {
            [_selectDic setObject:[NSNumber numberWithBool:NO] forKey:[NSString stringWithFormat:@"%ld" , (long)unitIndex]];
            unitIndex++;
        }
        
        // 如果有之前被選擇的 cell 時，要打開 cell 並且 scroll 到那個 cell
        if ( _recentSelectIndex != NSNotFound ) {
            [_selectDic setValue:[NSNumber numberWithBool:YES] forKey:[NSString stringWithFormat:@"%ld" , (long)_recentSelectIndex]];
            [_worldBossTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_recentSelectIndex inSection:0]
                                       atScrollPosition:(UITableViewScrollPositionTop)
                                               animated:YES];
            
        }
    }
}

#pragma mark - 內部方法
-(void)hideTableView:(BOOL)isHidden{
    [_worldBossTableView setHidden:isHidden];
    [_noDataLabel setHidden:!isHidden];
}

-(BOOL)checkIsSelected:(NSInteger)tempIndexRow{
    return (_recentSelectIndex == tempIndexRow);
}

#pragma mark - UITableView Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ( [self checkIsSelected:indexPath.row] ) {
        return D_CellHight_Selected;
    }
    else{
        return D_CellHight_Normal;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消選擇
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [tableView beginUpdates];
    
    // 清除其他有點的 cell
    TableViewCell_SeparateCell *cell = (TableViewCell_SeparateCell *)[_worldBossTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_recentSelectIndex inSection:0]];
    [cell setIsSelectCell:NO];
    [_selectDic setValue:[NSNumber numberWithBool:NO] forKey:[NSString stringWithFormat:@"%ld" , _recentSelectIndex]];
    
    if ( [self checkIsSelected:indexPath.row] ) {
        // 點到自己
        _recentSelectIndex = NSNotFound;
    }
    else{
        // 點到別的 cell
        TableViewCell_SeparateCell *cell = (TableViewCell_SeparateCell *)[_worldBossTableView cellForRowAtIndexPath:indexPath];
        [cell setIsSelectCell:YES];
        [_selectDic setValue:[NSNumber numberWithBool:YES] forKey:[NSString stringWithFormat:@"%ld" , _recentSelectIndex]];
        _recentSelectIndex = indexPath.row;
    }
    
    [tableView endUpdates];
    
    // 滾到被點擊的 cell
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:(UITableViewScrollPositionTop) animated:YES];
}

#pragma mark - UITableView Data Source Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_worldBossArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    // 設定 Cell 的識別符號
//    NSString *worldBossCell = @"WorldBossCell";
//    
//    [tableView registerClass:[TableViewCell_SeparateCell class] forCellReuseIdentifier:worldBossCell];
//    
//    // 從 TableView 中取用是別的 Cell 來 reuse
//    id cell = [tableView dequeueReusableCellWithIdentifier:worldBossCell];
//    if ( cell == nil ) {
//        cell = [[TableViewCell_SeparateCell alloc] init];
//    }
    
    // 贊時不用 cell reuse ，讓 OS 自行處理 Cell 的記憶體（使用上面的 cell reuse 測試後，發現記憶體會莫名上升）
    TableViewCell_SeparateCell *cell = [[TableViewCell_SeparateCell alloc] init];
    
    // 設置
    [cell setupCell:_worldBossArray[indexPath.row] withType:EnumSeparatorTableViewCell_WorldBoss];
    if ( indexPath.row == 0 ) {
        [cell isFirstCell];
    }
    if ( _recentSelectIndex == indexPath.row &&
         _recentSelectIndex != NSNotFound ) {
        [cell setIsSelectCell:YES withAnimation:NO];
    }
    
    return cell;
}

@end
