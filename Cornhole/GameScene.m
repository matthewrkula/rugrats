//
//  GameScene.m
//  Cornhole
//
//  Created by Matt Kula on 2/28/15.
//  Copyright (c) 2015 Matt Kula. All rights reserved.
//

#import "GameScene.h"

#import "BeanBag.h"
#import "Board.h"
#import "Hole.h"

@interface GameScene() {
    Board *_board;
    
    NSMutableArray *_beanBags;
}

@end

@implementation GameScene

- (void)didMoveToView:(SKView *)view {
    self.backgroundColor = [UIColor greenColor];
    self.physicsWorld.gravity = CGVectorMake(0, 0);
    [self initBoard];
    _beanBags = @[].mutableCopy;
}

- (void)initBoard {
    _board = [[Board alloc] initWithColor:[UIColor lightGrayColor] size:self.view.bounds.size];
    _board.position  = CGPointMake(self.scene.size.width / 2, self.scene.size.height / 2);
    [self addChild:_board];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchPosition = [touch locationInNode:_board];
    
    float rVelocity = ((float)rand() / RAND_MAX / 2) - .25;
    float yV = ((float)rand() / RAND_MAX) * 7 + 16;
    
    [self throwBeanBag:touchPosition velocity:CGVectorMake(0, yV) rVelocity:rVelocity];
}

- (void)throwBeanBag:(CGPoint)position velocity:(CGVector)velocity rVelocity:(CGFloat)rVelocity {
    BeanBag *bag = [[BeanBag alloc] initWithVelocity:velocity rotation:rVelocity];
    bag.zRotation = ((float)rand() / RAND_MAX * (M_PI * 4));
    bag.position = position;
    
    [_beanBags addObject:bag];
    [_board addChild:bag];
}

-(void)update:(CFTimeInterval)currentTime {
    for (BeanBag *beanBag in _beanBags) {
        [beanBag update:currentTime];
        
        if ([self distanceBetweenPoint1:beanBag.position andPoint2:_board.hole.position] < 90 && !beanBag.isInAir) {
            beanBag.velocity = CGVectorMake(0, 0);
            SKAction *fadeAction = [SKAction fadeOutWithDuration:0.2];
            [beanBag runAction:fadeAction completion:^{
                [beanBag removeFromParent];
                [_beanBags removeObject:beanBag];
            }];
        }
    }
}

- (float)distanceBetweenPoint1:(CGPoint)point1 andPoint2:(CGPoint)point2 {
    return sqrtf(pow(point1.x - point2.x, 2) + pow(point1.y - point2.y, 2));
}

@end
