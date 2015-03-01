//
//  MenuViewController.m
//  Cornhole
//
//  Created by Matt Kula on 2/28/15.
//  Copyright (c) 2015 Matt Kula. All rights reserved.
//

#import "MenuViewController.h"

#import <MyoKit/MyoKit.h>

#import "GameViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Cornhole";
    [self pushMyoSettings];
    [self.playButton addTarget:self action:@selector(startGame) forControlEvents:UIControlEventTouchUpInside];
//    [[TLMHub sharedHub] attachToAdjacent];
}

- (void)startGame {
    self.navigationController.navigationBar.hidden = YES;
    GameViewController *controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"GameViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// Pushing it on an existing navigation controller
- (void)pushMyoSettings {
    TLMSettingsViewController *settings = [[TLMSettingsViewController alloc] init];
    
    [self.navigationController pushViewController:settings animated:YES];
}

@end
