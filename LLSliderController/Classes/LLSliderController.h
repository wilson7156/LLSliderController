//
//  LLSliderController.h
//  LLSliderController
//
//  Created by wilson on 2019/12/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,LLSliderOrientation) {
    
    //左边侧滑
    LLSliderOrientationLeft,
    
    //右边侧滑
    LLSliderOrientationRight,
};

@class LLSliderController;

@protocol LLSliderControllerDelegte <NSObject>

@optional
- (void)sliderController:(LLSliderController *)sliderController didChangeWithShowSlider:(BOOL)isShowSlider;

@end

//侧滑控制器
@interface LLSliderController : UIViewController

/// 侧滑方向
@property (nonatomic,assign) LLSliderOrientation orientation;

/// 主要显示页面，全屏的
@property (nonatomic,strong) UIViewController *mainViewController;

/// 侧滑页面
@property (nonatomic,strong) UIViewController *sliderViewController;

/// 侧滑位置 0 - 1,默认0.8
@property (nonatomic,assign) CGFloat offset;

/// 主页面的透明度
@property (nonatomic,assign) CGFloat mainAlpha;

/// 当前是否显示侧滑
@property (nonatomic,assign,readonly,getter=isShowSlider) BOOL showSlider;

/// 显示
/// @param animation 是否动画显示
- (void)showSliderViewControllerWithAnimation:(BOOL)animation;

/// 隐藏
/// @param animation 是否动画显示
- (void)hideSliderViewControllerWithAnimation:(BOOL)animation;

@property (nonatomic,assign) id <LLSliderControllerDelegte> delegate;
@end

NS_ASSUME_NONNULL_END
