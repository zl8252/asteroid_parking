//
//  MyGame.h
//  MyGame
//
//  Created by Bojan Klemenc on 10/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Game.h"
#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Input.Touch.h"

#import "AnimatedSprite.h"

@interface MyGame : Game {
    // graphics
    GraphicsDeviceManager *graphics;
    SpriteBatch *spriteBatch;
    
    // viewport
    int viewportWidth;
    int viewportHeight;
    
    //textures
    Texture2D *gameSprites;
    Texture2D *background;
    
    Texture2D *alienShipSprite;
    Texture2D *asteroidSprite;
    Texture2D *astronautSprite;
    Texture2D *controlArrowSptite;
    Texture2D *parkingSpotSprite;
    Texture2D *playerShipSprite;
    Texture2D *propulsionSprite;
    
    // animation
    AnimatedSprite *propulsionSpriteAnimation;
    
    // player sprite bounds
    Rectangle *playerBounds;
    
    Vector2 *centre;
    
    
}

@end
