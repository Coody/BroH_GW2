//
//  NavigationControllerWorldBoss.m
//  GW2BroH
//
//  Created by Coody on 2017/7/31.
//  Copyright © 2017年 CoodyChou. All rights reserved.
//

#import "NavigationControllerWorldBoss.h"

// for ViewController
#import "ViewControllerWorldBoss.h"

// for Tools
#import "GW2BroH_Tools.h"
#import "Constants.h"

// TODO:多國語系
#define D_String_Boss @"世界王"

@interface NavigationControllerWorldBoss ()<UIGestureRecognizerDelegate>

@end

@implementation NavigationControllerWorldBoss

-(instancetype)init{
    self = [super init];
    if( self ){
        UIImage *tabBarImage = [GW2BroH_Tools getImageWithClass:self withImageName:@"Boss"];
        UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:D_String_Boss
                                                              image:tabBarImage
                                                      selectedImage:tabBarImage];
        self.tabBarItem = theItem;
        
        self.navigationBar.barTintColor = VC_NAVIGATION_BAR_COLOR;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 設定手勢滑動代理
    self.interactivePopGestureRecognizer.delegate = self;
    [self pushViewController:[ViewControllerWorldBoss new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return NO;
}

@end
