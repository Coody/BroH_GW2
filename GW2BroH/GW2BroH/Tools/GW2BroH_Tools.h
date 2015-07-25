//
//  Tools.h
//  GW2BroH
//
//  Created by CoodyChou on 2015/5/29.
//  Copyright (c) 2015年 CoodyChou. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;

@interface GW2BroH_Tools : NSObject

+(NSString *)getPathWithClass:(id)tempClass withImageName:(NSString *)tempImageName;

+(UIImage *)getImageWithClass:(id)tempClass withImageName:(NSString *)tempImageName;

+(NSString *)getPathWithString:(NSString*)tempString withImageName:(NSString *)tempImageName;

+(UIImage *)getImageWithString:(NSString*)tempString withImageName:(NSString *)tempImageName;

+(float) statusBarHeight;

@end
