//
//  GameViewController.m
//  Cornhole
//
//  Created by Matt Kula on 2/28/15.
//  Copyright (c) 2015 Matt Kula. All rights reserved.
//

#import "GameViewController.h"

#import <MyoKit/MyoKit.h>

#import "GameScene.h"

@interface GameViewController ()

@property (strong, nonatomic) UIPopoverController *popover;

@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
//    skView.showsPhysics = YES;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    
    // Create and configure the scene.
    GameScene *scene = [[GameScene alloc] initWithSize:[UIScreen mainScreen].bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
    
    [self popoverPresentMyoSettings];
}

// Presenting in a Popover (iPad only)
- (void)popoverPresentMyoSettings {
    self.popover = [TLMSettingsViewController settingsInPopoverController];
    
    [self.popover presentPopoverFromRect:CGRectMake(0, 0, 0, 0)
                                  inView:self.view
                permittedArrowDirections:UIPopoverArrowDirectionAny
                                animated:YES];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
