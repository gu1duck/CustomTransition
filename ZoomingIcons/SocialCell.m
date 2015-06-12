//
//  socialCell.m
//  ZoomingIcons
//
//  Created by Jeremy Petter on 2015-06-11.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "SocialCell.h"

@implementation SocialCell

-(void)layoutSubviews{
    [super layoutSubviews];
    self.topView.layer.cornerRadius = self.topView.frame.size.width/2;
    self.topView.layer.masksToBounds = YES;
}


- (SocialCell*)setupWithSocialtem:(SocialItem*)socialItem{
    self.topView.backgroundColor = socialItem.color;
    self.imageView.image = socialItem.icon;
    return self;
}

@end
