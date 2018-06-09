//
//  AnimateAuthor.h
//  network_AFN
//
//  Created by tybbt on 2018/6/6.
//  Copyright © 2018年 123 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AnimateAuthor : NSObject

- (instancetype)initWithAnimateViewFrame: (CGRect)bounds;

- (void)addAuthorCenter: (CGPoint)center atIndex: (NSInteger)key;
- (CGRect)getAuthorCenterAtIndex: (NSInteger)key;

- (void)addAuthorFrame: (CGRect)frame atIndex: (NSInteger)key;
- (CGRect)getAuthorFrameAtIndex: (NSInteger)key;

@end
