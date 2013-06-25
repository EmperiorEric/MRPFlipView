//
//  RPFlipView.h
//  ScrollViews
//
//  Created by Ryan Poolos on 6/23/13.
//  Copyright (c) 2013 PopArcade. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MRPFlipViewDelegate;

@interface MRPFlipView : UIView

@property (nonatomic, weak) id <MRPFlipViewDelegate> delegate;

@property (nonatomic, strong) UIView *frontView;
@property (nonatomic, strong) UIView *backView;

@property (nonatomic, readwrite) BOOL flipped;

- (void)setFlipped:(BOOL)flipped animated:(BOOL)animated;

@end

@protocol MRPFlipViewDelegate <NSObject>

@optional
- (void)flipViewWillBeginDragging:(MRPFlipView *)flipView;

- (void)flipView:(MRPFlipView *)flipView didFlip:(BOOL)flipped;

@end