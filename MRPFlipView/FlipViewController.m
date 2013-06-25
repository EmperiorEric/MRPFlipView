//
//  FlipViewController.m
//  ScrollViews
//
//  Created by Ryan Poolos on 6/23/13.
//  Copyright (c) 2013 PopArcade. All rights reserved.
//

#import "FlipViewController.h"
#import "MRPFlipView.h"

@interface FlipViewController () <MRPFlipViewDelegate>
{
    UIScrollView *theScrollView;
    
    UIView *view;
    UIView *subView;
}
@end

@implementation FlipViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithWhite:0.99 alpha:1.0]];
    
    CGFloat width = CGRectGetWidth(self.view.bounds) / 2.0;
    CGFloat height = CGRectGetHeight(self.view.bounds) / 2.0;
    
    MRPFlipView *flipViewA = [[MRPFlipView alloc] initWithFrame:CGRectMake(0.0, 0.0, width, height)];
    [flipViewA setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    [self.view addSubview:flipViewA];
    
    MRPFlipView *flipViewB = [[MRPFlipView alloc] initWithFrame:CGRectMake(width, 0.0, width, height)];
    [flipViewB setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    [self.view addSubview:flipViewB];
    
    MRPFlipView *flipViewC = [[MRPFlipView alloc] initWithFrame:CGRectMake(0.0, height, width, height)];
    [flipViewC setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    [self.view addSubview:flipViewC];
    
    MRPFlipView *flipViewD = [[MRPFlipView alloc] initWithFrame:CGRectMake(width, height, width, height)];
    [flipViewD setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    [self.view addSubview:flipViewD];
    
    
    for (MRPFlipView *flipView in @[flipViewA, flipViewB, flipViewC, flipViewD]) {
        flipView.delegate = self;
        
        [flipView setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1.0]];
        
        [flipView.frontView setBackgroundColor:[[UIColor redColor] colorWithAlphaComponent:0.35]];
        [flipView.backView setBackgroundColor:[[UIColor blueColor] colorWithAlphaComponent:0.35]];
        
        [flipView.frontView setFrame:CGRectInset(flipView.frontView.superview.bounds, 4.0, 4.0)];
        [flipView.backView setFrame:CGRectInset(flipView.backView.superview.bounds, 4.0, 4.0)];
        
        flipView.frontView.layer.cornerRadius = 4.0;
        flipView.backView.layer.cornerRadius = 4.0;
    }
}

#pragma mark - RPFlipView Delegate

- (void)flipViewWillBeginDragging:(MRPFlipView *)flipView
{
    [flipView.superview bringSubviewToFront:flipView];
}

- (void)flipView:(MRPFlipView *)flipView didFlip:(BOOL)flipped
{
    
}

@end
