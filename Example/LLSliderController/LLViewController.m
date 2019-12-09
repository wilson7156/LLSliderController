//
//  LLViewController.m
//  LLSliderController
//
//  Created by 704110362@qq.com on 12/09/2019.
//  Copyright (c) 2019 704110362@qq.com. All rights reserved.
//

#import "LLViewController.h"
#import <LLSliderController.h>
#import "SliderViewController.h"
#import "MainViewController.h"

@interface LLViewController ()

@end

@implementation LLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (IBAction)presendButtonClick:(id)sender {
    
    SliderViewController *slider = [SliderViewController new];
    MainViewController *main = [MainViewController new];
    
    LLSliderController *sliderController = [LLSliderController new];
    sliderController.modalPresentationStyle = UIModalPresentationFullScreen;
    sliderController.orientation = LLSliderOrientationRight;
    sliderController.sliderViewController = slider;
    sliderController.mainViewController = main;
    sliderController.offset = 0.9;
    sliderController.mainAlpha = 0.3;
    [self presentViewController:sliderController animated:YES completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [sliderController showSliderViewControllerWithAnimation:YES];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [sliderController hideSliderViewControllerWithAnimation:YES];
        });
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
