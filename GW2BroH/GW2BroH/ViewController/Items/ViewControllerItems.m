//
//  ViewControllerItems.m
//  GW2BroH
//
//  Created by CoodyChou on 2015/5/31.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "ViewControllerItems.h"
#import "UINavigationController+Title.h"

// for tools
#import "Constants.h"
#import "GW2BroH_Tools.h"

//TODO: 多國語系
#define D_String_Items_Title @"Gem & 物品"
#define D_String_TP @"拍賣場"

@interface ViewControllerItems ()

@end

@implementation ViewControllerItems

-(id)init{
    self = [super init];
    if ( self ) {
        [self.view setFrame:[UIScreen mainScreen].bounds];
        [self.view setBackgroundColor:VC_OTHERS_BACKGROUND_COLOR];
        
        //        UIImage* anImage = [UIImage imageNamed:@"MyViewControllerImage.png"];
        //        UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"Home" image:anImage tag:0];
        
        UIImage *tabBarImage = [GW2BroH_Tools getImageWithClass:self withImageName:@"tp"];
        UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:D_String_TP
                                                              image:tabBarImage
                                                      selectedImage:tabBarImage];
        self.tabBarItem = theItem;
        
        self.navigationBar.barTintColor = VC_NAVIGATION_BAR_COLOR;
        
        [self setTitleWithString:D_String_Items_Title];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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

#pragma mark - 內部方法

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
