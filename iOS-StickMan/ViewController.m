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
- (IBAction)flapHands:(id)sender;
- (IBAction)usePendulum:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *displayImage;
@property (weak, nonatomic) IBOutlet UIImageView *layer1;
@property (weak, nonatomic) IBOutlet UIImageView *layer2;
@property (weak, nonatomic) IBOutlet UIImageView *layer3;
@property (weak, nonatomic) IBOutlet UIImageView *layer4;
@property (weak, nonatomic) IBOutlet UIImageView *newsLayer;
@property (weak, nonatomic) IBOutlet UIImageView *hatLayer;
@property (weak, nonatomic) IBOutlet UIImageView *pendulumLayer;
@property (weak, nonatomic) IBOutlet UIImageView *eyeLayer;
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
@synthesize pendulumLayer;
@synthesize eyeLayer;
@synthesize stickManSays;
@synthesize hatStatus;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self initialize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initialize
{
    hatStatus = 0;
    [displayImage setImage:[UIImage imageNamed: @"baseline.png"]];
    [layer2       setImage:[UIImage imageNamed: @"legs.png"]];
    [layer3       setImage:[UIImage imageNamed: @"leftHandUp.png"]];
    [layer4       setImage:[UIImage imageNamed: @"rightHandUp.png"]];
    [eyeLayer     setImage:[UIImage imageNamed: @"eyes.png"]];
    stickManSays.text = [NSString stringWithFormat:@"Hello! I am Stick Man."];
}

- (IBAction)drawHappyMan:(id)sender {
    [layer3 stopAnimating];
    [layer4 stopAnimating];
    [pendulumLayer stopAnimating];
    [eyeLayer stopAnimating];

    [eyeLayer     setImage:[UIImage imageNamed: @"eyes.png"]];
    [layer1       setImage:[UIImage imageNamed: @"happy.png"]];
    [layer3       setImage:[UIImage imageNamed: @"leftHandUp.png"]];
    [layer4       setImage:[UIImage imageNamed: @"rightHandUp.png"]];
    [newsLayer    setImage:[UIImage imageNamed: @"empty.png"]];
    stickManSays.text = [NSString stringWithFormat:@"Life is good!"];
}

- (IBAction)drawSadMan:(id)sender {
    [layer3 stopAnimating];
    [layer4 stopAnimating];
    [pendulumLayer stopAnimating];
    [eyeLayer stopAnimating];
    
    [eyeLayer     setImage:[UIImage imageNamed: @"eyes.png"]];
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
    [layer3 stopAnimating];
    [layer4 stopAnimating];
    [pendulumLayer stopAnimating];
    
    [displayImage setImage:[UIImage imageNamed: @"baseline.png"]];
    [eyeLayer     setImage:[UIImage imageNamed: @"empty.png"]];
    [layer2       setImage:[UIImage imageNamed: @"legs.png"]];
    [newsLayer    setImage:[UIImage imageNamed: @"readThePaper.png"]];
    
    stickManSays.text = [NSString stringWithFormat:@"Anything about iPhone 6?"];

    // Load image sequence for pendulum motion
    NSArray *imagesEyes = @[@"eyesRight.png",
                            @"eyes.png",
                            @"eyesLeft.png",
                            @"eyes.png"];
    
    NSMutableArray *imageSeqEyes = [[NSMutableArray alloc] init];
    for (int i = 0; i < imagesEyes.count; i++) {
        [imageSeqEyes addObject:[UIImage imageNamed:[imagesEyes objectAtIndex:i]]];
    }
    
    // start animation in the pendulum layer
    eyeLayer.animationImages = imageSeqEyes;
    eyeLayer.animationDuration = 4.0;
    [eyeLayer startAnimating];
}

- (IBAction)flapHands:(id)sender {
    [pendulumLayer stopAnimating];
    [eyeLayer stopAnimating];
    
    [eyeLayer     setImage:[UIImage imageNamed: @"eyes.png"]];
    [layer1       setImage:[UIImage imageNamed: @"happy.png"]];
    [layer3       setImage:[UIImage imageNamed: @"empty.png"]];
    [layer4       setImage:[UIImage imageNamed: @"empty.png"]];
    [newsLayer    setImage:[UIImage imageNamed: @"empty.png"]];

    stickManSays.text = [NSString stringWithFormat:@"I am flying!"];

    // Load image sequences for left hand and right hand
    NSArray *imagesL = @[@"leftHandUp.png", @"leftHandDown.png"];
    NSArray *imagesR = @[@"rightHandUp.png", @"rightHandDown.png"];
    
    NSMutableArray *imageSeqL = [[NSMutableArray alloc] init];
    for (int i = 0; i < imagesL.count; i++) {
        [imageSeqL addObject:[UIImage imageNamed:[imagesL objectAtIndex:i]]];
    }
    
    NSMutableArray *imageSeqR = [[NSMutableArray alloc] init];
    for (int i = 0; i < imagesR.count; i++) {
        [imageSeqR addObject:[UIImage imageNamed:[imagesR objectAtIndex:i]]];
    }
    
    // start animation in layer3
    layer3.animationImages = imageSeqL;
    layer3.animationDuration = 1.0;
    [layer3 startAnimating];

    // start animation in layer4
    layer4.animationImages = imageSeqR;
    layer4.animationDuration = 1.0;
    [layer4 startAnimating];
}

- (IBAction)usePendulum:(id)sender {
    [layer3 stopAnimating];
    [layer4 stopAnimating];
    [eyeLayer stopAnimating];

    [eyeLayer     setImage:[UIImage imageNamed: @"eyes.png"]];
    [layer1       setImage:[UIImage imageNamed: @"happy.png"]];
    [layer3       setImage:[UIImage imageNamed: @"leftHandHorizontal.png"]];
    [layer4       setImage:[UIImage imageNamed: @"rightHandUp.png"]];
    [newsLayer    setImage:[UIImage imageNamed: @"empty.png"]];
    
    stickManSays.text = [NSString stringWithFormat:@"Check out my pendulum.."];

    // Load image sequence for pendulum motion
    NSArray *imagesPendulum = @[@"pendulum1.png", @"pendulum2.png"];
    
    NSMutableArray *imageSeqPendulum = [[NSMutableArray alloc] init];
    for (int i = 0; i < imagesPendulum.count; i++) {
        [imageSeqPendulum addObject:[UIImage imageNamed:[imagesPendulum objectAtIndex:i]]];
    }
    
    // start animation in the pendulum layer
    pendulumLayer.animationImages = imageSeqPendulum;
    pendulumLayer.animationDuration = 0.75;
    [pendulumLayer startAnimating];
}

@end
