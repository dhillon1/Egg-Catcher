//
//  CollisionManager.swift
//  Egg Catcher
//  Project name = Egg Catcher
//  Developed by = Harmandeep Kaur (301092579) and Simranjeet Singh Dhillon (301093914)
//  Description = Score class
//  Date modified = 16-02-2020
//  Copyright © 2020 centennialcollege. All rights reserved.
//

import SpriteKit
import GameplayKit

class CollisionManager
{
    public static var gameViewController: GameViewController?
    
    
    // distance
    public static func squaredRadiusCheck(scene: SKScene, object1: GameObject, object2: GameObject) -> Void
    {
        
        let x1 = object1.position.x
        let x2 = object2.position.x
        let y1 = object1.position.y
        let y2 = object2.position.y
        let diffx =  x2-x1
        let diffy =  y2-y1
        
        let distance = sqrt((diffx*diffx)+(diffy*diffy))
        
        if(distance <= 70){
            if(!object1.isColliding!){
            scene.run(SKAction.playSoundFileNamed("music", waitForCompletion: false))
            Score.Score = Score.Score + 10
            gameViewController?.updateScoreLabel()
            object1.isColliding = true
            object1.Reset()
            
            }
        }
        
        // done
        if (y1 <= -620 ){
            object1.Reset()
            Score.Lives -= 1
            gameViewController?.updateLives()
        }
        
    }
}

