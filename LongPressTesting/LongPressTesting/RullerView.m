//
//  RullerView.m
//  OCVeryTemp
//
//  Created by Don Mag on 3/22/18.
//  Copyright © 2018 DonMag. All rights reserved.
//

#import "RullerView.h"

@interface RullerView ()

@property (strong, nonatomic) UIView *view;
@property (strong, nonatomic) UIViewController *viewController;

@end

@implementation RullerView

- (id)initWithContent:(UIView *)v viewController:(UIViewController *)vc {
	self = [super initWithFrame:CGRectZero];
	if (self) {
		_view = v;
		_viewController = vc;
		[self commonInit];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self commonInit];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if ((self = [super initWithCoder:aDecoder])) {
		[self commonInit];
	}
	return self;
}

- (void)commonInit {
	self.backgroundColor = [UIColor redColor];
	[self setupGestures];
}

- (void)setupGestures {
	UILongPressGestureRecognizer *rullerGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(rullerTapAction:)];
	[rullerGestureRecognizer setNumberOfTouchesRequired:2];
	
	//view here is a content view passed into init, basically the same one
	//to which first recognizer is added, however selector action is contained
	//in this view, and this view is target for this recognizer
	[_view addGestureRecognizer:rullerGestureRecognizer];
}

- (void)rullerTapAction:(UILongPressGestureRecognizer *)recognizer{
	NSLog(@"RullerView two-touch long press");
}

@end
