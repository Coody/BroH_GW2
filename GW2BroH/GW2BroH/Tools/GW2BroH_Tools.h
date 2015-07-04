//
//  Tools.h
//  GW2BroH
//
//  Created by CoodyChou on 2015/5/29.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FRAME_SIZE(TEXT,FONT) [(TEXT) boundingRectWithSize: CGSizeMake( CGFLOAT_MAX, CGFLOAT_MAX) options: NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: FONT} context: nil].size

@interface GW2BroH_Tools : NSObject

@end
