//
//  PaperViewController.m
//  network_AFN
//
//  Created by tybbt on 2018/6/2.
//  Copyright © 2018年 123 . All rights reserved.
//

#import "PaperViewController.h"
#import "PostPaperVC.h"
#import "GetPaperVC.h"
#import "DraftVC.h"
#import "PageTopBarView.h"

@interface PaperViewController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate,PageTopBarViewDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) PageTopBarView * topbarView;
@property (nonatomic, strong) UIPageViewController * pageController;
@property (nonatomic, weak) UIViewController * pendingViewController;
@property (nonatomic, copy) NSArray<UIViewController *> * childPageViewController;
@property (nonatomic, assign) NSInteger currentIdx;

@property (nonatomic, strong) UIScrollView * scrollView;
@end

@implementation PaperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentIdx = 0;
    [self createUI];
}

-(void)viewWillAppear:(BOOL)animated
{
    if (_topbarView) {
        [self.childPageViewController enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (_pendingViewController == obj) {
                _currentIdx = idx;
                *stop = YES;
                [self.topbarView movingLineToCollectionViewBottomAtLocation:_currentIdx animated:YES];
            }
            
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)createUI
{
    [self.navigationController setNavigationBarHidden:YES];
    [self addChildViewController:self.pageController];
    [self.pageController didMoveToParentViewController:self];
    [self.view addSubview:self.pageController.view];
    [self.view addSubview:self.topbarView];
    self.scrollView.delegate = self;
}

- (PageTopBarView *)topbarView
{
    if (!_topbarView) {
        _topbarView = [[PageTopBarView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, SafeTopBarHeight+StatusBarHeight)];
        _topbarView.backgroundColor = [UIColor whiteColor];
        _topbarView.delegate = self;
        [_topbarView setInfo:@[@"我发出的",@"收件箱",@"草稿箱"]];
    }
    return _topbarView;
}

- (UIPageViewController *)pageController
{
    if(!_pageController)
    {
        _pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        _pageController.view.frame = CGRectMake(0, SafeTopBarHeight+StatusBarHeight, ScreenWidth, ScreenHeight - SafeTopBarHeight-StatusBarHeight);
        _pageController.delegate = self;
        _pageController.dataSource = self;
        UIViewController * vc = self.childPageViewController[_currentIdx];
        [_pageController setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    }
    return _pageController;
}


- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        for (id obj in _pageController.view.subviews) {
            if ([obj isKindOfClass:[UIScrollView class]]) {
                _scrollView = obj;
            }
        }
    }
    return _scrollView;
}

- (NSArray<UIViewController *> *)childPageViewController
{
    if (!_childPageViewController) {
        _childPageViewController = @[ [PostPaperVC new] , [GetPaperVC new] , [DraftVC new] ];
    }
    return _childPageViewController;
}

#pragma mark -UIPageViewControllerDelegate
//跳转界面开始时触发，用于获取将要跳转到的控制器，@param pendingViewControllers 内部永远只有一个控制器
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers
{
    _pendingViewController = pendingViewControllers.firstObject;
}

//条状动画完成时触发，用于定位当前跳转到的页面供后续跳转初始跳转使用
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed
{
    if (completed) {
        [self.childPageViewController enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (_pendingViewController == obj) {
                _currentIdx = idx;
                *stop = YES;
                [self.topbarView movingLineToCollectionViewBottomAtLocation:_currentIdx animated:YES];
            }
            
        }];
    }
}

#pragma mark -UIPageViewControllerDataSource
//返回当前页面的上一个页面
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger beforeIdx = _currentIdx - 1;
    if (beforeIdx < 0) return nil;
    return self.childPageViewController[beforeIdx];
}
//返回当前页面的下一个页面
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger nextIdx = _currentIdx + 1;
    if (nextIdx >= self.childPageViewController.count) return nil;
    return self.childPageViewController[nextIdx];
}

#pragma mark -PageTopBarViewDelegate
- (void)clickViewControllerNameAtIndex:(NSInteger)index
{
    if (index > self.currentIdx) {
        UIViewController * vc = self.childPageViewController[index];
        [_pageController setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    }
    
    if (index < self.currentIdx) {
        UIViewController * vc = self.childPageViewController[index];
        [_pageController setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    }
    self.currentIdx = index;
}

#
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat currentOffset = offsetX - ScreenWidth;
    CGFloat x = fabs(currentOffset/ScreenWidth);
    NSLog(@"4 point num - %.4f",x);

   
}




@end
