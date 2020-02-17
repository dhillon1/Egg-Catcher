//
//  GameScene.swift
//  Egg Catcher
//  Project name = Egg Catcher
//  Developed by = Harmandeep Kaur (301092579) and Simranjeet Singh Dhillon (301093914)
//  Description = Score class
//  Date modified = 16-02-2020
//  Copyright © 2020 centennialcollege. All rights reserved.
//

import UIKit
import AVFoundation
import SpriteKit
import GameplayKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?


class GameScene: SKScene {
    
   
    var basketSprite: basket?
    var eggSprite1: eggs?
    var eggSprite2: eggs?
    var eggSprite3: eggs?
  
    
   
    
    
    override func didMove(to view: SKView)
    {
        screenWidth = frame.width
        screenHeight = frame.height
        
        self.name = "GAME"
        
   
        // add basket
        self.basketSprite = basket()
        self.basketSprite?.position = CGPoint(x: 0, y: -575)
        self.basketSprite?.size = CGSize(width: 190, height: 190)
        self.addChild(basketSprite!)
        
        // add egg left
        self.eggSprite1 = eggs()
        self.eggSprite1?.position = CGPoint(x: -236, y: 380)
        self.eggSprite1?.size = CGSize(width: 70, height: 70)
        self.addChild(eggSprite1!)
        
        // add egg middle
        self.eggSprite2 = eggs()
        self.eggSprite2?.position = CGPoint(x: 0, y: 380)
        self.eggSprite2?.size = CGSize(width: 70, height: 70)
        self.addChild(eggSprite2!)
        
        // add egg right
        self.eggSprite3 = eggs()
        self.eggSprite3?.position = CGPoint(x: 233, y: 380)
        self.eggSprite3?.size = CGSize(width: 70, height: 70)
        self.addChild(eggSprite3!)
        
        
        
    }
    
    func touchDown(atPoint pos : CGPoint)
    {
        self.basketSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: pos.y))
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        self.basketSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: pos.y))
    }
    
    
    
    func touchUp(atPoint pos : CGPoint)
    {
        self.basketSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: pos.y))
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchMoved(toPoint: t.location(in: self))}
    }
    
    
    
    override func update(_ currentTime: TimeInterval)
    {
      
        self.eggSprite1?.Update()
        self.eggSprite2?.Update()
        self.eggSprite3?.Update()
        
        self.basketSprite?.Update()
        
        CollisionManager.squaredRadiusCheck(scene: self, object1: eggSprite1!, object2: basketSprite!)
        CollisionManager.squaredRadiusCheck(scene: self, object1: eggSprite2!, object2: basketSprite!)
        CollisionManager.squaredRadiusCheck(scene: self, object1: eggSprite3!, object2: basketSprite!)
        
        
        
    }
}
