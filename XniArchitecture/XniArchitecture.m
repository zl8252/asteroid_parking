//
//  XniArchitecture.m
//  XniArchitecture
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "XniArchitecture.h"

#import "Namespace.XniArchitecture.h"

@implementation XniArchitecture

- (id) init {
    if (self = [super init]) {
        graphics = [[GraphicsDeviceManager alloc] initWithGame:self];
    }
    return self;
}

- (void) initialize {
	// Add all level classes in the order of how they appear in the game.
	levelClasses = [[NSMutableArray alloc] init];
	[levelClasses addObject:[Level1 class]];
	//[levelClasses addObject:[Level2 class]];
	
	// Start in first level.
	[self loadLevel:[levelClasses objectAtIndex:0]];
	
	// Initialize all components.
	[super initialize];
}

- (void) loadLevel:(Class)levelClass {
	
	// Unload the current level.
	if (currentLevel) {
		[self.components removeComponent:currentLevel];
		[currentLevel release];
	}
	
	// Allocate and initialize a new level and add it to components.
	currentLevel = [[levelClass alloc] initWithGame:self];
	[self.components addComponent:currentLevel];
	
	
	// Remove the current renderer if it already exists (a level was already loaded).
	if (currentRenderer) {
		[self.components removeComponent:currentRenderer];
		[currentRenderer release];
	}
	
	// Create a new renderer for the new scene and add it to components.
	currentRenderer = [[GameRenderer alloc] initWithGame:self level:currentLevel];
	[self.components addComponent:currentRenderer];
}

- (void) dealloc
{
	[levelClasses release];
    [graphics release];
    [super dealloc];
}

@end
