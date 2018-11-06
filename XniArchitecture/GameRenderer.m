//
//  GameRenderer.m
//  XniArchitecture
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "GameRenderer.h"

#import "Namespace.XniArchitecture.h"

@implementation GameRenderer

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		level = theLevel;
		
		// We create our own content manager, so we can unload all the resources loaded with it.
		content = [[ContentManager alloc] initWithServiceProvider:theGame.services];
	}
	return self;
}

- (void) loadContent {
	// We create our sprite batch which we will use for drawing the sprites.
	spriteBatch = [[SpriteBatch alloc] initWithGraphicsDevice:self.graphicsDevice];
	
	// We initialize the sprites themselves.
	// Don't forget to include your own textures in the Resources folder (remove SpriteSheet example). 
	
    // Sprites for PlayerShip
    playerShipSprite = [[Sprite alloc] init];
    playerShipSprite.texture = [content load:@"player_ship"];
    playerShipSprite.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:100 height:100];
    playerShipSprite.origin = [Vector2 vectorWithX:50 y:50];
    
	// Sprite for SceneObject1
//    sceneObject1Sprite = [[Sprite alloc] init];
//    sceneObject1Sprite.texture = [content load:@"TextureAtlas"];
//    sceneObject1Sprite.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:128 height:128];
//    sceneObject1Sprite.origin = [Vector2 vectorWithX:64 y:64];
	
	// Sprite for SceneObject2
//    sceneObject2Sprite = [[Sprite alloc] init];
//    sceneObject2Sprite.texture = [content load:@"TextureAtlas"];
//    sceneObject2Sprite.sourceRectangle = [Rectangle rectangleWithX:128 y:0 width:128 height:128];
//    sceneObject2Sprite.origin = [Vector2 vectorWithX:64 y:64];
}

- (void) drawWithGameTime:(GameTime *)gameTime {	
	// Clear the background with some color.
	// If you use a background image that will cover the whole screeen, this is not necessary.
	[self.graphicsDevice clearWithColor:[Color black]];
	
	// Start the sprite batch.
	[spriteBatch begin];
	
	// Go over the whole scene
	for (id<NSObject> item in level.scene) {
		
		// See if the current item has a position.
		id<Position> itemWithPosition = nil;
		if ([item conformsToProtocol:@protocol(Position)]) {
			itemWithPosition = (id<Position>)item;
		}
		
		// Determine which sprite should be drawn, depending on the type of the item.
		Sprite *sprite = nil;		
		if ([item isKindOfClass:[PlayerShip class]]) {
			sprite = playerShipSprite;
		}
		
		// If the item has both position and a valid sprite is set, proceed with drawing.
		if (itemWithPosition && sprite) {
			[spriteBatch draw:sprite.texture
						   to:itemWithPosition.position
				fromRectangle:sprite.sourceRectangle
				tintWithColor:[Color white]
					 rotation:0 
					   origin:sprite.origin
				 scaleUniform:1
					  effects:SpriteEffectsNone 
				   layerDepth:0];
		}
	}
	
	// Instruct the sprite batch to draw all the sprites we've submitted.
	[spriteBatch end];
}

- (void) unloadContent {
	// We tell our content manager not to hold on to loaded resources anymore.
	[content unload];	
}

- (void) dealloc
{
	[playerShipSprite release];
//    [sceneObject2Sprite release];
	[spriteBatch release];
	[level release];
	[super dealloc];
}

@end
