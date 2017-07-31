//
//  ViewControllerTabBar.m
//  GW2BroH
//
//  Created by CoodyChou on 2015/5/29.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "ViewControllerTabBar.h"

// for ViewController
/* startMenu ViewController */
#import "ViewControllerStartMenu.h"
/* Other ViewControllers */
#import "NavigationControllerWorldBoss.h"
#import "ViewControllerItems.h"
#import "ViewControllerDungeons.h"
#import "ViewControllerGuild.h"
#import "ViewControllerMore.h"

// for constants
#import "Constants.h"

@interface ViewControllerTabBar () <UITabBarControllerDelegate>
{
    NSArray *_startMenuArray;
    NSArray *_otherVCArray;
    
    BOOL _isChangeIndex;
}

@end

@implementation ViewControllerTabBar

-(id)init{
    self = [super init];
    if ( self != nil ) {
        self.delegate = self;
        _startMenuArray = @[([[ViewControllerStartMenu alloc] init])];
        _otherVCArray = @[([[NavigationControllerWorldBoss alloc] init]),
                          ([[ViewControllerItems alloc] init]),
                          ([[ViewControllerDungeons alloc] init]),
                          ([[ViewControllerGuild alloc] init]),
                          ([[ViewControllerMore alloc] init])
                          ];
        self.viewControllers = _startMenuArray;
        self.tabBar.hidden = YES;
        
        _isChangeIndex = NO;
        
        [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
        [[UITabBar appearance] setBarTintColor:VC_NAVIGATION_BAR_COLOR];
        
//        UIImage* anImage = [UIImage imageNamed:@"MyViewControllerImage.png"];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setSelectedIndex:(NSUInteger)selectedIndex{
    if ( _isChangeIndex == YES ) {
        return;
    }
    NSUInteger tempSelectedIndex = selectedIndex;
    switch (tempSelectedIndex) {
        case EnumTabBarIndexStartMenu:
        {
            _isChangeIndex = YES;
            self.viewControllers = _startMenuArray;
            self.tabBar.hidden = YES;
//            self.navigationController.navigationBarHidden = YES;
            [super setSelectedIndex:tempSelectedIndex];
        }
            break;
        case EnumTabBarIndexWorldBoss:
        {
            _isChangeIndex = YES;
            self.viewControllers = _otherVCArray;
            self.tabBar.hidden = NO;
            tempSelectedIndex = tempSelectedIndex - 10;
//            self.navigationController.navigationBarHidden = NO;
            [super setSelectedIndex:tempSelectedIndex];
        }
            break;
        default:
            break;
    }
    _isChangeIndex = NO;
}


@end
