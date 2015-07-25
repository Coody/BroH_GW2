//
//  Tools.m
//  GW2BroH
//
//  Created by CoodyChou on 2015/5/29.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import "GW2BroH_Tools.h"

#import <UIKit/UIKit.h>

@implementation GW2BroH_Tools

+(NSString *)getPathWithClass:(id)tempClass withImageName:(NSString *)tempImageName
{
    return [NSString stringWithFormat:@"%@/Images/%@/%@",[NSBundle mainBundle].resourcePath,NSStringFromClass([tempClass class]),tempImageName];
}

+(UIImage *)getImageWithClass:(id)tempClass withImageName:(NSString *)tempImageName
{
    return [[UIImage alloc] initWithContentsOfFile:[GW2BroH_Tools getPathWithClass:tempClass withImageName:tempImageName]];
}


+(NSString *)getPathWithString:(NSString*)tempString withImageName:(NSString *)tempImageName
{
    return [NSString stringWithFormat:@"%@/Images/%@/%@",[NSBundle mainBundle].resourcePath,tempString,tempImageName];
}

+(UIImage *)getImageWithString:(NSString*)tempString withImageName:(NSString *)tempImageName
{
    return [[UIImage alloc] initWithContentsOfFile:[GW2BroH_Tools getPathWithString:tempString withImageName:tempImageName]];
}


+(float) statusBarHeight
{
    CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
    return MIN(statusBarSize.width, statusBarSize.height);
}

@end
