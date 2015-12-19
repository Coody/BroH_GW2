//
//  WorldBossModel.h
//  GW2BroH
//
//  Created by CoodyChou on 2015/7/25.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorldBossModel : NSObject

@property (nonatomic , strong) NSString *bossImageName;
@property (nonatomic , strong) NSString *bossName;
@property (nonatomic , strong) NSString *brief;
@property (nonatomic , strong) NSString *details;
@property (nonatomic , strong) NSNumber *startTime;
@property (nonatomic , strong) NSNumber *endTime;

@end
