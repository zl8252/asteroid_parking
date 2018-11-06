//
//  SceneObject1.h
//  XniArchitecture
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Namespace.XniArchitecture.classes.h"
#import "Position.h"

/**
 Represents a certain type of a gameplay object.
 It only has a position property for now.
 
 You should rename this according to what object this represents (Pacman, Ghost, Brick, Ball, Wall ...)
 */
@interface PlayerShip: NSObject <Position> {
	Vector2 *position;

}

- (void) updateWithGameTime:(GameTime*)gameTime;

@end
