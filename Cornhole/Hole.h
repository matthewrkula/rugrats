//
//  Hole.h
//  Cornhole
//
//  Created by Matt Kula on 2/28/15.
//  Copyright (c) 2015 Matt Kula. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface Hole : SKShapeNode

+ (instancetype)createWithRadius:(CGFloat)radius;

@end
