//
//  Sprite.m
//  XniArchitecture
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Sprite.h"

#import "Namespace.XniArchitecture.h"

@implementation Sprite

@synthesize texture;
@synthesize sourceRectangle;
@synthesize origin;

- (void) dealloc
{
	[texture release];
	[sourceRectangle release];
	[origin release];
	[super dealloc];
}

@end
