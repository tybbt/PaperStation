//
//  PageCollectionCell.h
//  network_AFN
//
//  Created by tybbt on 2018/6/5.
//  Copyright © 2018年 123 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageCollectionCell : UICollectionViewCell
@property (nonatomic, assign) Boolean isSelected;

- (void)setInfo: (NSString *)title;
@end
