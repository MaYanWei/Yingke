//
//  HttpMacro.h
//  Yingke
//
//  Created by mayw on 2016/11/7.
//  Copyright © 2016年 mayw. All rights reserved.
//

#ifndef HttpMacro_h
#define HttpMacro_h

#define kBaseRequestURL              @""

#define kAvatarURL                   @"http://img.meelive.cn"
#define kScaleImageURL               @"http://image.scale.inke.com/imageproxy2/dimgm/scaleImage?url="
#define kFullImageURL(url)           ([url hasPrefix:@"http"] ? (url) : ([NSString stringWithFormat:@"%@/%@", kAvatarURL, url]))

#define kScaleAvatarImage(url, w, h) [NSString stringWithFormat:@"%@%@&w=%.f&h=%.f", kScaleImageURL, kFullImageURL(url), 2 * w, 2 * h]
#define kScaleCoverImage(url, w, h)  [NSString stringWithFormat:@"%@%@&w=%.f&s=80&h=%.f&c=0&o=0", kScaleImageURL, kFullImageURL(url), 2 * w, 2 * h]

#endif /* HttpMacro_h */
