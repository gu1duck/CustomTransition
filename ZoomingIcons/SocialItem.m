//
//  SocialItem.m
//  ZoomingIcons
//
//  Created by Jeremy Petter on 2015-06-11.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "SocialItem.h"

@implementation SocialItem

+ (instancetype)socialItemWithName:(NSString*)name summary:(NSString*)summary color:(UIColor*)color andIcon:(UIImage*)icon{
    SocialItem* socialItem = [[SocialItem alloc] init];
     [socialItem setupWithName:name summary:summary color:color andIcon:icon];
    return socialItem;

}

- (SocialItem*)setupWithName:(NSString*)name summary:(NSString*)summary color:(UIColor*)color andIcon:(UIImage*)icon{
    self.name = name;
    self.summary = summary;
    self.color = color;
    self.icon = icon;
    return self;
}

@end
