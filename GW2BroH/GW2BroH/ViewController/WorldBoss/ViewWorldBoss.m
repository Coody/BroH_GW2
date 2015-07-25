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

#pragma mark -
@interface ViewWorldBoss() < UITableViewDataSource,
                             UITableViewDelegate >

@property (nonatomic , strong) UILabel *noDataLabel;
@property (nonatomic , strong) UITableView *worldBossTableView;
@property (nonatomic , strong) NSMutableArray *worldBossArray;

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
                                  [GW2BroH_Tools statusBarHeight] + 44,
                                  tempFrame.size.width,
                                  tempFrame.size.height - statusHight - 50 - 44 )];
        [self setBackgroundColor:VC_OTHERS_BACKGROUND_COLOR];
        
        _worldBossArray = [[NSMutableArray alloc] init];
        
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
        [_noDataLabel setText:@"目前沒有任何世界王！\n\n請確認網路狀態、\n\n或是重新開啟 App！" ];
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
    if ( [tempWorldBossArray count] <= 0 ) {
        [self hideTableView:YES];
    }
    else{
        [self hideTableView:NO];
        [_worldBossArray removeAllObjects];
        [_worldBossArray addObjectsFromArray:tempWorldBossArray];
        [_worldBossTableView reloadData];
    }
}

#pragma mark - 內部方法
-(void)hideTableView:(BOOL)isHidden{
    [_worldBossTableView setHidden:isHidden];
    [_noDataLabel setHidden:!isHidden];
}

#pragma mark - UITableView Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return D_CellHight_Normal;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - UITableView Data Source Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_worldBossArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 設定 Cell 的識別符號
    static NSString *worldBossCell = @"WorldBossCell";
    
    // 從 TableView 中取用是別的 Cell 來 reuse
    TableViewCell_SeparateCell *cell = [tableView dequeueReusableCellWithIdentifier:worldBossCell];
    if ( cell == nil ) {
        cell = [[TableViewCell_SeparateCell alloc] init];
    }
    
    // 設置
    [cell setupCell:_worldBossArray[indexPath.row] withType:EnumSeparatorTableViewCell_WorldBoss];
    
    if ( indexPath.row == 0 ) {
        [cell isFirstCell];
    }
    
    return cell;
}

@end
