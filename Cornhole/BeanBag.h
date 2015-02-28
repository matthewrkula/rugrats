//
//  BeanBag.h
//  Cornhole
//
//  Created by Matt Kula on 2/28/15.
//  Copyright (c) 2015 Matt Kula. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BeanBag : SKSpriteNode

@property BOOL isInAir;
@property CGVector velocity;

- (instancetype)initWithVelocity:(CGVector)velocity rotation:(CGFloat)rotationVelocity;
- (void)update:(CFTimeInterval)currentTime;

@end
