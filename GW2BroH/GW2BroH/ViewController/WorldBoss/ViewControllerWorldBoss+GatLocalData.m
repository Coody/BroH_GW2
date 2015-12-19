//
//  ViewControllerWorldBoss+GatLocalData.m
//  GW2BroH
//
//  Created by CoodyChou on 2015/12/19.
//  Copyright © 2015年 CoodyChou. All rights reserved.
//

#import "ViewControllerWorldBoss+GatLocalData.h"

// for Model
#import "WorldBossModel.h"

@implementation ViewControllerWorldBoss (GatLocalData)

-(void)startGetLocalPlist{
    NSString *localWorldBossPlistPath = [[NSBundle mainBundle] pathForResource:@"WorldBoss" ofType:@"plist"];
    NSDictionary *newWorldBossPlistDic = [[NSMutableDictionary alloc] initWithContentsOfFile:localWorldBossPlistPath];
    [self checkWorldBossPlistWithLocalDic:newWorldBossPlistDic];
    
    [self reloadData];
}

-(void)checkWorldBossPlistWithLocalDic:(NSDictionary *)tempLocalWorldBossDic{
    // TODO: check version
    
    // TODO: 不一樣，下載，並覆蓋
    
    // TODO: 一樣，直接覆蓋掉記憶體的。
    [self.worldBossPlistDic removeAllObjects];
    for ( NSDictionary *unit in [tempLocalWorldBossDic objectForKey:K_WORLDBOSS_DATA_KEY] ) {
        WorldBossModel *model = [[WorldBossModel alloc] init];
        [model setValuesForKeysWithDictionary:unit];
        [self.worldBossPlistDic setObject:model forKey:model.bossName];
    }
}

@end
