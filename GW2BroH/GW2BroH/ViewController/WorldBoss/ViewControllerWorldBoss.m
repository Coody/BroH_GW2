//
//  ViewControllerWorldBoss.m
//  GW2BroH
//
//  Created by CoodyChou on 2015/5/31.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "ViewControllerWorldBoss.h"

// for view
#import "ViewWorldBoss.h"

// for tools
#import "Constants.h"
#import "GW2BroH_Tools.h"

// for Model
#import "WorldBossModel.h"

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

//        self.navigationBarHidden = YES;
        self.navigationBar.barTintColor = VC_NAVIGATION_BAR_COLOR;
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
    WorldBossModel *temp = [[WorldBossModel alloc] init];
    WorldBossModel *temp2 = [[WorldBossModel alloc] init];
#endif
    [_worldBossView addWorldBossWithArray:@[temp,temp2]];
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
