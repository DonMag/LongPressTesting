//
//  ViewController.m
//  LongPressTesting
//
//  Created by Don Mag on 3/22/18.
//  Copyright © 2018 DonMag. All rights reserved.
//

#import "ViewController.h"

#import "RullerView.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) UILongPressGestureRecognizer *longGestureRecognizer;
@property (strong, nonatomic) RullerView *rullerView;

@end

@implementation ViewController

- (IBAction)didTap:(id)sender {
	
	_rullerView = [[RullerView alloc] initWithContent:self.contentView viewController:self];
	
	// works wether the view is added or not
	_rullerView.frame = CGRectMake(40, 40, 200, 200);
	[self.contentView addSubview:_rullerView];
	
	NSLog(@"RullerView instantiated...");

}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self setupGestures];
}

- (void) setupGestures {
	[self.contentView addGestureRecognizer:self.longGestureRecognizer];
}

- (UILongPressGestureRecognizer *)longGestureRecognizer {
	if (!_longGestureRecognizer) {
		_longGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
		[_longGestureRecognizer setMinimumPressDuration:1];
	}
	return _longGestureRecognizer;
}

- (void)longPressAction:(UILongPressGestureRecognizer *)recognizer{
	NSLog(@"ViewController single touch long press");
}

@end

