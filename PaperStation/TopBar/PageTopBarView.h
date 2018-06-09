//
//  PageTopBarView.h
//  network_AFN
//
//  Created by tybbt on 2018/6/5.
//  Copyright © 2018年 123 . All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PageTopBarViewDelegate <NSObject>
- (void)clickViewControllerNameAtIndex: (NSInteger)index;
@end


@interface PageTopBarView : UIView

@property (nonatomic, weak) id<PageTopBarViewDelegate> delegate;
- (void)setInfo: (NSArray<NSString *> *)data;
- (void)movingLineToCollectionViewBottomAtLocation: (NSInteger)pageIdx animated: (Boolean)animated;
@end
