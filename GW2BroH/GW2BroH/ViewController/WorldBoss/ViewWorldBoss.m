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

#pragma mark -
@interface ViewWorldBoss()

@property (nonatomic , strong) UITableView *worldBossTableView;

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
                                  [GW2BroH_Tools statusBarHeight],
                                  tempFrame.size.width,
                                  tempFrame.size.height - statusHight - 50 )];
        [self setBackgroundColor:VC_OTHERS_BACKGROUND_COLOR];
        
        [self createWorldBossTableView];
    }
    return self;
}

#pragma mark - initial ui 元件
- (void)createWorldBossTableView
{
    if ( _worldBossTableView == nil ) {
        float statesBarHight = [GW2BroH_Tools statusBarHeight];
        _worldBossTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, self.frame.size.width, self.frame.size.height)];
        [_worldBossTableView setBackgroundColor:[UIColor clearColor]];
        [_worldBossTableView setSeparatorStyle:(UITableViewCellSeparatorStyleSingleLine)];
    }
    [_worldBossTableView setHidden:NO];
//    [_worldBossTableView setBackgroundColor:[UIColor grayColor]];
//    [_worldBossTableView setAlpha:0.6f];
    
    [self addSubview:_worldBossTableView];
}

@end
