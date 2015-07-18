//
//  Constants.h
//  GW2BroH
//
//  Created by CoodyChou on 2015/5/31.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#ifndef GW2BroH_Constants_h
#define GW2BroH_Constants_h

typedef enum : NSInteger{
    EnumTabBarIndexStartMenu = 0,
    EnumTabBarIndexWorldBoss = 10,
    EnumTabBarIndexItems = 11,
    EnumTabBarIndexDungeons = 12,
    EnumTabBarIndexGuild = 13,
    EnumTabBarIndexMore = 14
}EnumTabBarIndex;

#define VC_START_MENU_BACKGROUND_COLOR [UIColor colorWithRed:0.36 green:0.47 blue:0.66 alpha:1.0f]
#define VC_OTHERS_BACKGROUND_COLOR [UIColor colorWithRed:0.63f green:0.76f blue:0.91f alpha:1.0f]

#define FRAME_SIZE(TEXT,FONT) [(TEXT) boundingRectWithSize: CGSizeMake( CGFLOAT_MAX, CGFLOAT_MAX) options: NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: FONT} context: nil].size

#endif
