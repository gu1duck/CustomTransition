//
//  SocialItem.h
//  ZoomingIcons
//
//  Created by Jeremy Petter on 2015-06-11.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SocialItem : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic) NSString* summary;
@property (nonatomic) UIColor* color;
@property (nonatomic) UIImage* icon;

+ (instancetype)socialItemWithName:(NSString*)name summary:(NSString*)summary color:(UIColor*)color andIcon:(UIImage*)icon;

@end
