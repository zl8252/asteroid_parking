//
//  main.m
//  MyGame
//
//  Created by Bojan Klemenc on 10/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Retronator.Xni.Framework.h"

int main(int argc, char *argv[])
{
    [GameHost load];
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, @"GameHost", @"MyGame");
    [pool release];
    return retVal;
}
