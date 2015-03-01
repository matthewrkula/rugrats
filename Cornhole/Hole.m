//
//  Hole.m
//  Cornhole
//
//  Created by Matt Kula on 2/28/15.
//  Copyright (c) 2015 Matt Kula. All rights reserved.
//

#import "Hole.h"

@implementation Hole

+ (instancetype)createWithRadius:(CGFloat)radius {
    Hole *hole;
    if ((hole = [Hole shapeNodeWithCircleOfRadius:radius])) {
        hole.fillColor = [UIColor blackColor];
        hole.strokeColor = nil;
        hole.position = CGPointMake(0, 250);
    }
    return hole;
}

@end
