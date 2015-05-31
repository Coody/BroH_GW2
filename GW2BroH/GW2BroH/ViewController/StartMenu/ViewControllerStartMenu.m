//
//  ViewControllerStartMenu.m
//  GW2BroH
//
//  Created by CoodyChou on 2015/5/29.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "ViewControllerStartMenu.h"

// for Tools
#import "GW2BroH_Tools.h"
#import "Constants.h"

@interface ViewControllerStartMenu ()
{
    BOOL _isDownloadComplete;
}

@property (nonatomic , strong) UILabel *brohLabel;
@property (nonatomic , strong) UIButton *memberBtn;

@end

@implementation ViewControllerStartMenu

#pragma mark - view 初始
- (void)viewDidLoad {
    [super viewDidLoad];
    _isDownloadComplete = NO;
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    CGRect recentSize = [UIScreen mainScreen].bounds;
    
    [self.view setFrame:CGRectMake(0,
                                   0,
                                   recentSize.size.width,
                                   recentSize.size.height)];
    
    // 處理點擊主要 view & Tap gester
    [self handleSingleTapGesture];
    
    // 下載目前成員名單
    [self dnloadMemberList];
    
    // 初始化 background view
    [self createBackgroundView];

    // 初始化 button
    [self createBtn];
    
    // 如果確認你是 BroH 的公會成員，會直接進入，不用按 Button
//    [self checkIsMember];
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
/** 處理 Single Tap */
-(void)handleSingleTapGesture{
    UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                          action:@selector(singleTap:)];
    [self.view addGestureRecognizer:singleTapRecognizer];
    
}

/** 進入時就要處理 broh members 清單 */
-(void)dnloadMemberList{
    // TODO: 思考要怎麼下載比較有效率？直接下載？還是用 parse？
    
    
}

-(void)createBackgroundView{
    CGSize tempLabelSize = FRAME_SIZE(@"BroH", [UIFont fontWithName:@"HelveticaNeue-Bold" size:68]);
    [self.view setBackgroundColor:VC_START_MENU_BACKGROUND_COLOR];
    _brohLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - tempLabelSize.width)*0.5 ,
                                                           (self.view.frame.size.height * 0.5 - tempLabelSize.height),
                                                           tempLabelSize.width,
                                                           tempLabelSize.height)];
    [_brohLabel setTextColor:[UIColor whiteColor]];
    [_brohLabel setTextAlignment:(NSTextAlignmentCenter)];
    [_brohLabel setText:@"BroH"];
    [_brohLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:68]];
    [self.view addSubview:_brohLabel];
}

-(void)createBtn{
    if ( _memberBtn == nil ) {
        _memberBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
        [_memberBtn setFrame:CGRectMake(_brohLabel.frame.origin.x ,
                                        _brohLabel.frame.origin.y + _brohLabel.frame.size.height + 5,
                                        _brohLabel.frame.size.width,
                                        30)];
        [_memberBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_memberBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
        [_memberBtn setBackgroundColor:[UIColor clearColor]];
        _memberBtn.layer.borderColor=[UIColor whiteColor].CGColor;
        _memberBtn.layer.borderWidth=2.0f;
        _memberBtn.layer.masksToBounds = YES;
        _memberBtn.layer.cornerRadius = 10.0f;
        [_memberBtn addTarget:self action:@selector(pressedCheckMemberBtn) forControlEvents:UIControlEventTouchUpInside];
        [self setMemberBtnEnable:NO];
        
        [self.view addSubview:_memberBtn];
        
        
        if ( _isDownloadComplete == YES ) {
            [self setMemberBtnEnable:YES];
        }
    }
}

-(void)checkIsMember{
    // 比對本地端存的成員帳號名稱是否為公會成員
    // 如果是，直接跳畫面
    
    if ( YES ) {
        [self singleTap:nil];
    }
}

/** Member 按鈕是否打開？ */
-(void)setMemberBtnEnable:(BOOL)isEnable{
    if ( isEnable == YES ) {
        [_memberBtn setTitle:@"公會成員按此" forState:(UIControlStateNormal)];
        [_memberBtn setEnabled:YES];
    }
    else{
        [_memberBtn setTitle:@"讀取中..." forState:(UIControlStateNormal)];
        [_memberBtn setEnabled:NO];
    }
}

#pragma mark - Button 觸發方法

-(void)pressedCheckMemberBtn{
    // TODO: check 本地端的 member list
}

#pragma mark - Single Tap Gesture
-(void)singleTap:(UITapGestureRecognizer *)recognizer {
    // TODO: 進入下個畫面
    NSLog(@"Tap!");
    [self.tabBarController setSelectedIndex:EnumTabBarIndexWorldBoss];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
