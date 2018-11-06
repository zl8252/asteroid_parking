//
//  SceneObject2.h
//  XniArchitecture
//
//  Created by Matej Jan on 20.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Namespace.XniArchitecture.classes.h"
#import "Position.h"

/**
 Represents another type of a gameplay object.
 */
@interface SceneObject2 : NSObject <Position> {
	Vector2 *position;
}

@end
