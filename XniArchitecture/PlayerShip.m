//
//  SceneObject1.m
//  XniArchitecture
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "PlayerShip.h"

#import "Retronator.Xni.Framework.Input.Touch.h"


@implementation PlayerShip

- (id) init
{
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
	}
	return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    TouchCollection *touches = [TouchPanel getState];
    
    if ([touches count] == 1) {
        TouchLocation *touch = [touches objectAtIndex:0];
        
        
        [position set:[touch position]];
    }
}

@synthesize position;

- (void) dealloc
{
	[position release];
	[super dealloc];
}

@end
