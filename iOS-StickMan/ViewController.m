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

@end

@implementation ViewController

@synthesize displayImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)drawHappyMan:(id)sender {
    [displayImage setImage:[UIImage imageNamed: @"baseline.png"]];
}

- (IBAction)drawSadMan:(id)sender {
}

- (IBAction)toggleHat:(id)sender {
    [displayImage setImage:[UIImage imageNamed: @"hat.png"]];
}
@end
