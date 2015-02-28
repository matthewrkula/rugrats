//
//  Board.m
//  Cornhole
//
//  Created by Matt Kula on 2/28/15.
//  Copyright (c) 2015 Matt Kula. All rights reserved.
//

#import "Board.h"

#import "Hole.h"

@implementation Board

- (instancetype)initWithColor:(UIColor *)color size:(CGSize)size {
    if ((self = [super initWithColor:color size:size])) {
        _hole = [Hole createWithRadius:50];
        [self addChild:_hole];
    }
    return self;
}

@end
