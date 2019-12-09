//
//  LLSliderController.m
//  LLSliderController
//
//  Created by wilson on 2019/12/9.
//

#import "LLSliderController.h"

@interface LLSliderController ()<UIScrollViewDelegate> {
    
    CGFloat _sliderWidth;
    UIView *_sliderView;
    UIView *_mainView;
}

@property (nonatomic,strong) UIScrollView *scrollView;

@end

@implementation LLSliderController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupScrollView];
    [self calculateContentWidth];
    [self addSubContentView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGRect frame = self.sliderViewController.view.frame;
    frame.size.width = self->_sliderWidth;
    self.sliderViewController.view.frame = frame;
    
    CGRect mainFrame = self.mainViewController.view.frame;
    mainFrame.size.width = self.scrollView.frame.size.width;
    self.mainViewController.view.frame = mainFrame;
}

- (void)setupScrollView {
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    [self.view addSubview:self.scrollView];
}

- (void)calculateContentWidth  {
    
    CGRect frame = self.scrollView.frame;
    CGFloat offset = self.offset;
    if (offset == 0) {
        offset = 0.8;
    }
    self->_sliderWidth = frame.size.width * offset;
    CGFloat width = frame.size.width + frame.size.width * offset;
    CGSize contentSize = CGSizeMake(width, self.scrollView.frame.size.height);
    self.scrollView.contentSize = contentSize;
}

- (void)addSubContentView {
    
    [self addSliderView];
    [self addMainView];
    
    if (self.orientation == LLSliderOrientationLeft) {
        self.scrollView.contentOffset = CGPointMake(self->_sliderWidth, 0);
    }
}

- (void)addSliderView {
    
    if (!self.sliderViewController) {
        return;
    }
    
    CGFloat sliderX = 0;
    if (self.orientation == LLSliderOrientationRight) {
        sliderX = self.scrollView.frame.size.width;
    }
    UIView *sliderView = [[UIView alloc] initWithFrame:CGRectMake(sliderX, 0, self->_sliderWidth, self.scrollView.frame.size.height)];
    [self.scrollView addSubview:sliderView];
    self->_sliderView = sliderView;

    CGRect frame = self.sliderViewController.view.frame;
    frame.size.width = self->_sliderWidth;
    self.view.frame = frame;
    
    [sliderView addSubview:self.sliderViewController.view];
    [self addChildViewController:self.sliderViewController];
}

- (void)addMainView {
    
    if (!self.mainViewController) {
        return;
    }
    
    CGFloat mainX = self->_sliderWidth;
    if (self.orientation == LLSliderOrientationRight) {
        mainX = 0;
    }
    
    UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(mainX, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame))];
    [self.scrollView addSubview:mainView];
    self->_mainView = mainView;
    
    [mainView addSubview:self.mainViewController.view];
    [self addChildViewController:self.mainViewController];
}

- (void)showSliderViewControllerWithAnimation:(BOOL)animation {
    
    CGPoint offset = CGPointZero;
    if (self.orientation == LLSliderOrientationLeft) {
        offset = CGPointMake(0, 0);
    }else {
        offset = CGPointMake(self->_sliderWidth, 0);
    }
    [self.scrollView setContentOffset:offset animated:animation];
    self->_showSlider = YES;
}

- (void)hideSliderViewControllerWithAnimation:(BOOL)animation {
    
    CGPoint offset = CGPointZero;
    if (self.orientation == LLSliderOrientationLeft) {
        offset = CGPointMake(self->_sliderWidth, 0);
    }else {
        offset = CGPointMake(0, 0);
    }
    [self.scrollView setContentOffset:offset animated:animation];
    self->_showSlider = NO;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (self.mainAlpha == 0) {
        self.mainAlpha = 0.8;
    }
    
    if (self.mainAlpha >= 1) {
        return;
    }
    
    CGFloat visibleWidth = [self calculateVisibleWidth:scrollView];
    CGFloat alpha = visibleWidth / self->_sliderWidth * self.mainAlpha;
    self->_mainView.alpha = 1.0 - alpha;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    CGFloat visibleWidth = [self calculateVisibleWidth:scrollView];
    BOOL isShowSlider = YES;
    if (visibleWidth != self->_sliderWidth) {
        isShowSlider = NO;
    }
    self->_showSlider = isShowSlider;
    
    if ([self.delegate respondsToSelector:@selector(sliderController:didChangeWithShowSlider:)]) {
        [self.delegate sliderController:self didChangeWithShowSlider:self->_showSlider];
    }
}

- (CGFloat)calculateVisibleWidth:(UIScrollView *)scrollView {
    
    CGFloat visibleWidth = 0;
    if (self.orientation == LLSliderOrientationLeft) {
        visibleWidth = self->_sliderWidth - scrollView.contentOffset.x;
    }else {
        visibleWidth = scrollView.contentOffset.x;
    }
    return visibleWidth;
}

@end
