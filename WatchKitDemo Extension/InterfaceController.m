//
//  InterfaceController.m
//  WatchKitDemo Extension
//
//  Created by 张庆杰 on 16/4/14.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceSlider *slider;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *guessLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *resultLabel;
@property (nonatomic, assign) NSInteger guessNumber;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    self.guessNumber = 3;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)guessAction {
    NSInteger res = arc4random_uniform(6);
    if (res == self.guessNumber) {
        [self.resultLabel setText:@"Correct. You win!"];
    } else {
        [self.resultLabel setText:[NSString stringWithFormat:@"Wrong. The number is %d", res]];
    }
}

- (IBAction)guessNumber:(float)value {
    self.guessNumber = (NSInteger)(value * 5);
    [self.guessLabel setText:[NSString stringWithFormat:@"Your guess:%d", self.guessNumber]];
}

@end



