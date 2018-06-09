//
//  PageTopBarView.m
//  network_AFN
//
//  Created by tybbt on 2018/6/5.
//  Copyright © 2018年 123 . All rights reserved.
//

#import "PageTopBarView.h"
#import "PageCollectionCell.h"
#import "Author/AnimateAuthor.h"


@interface PageTopBarView() <UICollectionViewDelegate, UICollectionViewDataSource>
{
    UICollectionView *_collectionView;
    CGFloat _originalCenterX;
    CGFloat _originalCenterY;
}
@property (nonatomic, strong) UIView * leftView;
@property (nonatomic, strong) UIView * rightView;
@property (nonatomic, strong) UIView * AnimateLine;

@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, copy) NSMutableArray<NSString *> * dataSource;
@property (nonatomic, strong) AnimateAuthor * author;

@end

@implementation PageTopBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUIWithBounds:self.bounds];
    }
    return self;
}

- (void)createUIWithBounds: (CGRect)bounds
{
    self.currentIndex = 0;
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(80, 50);
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;
    layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, bounds.size.width - CGRectGetWidth(self.leftView.frame) - CGRectGetWidth(self.rightView.frame), 60) collectionViewLayout:layout];
    _collectionView.center = CGPointMake(CGRectGetWidth(bounds)/2, (CGRectGetHeight(bounds)+StatusBarHeight)/2);
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.alwaysBounceHorizontal = YES;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundColor = self.backgroundColor;
    [self addSubview:_collectionView];
}

- (NSMutableArray<NSString *> *)dataSource
{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] initWithCapacity:3];
    }
    return _dataSource;
}

- (UIView *)AnimateLine
{
    if (!_AnimateLine && self.dataSource.count > 0) {
        _AnimateLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 70, 8)];
        _AnimateLine.backgroundColor = [UIColor lightGrayColor];
        _AnimateLine.layer.cornerRadius = 4;
        _AnimateLine.layer.masksToBounds = YES;
    }
    return _AnimateLine;
}

- (AnimateAuthor *)author
{
    if (!_author) {
        _author = [[AnimateAuthor alloc] initWithAnimateViewFrame:self.AnimateLine.frame];
    }
    return _author;
}

- (void)setInfo: (NSArray<NSString *> *)data
{
    [self.dataSource removeAllObjects];
    [self.dataSource addObjectsFromArray:data];
    
    [_collectionView reloadData];
    [self initAnimateLineLocation];
    
}

- (void)initAnimateLineLocation
{
    [self addSubview:self.AnimateLine];
    [self movingLineToCollectionViewBottomAtLocation:0 animated:NO];
}

- (UIView *)leftView
{
    if (!_leftView) {
        _leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    }
    return _leftView;
}

- (UIView *)rightView
{
    if (!_rightView) {
        _rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
        _rightView.center = CGPointMake(CGRectGetWidth(self.frame) - 30, CGRectGetHeight(self.frame)-30);
    }
    return _rightView;
}

#pragma mark -UICollectionView Delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    _currentIndex = indexPath.row;
    //NSLog(@"select at index %ld",_currentIndex);
    if (self.delegate && [_delegate respondsToSelector:@selector(clickViewControllerNameAtIndex:)]) {
        [self movingLineToCollectionViewBottomAtLocation:_currentIndex animated:YES];
        [_delegate clickViewControllerNameAtIndex:_currentIndex];
    }
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"deselect for index %ld",indexPath.row);
}

#pragma mark -UICollectionView DataSource
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"PageCollectionCell";
    Class clazz = NSClassFromString(cellIdentifier);
    [collectionView registerClass:clazz forCellWithReuseIdentifier:cellIdentifier];
    PageCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell setInfo: self.dataSource[indexPath.row]];
    
    CGRect convertInSelf = [collectionView convertRect:cell.frame toView:self];
    CGFloat x = convertInSelf.origin.x + convertInSelf.size.width/2;
    CGFloat y = convertInSelf.origin.y + convertInSelf.size.height + self.AnimateLine.frame.size.height/2;
    
    CGPoint centerLocation = CGPointMake(x, y);
    [self.author addAuthorCenter:centerLocation atIndex:indexPath.row];
    
    if (indexPath.row == 0) {
        cell.selected = YES;
        [self initAnimateLineLocation];
    }
    return cell;
}


#pragma mark -AnimateLine animation
- (void)movingLineToCollectionViewBottomAtLocation: (NSInteger)pageIdx animated: (Boolean)animated
{
    CGRect rect = [self.author getAuthorCenterAtIndex:pageIdx];
    if (CGRectIsEmpty(rect)) {
        NSLog(@"CGrectzero - can't animate rect while zero");
        return;
    }
    if (!animated) {
        self.AnimateLine.frame = rect;
        return;
    }
    [UIView animateWithDuration:0.5 animations:^{
        self.AnimateLine.frame = rect;
    }];
    [self updateSelectCellToIndex:pageIdx];
}

- (void)updateSelectCellToIndex: (NSInteger)index
{
    NSInteger i = 0;
    for (UICollectionViewCell * cell in _collectionView.visibleCells) {
        if (cell.selected && index!=i) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [cell setSelected:NO];
            });
        }
        if (index == i) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [cell setSelected:YES];
            });
        }
        i++;
    }
}


@end

