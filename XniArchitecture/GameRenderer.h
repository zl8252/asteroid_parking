//
//  GameRenderer.h
//  XniArchitecture
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.h"

#import "Namespace.XniArchitecture.classes.h"

/**
 The game renderer knows how to render a game level.
 */
@interface GameRenderer : DrawableGameComponent {
	
	// Resources
	ContentManager *content;
	
	// Here we have the sprites used to render scene objects. One sprite for each scene object type.
    Sprite *playerShipSprite;
	//Sprite *sceneObject1Sprite;
	//Sprite *sceneObject2Sprite;
	
	// Graphics objects
	// We use sprite batch to draw sprites.
	SpriteBatch *spriteBatch;
	
	// Level
	// This is the level we will be rendering.
	Level *level;
}

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel;

@end
