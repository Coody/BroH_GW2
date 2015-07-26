//
//  ViewControllerWorldBoss.m
//  GW2BroH
//
//  Created by CoodyChou on 2015/5/31.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "ViewControllerWorldBoss.h"
#import "UINavigationController+Title.h"

// for view
#import "ViewWorldBoss.h"

// for tools
#import "Constants.h"
#import "GW2BroH_Tools.h"

// for Model
#import "WorldBossModel.h"

// TODO:多國語系
#define D_String_WorldBoss @"世界王時間"

@interface ViewControllerWorldBoss ()

@property (nonatomic , strong) ViewWorldBoss *worldBossView;

@end

@implementation ViewControllerWorldBoss

-(id)init{
    self = [super init];
    if ( self ) {
        [self.view setFrame:[UIScreen mainScreen].bounds];
        [self.view setBackgroundColor:VC_OTHERS_BACKGROUND_COLOR];

        
        UIImage *tabBarImage = [GW2BroH_Tools getImageWithClass:self withImageName:@"Boss"];
        UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"World Boss"
                                                              image:tabBarImage
                                                      selectedImage:tabBarImage];
        self.tabBarItem = theItem;
        
        self.navigationBar.barTintColor = VC_NAVIGATION_BAR_COLOR;
        
        [self setTitleWithString:D_String_WorldBoss];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self createWorldBossView];
    
#define CoodyTest
#ifdef CoodyTest
    NSMutableArray *testArray = [NSMutableArray array];
    for ( int i = 0 ; i < 10 ; i++ ) {
        WorldBossModel *tempModel = [[WorldBossModel alloc] init];
        tempModel.bossName = @"屍龍";
        tempModel.bossImageName = @"teq";
        tempModel.brief = @"位在 ooxx 的地圖位置。\n點擊看詳細訊息....";
        tempModel.details = @"打法：請疊在屍龍腳底下，技能請帶反射牆、堅定、減傷。";
        [testArray addObject:tempModel];
    }
#endif
    [_worldBossView addWorldBossWithArray:testArray];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - initial
-(void)createWorldBossView
{
    if ( _worldBossView == nil ) {
        _worldBossView = [[ViewWorldBoss alloc] init];
    }
    
    [self.view addSubview:_worldBossView];
}

@end
