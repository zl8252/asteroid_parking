//
//  Level.h
//  XniArchitecture
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Namespace.XniArchitecture.classes.h"

/**
 Represents a game level and implements all the generic things shared by all levels.
 */
@interface Level : GameComponent {
	// Scene 
	Scene *scene;
	
	// Scene object variables for accessing particular items in the child classes.
	
	// Your game might or might not need this here as you can always access all your objects
	// by iterating the scene collection. But if you need a pointer to a specific scene object
	// this is the place to have it. 
	
	// This applies to objects used in all the levels. Items specific to a certain level should
	// go into the child implementation.
	
	PlayerShip *playerShip;
   //SceneObject2 *itemC;
}

/**
 The scene is a data structure that holds all scene objects in the current level.
 */
@property (nonatomic, retain) Scene *scene;

/**
 Resets the level to its initial conditions;
 */
- (void) reset;

@end
