//
//  BeanBag.m
//  Cornhole
//
//  Created by Matt Kula on 2/28/15.
//  Copyright (c) 2015 Matt Kula. All rights reserved.
//

#import "BeanBag.h"

#define FRICTION_CONSTANT 0.90

@interface BeanBag () {
    CGFloat _rotationVelocity;
    CGFloat _zHeight;
    CGFloat _zVelocity;
}

@end

static int collisionBitMask = 0;

@implementation BeanBag

- (instancetype)initWithVelocity:(CGVector)velocity rotation:(CGFloat)rotationVelocity {
    SKTexture *texture = [SKTexture textureWithImageNamed:@"beanbag"];
    CGSize textureSize = CGSizeMake(160, 160);
    if ((self = [BeanBag spriteNodeWithTexture:texture size:textureSize])) {
        _velocity = velocity;
        _rotationVelocity = rotationVelocity;
        _zHeight = 5;
        _zVelocity = -.3;
        self.physicsBody = [SKPhysicsBody bodyWithTexture:texture size:textureSize];
        self.physicsBody.mass = 1;
        _isInAir = YES;
        collisionBitMask = 0;
    }
    return self;
}

- (void)applyFriction:(CGFloat)friction {
    _velocity = CGVectorMake(_velocity.dx * friction, _velocity.dy * friction);
    _rotationVelocity = _rotationVelocity * friction * friction * friction;
}

- (void)update:(CFTimeInterval)currentTime {
    if (_zHeight <= 0) {
        if (_isInAir) {
            collisionBitMask = -1;
        }
        _isInAir = NO;
        _zHeight = 0;
        _zVelocity = 0;
        self.xScale = 1;
        self.yScale = 1;
        [self applyFriction:FRICTION_CONSTANT];
    } else {
        collisionBitMask = 0;
        _zHeight = _zHeight + _zVelocity;
        self.xScale = sqrt(_zHeight + 1);
        self.yScale = sqrt(_zHeight + 1);
        _isInAir = YES;
    }
    self.physicsBody.collisionBitMask = collisionBitMask;
    self.zRotation = self.zRotation + _rotationVelocity;
    self.position = CGPointMake(self.position.x + _velocity.dx, self.position.y + _velocity.dy);
}

@end
