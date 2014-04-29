//
//  ViewController.m
//  iOS-StickMan
//
//  Created by Abhijit Joshi on 4/28/14.
//  Copyright (c) 2014 XYZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)drawHappyMan:(id)sender;
- (IBAction)drawSadMan:(id)sender;
- (IBAction)toggleHat:(id)sender;
- (IBAction)readTheNews:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *displayImage;
@property (weak, nonatomic) IBOutlet UIImageView *layer1;
@property (weak, nonatomic) IBOutlet UIImageView *layer2;
@property (weak, nonatomic) IBOutlet UIImageView *layer3;
@property (weak, nonatomic) IBOutlet UIImageView *layer4;
@property (weak, nonatomic) IBOutlet UIImageView *newsLayer;
@property (weak, nonatomic) IBOutlet UIImageView *hatLayer;
@property (weak, nonatomic) IBOutlet UILabel *stickManSays;
@property int hatStatus;
@end

@implementation ViewController

@synthesize displayImage;
@synthesize layer1;
@synthesize layer2;
@synthesize layer3;
@synthesize layer4;
@synthesize hatLayer;
@synthesize newsLayer;
@synthesize stickManSays;
@synthesize hatStatus;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    hatStatus = 0;
    [displayImage setImage:[UIImage imageNamed: @"baseline.png"]];
    [layer2       setImage:[UIImage imageNamed: @"legs.png"]];
    [layer3       setImage:[UIImage imageNamed: @"leftHandUp.png"]];
    [layer4       setImage:[UIImage imageNamed: @"rightHandUp.png"]];
    stickManSays.text = [NSString stringWithFormat:@"hello! I am Stick Man."];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)drawHappyMan:(id)sender {
    [layer1       setImage:[UIImage imageNamed: @"happy.png"]];
    [layer3       setImage:[UIImage imageNamed: @"leftHandUp.png"]];
    [layer4       setImage:[UIImage imageNamed: @"rightHandUp.png"]];
    [newsLayer    setImage:[UIImage imageNamed: @"empty.png"]];
    stickManSays.text = [NSString stringWithFormat:@"Life is good!"];
}

- (IBAction)drawSadMan:(id)sender {
    [layer1       setImage:[UIImage imageNamed: @"sad.png"]];
    [layer3       setImage:[UIImage imageNamed: @"leftHandDown.png"]];
    [layer4       setImage:[UIImage imageNamed: @"rightHandDown.png"]];
    [newsLayer    setImage:[UIImage imageNamed: @"empty.png"]];
    stickManSays.text = [NSString stringWithFormat:@"My code doesn't run"];
}

- (IBAction)toggleHat:(id)sender {
    hatStatus = 1 - hatStatus;
    if (hatStatus == 1) {
        [hatLayer setImage:[UIImage imageNamed: @"hat.png"]];
    } else {
        [hatLayer setImage:[UIImage imageNamed: @"empty.png"]];
    }
}

- (IBAction)readTheNews:(id)sender {
    [displayImage setImage:[UIImage imageNamed: @"baseline.png"]];
    [layer2       setImage:[UIImage imageNamed: @"legs.png"]];
    [newsLayer    setImage:[UIImage imageNamed: @"readThePaper.png"]];
    stickManSays.text = [NSString stringWithFormat:@"Any news about iPhone 6?"];
}

@end
