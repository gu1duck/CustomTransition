//
//  socialCell.h
//  ZoomingIcons
//
//  Created by Jeremy Petter on 2015-06-11.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocialItem.h"


@interface SocialCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (SocialCell*)setupWithSocialtem:(SocialItem*)socialItem;

@end
