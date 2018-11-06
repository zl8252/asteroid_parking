//
//  Level.m
//  XniArchitecture
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Level.h"

#import "Namespace.XniArchitecture.h"

@implementation Level

- (id) initWithGame:(Game *)theGame
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		// Create the scene.
		scene = [[Scene alloc] init];
		
		// Create common scene items.
        playerShip = [[PlayerShip alloc] init];
                    
//        itemA = [[SceneObject1 alloc] init];
//        itemB = [[SceneObject1 alloc] init];
//        itemC = [[SceneObject2 alloc] init];
		
		// Add all items.
        [scene addItem:playerShip];
//        [scene addItem:itemA];
//        [scene addItem:itemB];
//        [scene addItem:itemC];
	}
	return self;
}

@synthesize scene;

- (void) initialize {
	NSLog(@"Loading level.");
	[super initialize];
	[self reset];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    
    [playerShip updateWithGameTime:gameTime];
}

// Override this in children implementations.
- (void) reset {
	NSLog(@"Resetting level.");
}

- (void) dealloc
{
	NSLog(@"Unloading level.");
    [playerShip release];
//    [itemA release];
//    [itemB release];
//    [itemC release];
	[scene release];
	[super dealloc];
}



@end
