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

@interface ViewControllerStartMenu ()

@property (nonatomic , strong) UILabel *brohLabel;
@property (nonatomic , strong) UIButton *memberBtn;

@end

@implementation ViewControllerStartMenu

#pragma mark - view 初始
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    CGRect recentSize = [UIScreen mainScreen].bounds;
    
    [self.view setFrame:CGRectMake(0,
                                   0,
                                   recentSize.size.width,
                                   recentSize.size.height)];
    // 下載目前成員名單
    [self dnloadMemberList];
    
    // 初始化 background view
    [self createBackgroundView];

    // 初始化 button
    [self createBtn];
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
-(void)dnloadMemberList{
    // TODO: 思考要怎麼下載比較有效率？直接下載？還是用 parse？
    
    
}

-(void)createBackgroundView{
    CGSize tempLabelSize = FRAME_SIZE(@"BroH", [UIFont fontWithName:@"HelveticaNeue-Bold" size:68]);
    [self.view setBackgroundColor:[UIColor colorWithRed:0.36 green:0.47 blue:0.66 alpha:1.0f]];
    _brohLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - tempLabelSize.width)*0.5 ,
                                                           200,
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
        [_memberBtn setFrame:CGRectMake(_brohLabel.frame.origin.x + _brohLabel.frame.size.width - 150 ,
                                        _brohLabel.frame.origin.y + _brohLabel.frame.size.height + 5,
                                        150, 30)];
        [_memberBtn setTitle:@"公會成員按此" forState:(UIControlStateNormal)];
        [_memberBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_memberBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]];
        [_memberBtn setBackgroundColor:[UIColor clearColor]];
        _memberBtn.layer.borderColor=[UIColor whiteColor].CGColor;
        _memberBtn.layer.borderWidth=2.0f;
        _memberBtn.layer.masksToBounds = YES;
        _memberBtn.layer.cornerRadius = 10.0f;
        [_memberBtn addTarget:self action:@selector(pressedCheckMemberBtn) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_memberBtn];
    }
}

#pragma mark - Button 觸發方法

-(void)pressedCheckMemberBtn{
    // TODO: check 本地端的 member list
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
