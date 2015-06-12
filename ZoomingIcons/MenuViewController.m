//
//  MenuViewController.m
//  ZoomingIcons
//
//  Created by Jeremy Petter on 2015-06-11.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "MenuViewController.h"
#import "SocialCell.h"
#import "SocialItem.h"
#import "DetailViewController.h"

@interface MenuViewController () <UICollectionViewDelegateFlowLayout>

@property (nonatomic) NSArray* socialItems;

extern float const kDesiredPadding;
extern float const kCellSize;

@end

@implementation MenuViewController

float const kDesiredPadding = 20;
float const kCellSize = 100;

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.contentInset = UIEdgeInsetsMake(100.0, 0, 0, 0);
    
    self.socialItems = @[
                          [SocialItem socialItemWithName:@"Twitter"
                                                 summary:@"Twitter is an online social networking service that enables users to send and read short 140-character messages called \"tweets\"."
                                                   color: [UIColor colorWithRed:0.255
                                                                          green: 0.557
                                                                           blue: 0.910
                                                                          alpha:1.0]
                                                 andIcon: [UIImage imageNamed:@"icon-twitter"] ],
                          [SocialItem socialItemWithName:@"Facebook"
                                                 summary:@"Facebook (formerly thefacebook) is an online social networking service headquartered in Menlo Park, California. Its name comes from a colloquialism for the directory given to students at some American universities."
                                                   color: [UIColor colorWithRed:0.239
                                                                         green: 0.353
                                                                          blue: 0.588
                                                                         alpha: 1.0]
                                                 andIcon: [UIImage imageNamed:@"icon-facebook"] ],
                          [SocialItem socialItemWithName:@"Youtube"
                                                 summary:@"YouTube is a video-sharing website headquartered in San Bruno, California. The service was created by three former PayPal employees in February 2005 and has been owned by Google since late 2006. The site allows users to upload, view, and share videos."
                                                   color: [UIColor colorWithRed: 0.729
                                                                          green: 0.188
                                                                           blue: 0.180
                                                                          alpha: 1.0]
                                                 andIcon:[UIImage imageNamed:@"icon-youtube"] ],
                          [SocialItem socialItemWithName:@"Vimeo"
                                                 summary:@"Vimeo is a U.S.-based video-sharing website on which users can upload, share and view videos. Vimeo was founded in November 2004 by Jake Lodwick and Zach Klein."
                                                   color: [UIColor colorWithRed:0.329
                                                                         green: 0.737
                                                                          blue: 0.988
                                                                         alpha: 1.0]
                                                 andIcon: [UIImage imageNamed:@"icon-vimeo"] ],
                          [SocialItem socialItemWithName:@"Instagram"
                                                 summary:@"Instagram is an online mobile photo-sharing, video-sharing and social networking service that enables its users to take pictures and videos, and share them on a variety of social networking platforms, such as Facebook, Twitter, Tumblr and Flickr."
                                                   color: [UIColor colorWithRed:0.325
                                                                         green: 0.498
                                                                          blue: 0.635
                                                                         alpha: 1.0]
                                                 andIcon: [UIImage imageNamed:@"icon-instagram"] ],
                         
                         ];
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    int numberOfCells = (int)[self collectionView:self.collectionView numberOfItemsInSection:section];
    int totalCellWidth = numberOfCells * kCellSize;
    int totalPaddingSpace = (numberOfCells - 1) * kDesiredPadding;
    
    float totalMarginWidth = self.collectionView.frame.size.width - (totalCellWidth + totalPaddingSpace);
    
    return UIEdgeInsetsMake(kDesiredPadding, totalMarginWidth/2, 0, totalMarginWidth/2);
    //return UIEdgeInsetsZero;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return (section == 0) ? 2 : 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SocialCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"socialCell" forIndexPath:indexPath];
        // Configure the cell
    [cell setupWithSocialtem: [self socialItemForIndexPath:indexPath] ];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100.0, 100.0);
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"detailView"];
    detailViewController.socialItem = [self socialItemForIndexPath:indexPath];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}

-(SocialItem*)socialItemForIndexPath: (NSIndexPath *)indexPath{
    if (indexPath.section == 0){
        return self.socialItems[indexPath.row];
    }
        int totalItems = 0;
        for (int i =0; i < indexPath.section; i++){
            totalItems += [self.collectionView numberOfItemsInSection:i];
        }
    return self.socialItems[indexPath.row+totalItems];

}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectinView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
