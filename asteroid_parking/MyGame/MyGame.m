//
//  MyGame.m
//  MyGame
//
//  Created by Bojan Klemenc on 10/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyGame.h"

#import "Sprite.h"
#import "AnimatedSprite.h"
#import "AnimatedSpriteFrame.h"


@implementation MyGame

- (id)init
{
    self = [super init];
    if (self) {
        graphics = [[GraphicsDeviceManager alloc] initWithGame:self];
        playerBounds = [[Rectangle alloc] initWithX:0 y:0 width:256 height:256];
        
    }
    
    return self;
}


-(void)initialize{
    spriteBatch = [[SpriteBatch alloc] initWithGraphicsDevice:self.graphicsDevice];
    
    // gets viewport constraints
    viewportWidth  = self.graphicsDevice.viewport.width;
    viewportHeight = self.graphicsDevice.viewport.height;
    
    centre = [[Vector2 vectorWithX:self.graphicsDevice.viewport.width/2 y:self.graphicsDevice.viewport.height/2] retain];
    
    [super initialize];
}


-(void)loadContent{
    // load textures
  	gameSprites = [self.content load:@"gameSprites"];
  	background = [self.content load:@"background"];
    
    alienShipSprite = [self.content load:@"alien_ship"];
    asteroidSprite = [self.content load:@"asteroid"];
    astronautSprite = [self.content load:@"astronaut"];
    controlArrowSptite = [self.content load:@"control_arrow"];
    parkingSpotSprite = [self.content load:@"parking_spot"];
    playerShipSprite = [self.content load:@"player_ship"];
    propulsionSprite = [self.content load:@"propulsion"];
    
    // animation
    Texture2D *propulsionTexture = [[self.content load:@"propulsion"] autorelease];
    propulsionSpriteAnimation = [[AnimatedSprite alloc] initWithDuration:0.5];
    propulsionSpriteAnimation.looping = NO;
    
    // frame 0
    Sprite *sprite = [[[Sprite alloc] init] autorelease];
    sprite.texture = propulsionTexture;
    sprite.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:200 height:200];
    AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:sprite start:propulsionSpriteAnimation.duration * (float)0 / 3];
    [propulsionSpriteAnimation addFrame:frame];
    
    // frame 1
    Sprite *sprite1 = [[[Sprite alloc] init] autorelease];
    sprite1.texture = propulsionTexture;
    sprite1.sourceRectangle = [Rectangle rectangleWithX:0 y:200 width:200 height:200];
    AnimatedSpriteFrame *frame1 = [AnimatedSpriteFrame frameWithSprite:sprite1 start:propulsionSpriteAnimation.duration * (float)1 / 3];
    [propulsionSpriteAnimation addFrame:frame1];
    
    // frame2
    Sprite *sprite2 = [[[Sprite alloc] init] autorelease];
    sprite2.texture = propulsionTexture;
    sprite2.sourceRectangle = [Rectangle rectangleWithX:0 y:400 width:200 height:200];
    AnimatedSpriteFrame *frame2 = [AnimatedSpriteFrame frameWithSprite:sprite2 start:propulsionSpriteAnimation.duration * (float)2 / 3];
    [propulsionSpriteAnimation addFrame:frame2];
    
    
    propulsionSpriteAnimation.looping=YES;
    
}

-(void)drawWithGameTime:(GameTime *)gameTime {
    
    [self.graphicsDevice clearWithColor:[Color black]];
    
    
    [spriteBatch begin];
    
    // player ship
    [spriteBatch draw:playerShipSprite to: [Vector2 vectorWithX:200.0 y:500.0] fromRectangle:nil tintWithColor:[Color white] rotation:0 origin:[Vector2 vectorWithX:0 y:0] scaleUniform:0.2 effects:SpriteEffectsNone layerDepth:0];
    
    // propulsion
    Sprite *sprite = [propulsionSpriteAnimation spriteAtTime:gameTime.totalGameTime];
    
    [spriteBatch draw:sprite.texture to:[Vector2 vectorWithX:400.0 y:400.0] fromRectangle:sprite.sourceRectangle tintWithColor:[Color white]
             rotation:0 origin:sprite.origin scaleUniform:2 effects:SpriteEffectsNone layerDepth:0];
    

    [spriteBatch end];
    
    
    [super drawWithGameTime:gameTime];
}

-(void)dealloc{
    [graphics release];
    [playerBounds release];
    [super dealloc];
}

@end
