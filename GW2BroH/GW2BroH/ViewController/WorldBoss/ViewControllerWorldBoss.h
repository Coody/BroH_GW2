//
//  ViewControllerWorldBoss.h
//  GW2BroH
//
//  Created by CoodyChou on 2015/5/31.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const K_WORLDBOSS_VERSION_KEY;
extern NSString *const K_WORLDBOSS_DATA_KEY;

@interface ViewControllerWorldBoss : UIViewController
@property (nonatomic , strong) NSMutableDictionary *worldBossPlistDic;
-(void)reloadData;
@end
