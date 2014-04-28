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
@property (weak, nonatomic) IBOutlet UIImageView *displayImage;
@property (weak, nonatomic) IBOutlet UIImageView *layer1;
@property (weak, nonatomic) IBOutlet UIImageView *layer2;
@property (weak, nonatomic) IBOutlet UIImageView *layer3;
@property (weak, nonatomic) IBOutlet UIImageView *layer4;
@property (weak, nonatomic) IBOutlet UIImageView *hatLayer;
@property int hatStatus;
@end

@implementation ViewController

@synthesize displayImage;
@synthesize layer1;
@synthesize layer2;
@synthesize layer3;
@synthesize layer4;
@synthesize hatLayer;
@synthesize hatStatus;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    hatStatus = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)drawHappyMan:(id)sender {
    [displayImage setImage:[UIImage imageNamed: @"baseline.png"]];
    [layer1       setImage:[UIImage imageNamed: @"happy.png"]];
    [layer2       setImage:[UIImage imageNamed: @"legs.png"]];
    [layer3       setImage:[UIImage imageNamed: @"leftHandUp.png"]];
    [layer4       setImage:[UIImage imageNamed: @"rightHandUp.png"]];
}

- (IBAction)drawSadMan:(id)sender {
    [displayImage setImage:[UIImage imageNamed: @"baseline.png"]];
    [layer1       setImage:[UIImage imageNamed: @"sad.png"]];
    [layer2       setImage:[UIImage imageNamed: @"legs.png"]];
    [layer3       setImage:[UIImage imageNamed: @"leftHandDown.png"]];
    [layer4       setImage:[UIImage imageNamed: @"rightHandDown.png"]];
}

- (IBAction)toggleHat:(id)sender {
    hatStatus = 1 - hatStatus;
    if (hatStatus == 1) {
        [hatLayer setImage:[UIImage imageNamed: @"hat.png"]];
    } else {
        [hatLayer setImage:[UIImage imageNamed: @"empty.png"]];
    }
}

@end
