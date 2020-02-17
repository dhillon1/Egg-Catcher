//
//  eggs.swift
//  Egg Catcher
//  Project name = Egg Catcher
//  Developed by = Harmandeep Kaur (301092579) and Simranjeet Singh Dhillon (301093914)
//  Description = Score class
//  Date modified = 16-02-2020
//  Copyright © 2020 centennialcollege. All rights reserved.
//

import SpriteKit
import GameplayKit


//class
class eggs: GameObject
{
    
    init()
    {
        super.init(imageString: "egg", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func CheckBounds()
    {
        
        if(self.position.y < -640)
        {
            self.Reset()
        }
        
    }
    
    func Move()
    {
        self.position.y -= self.dy!
    }
    
    override func Reset()
    {
        self.position.y = 380
        self.isColliding = false

    }
    
    override func Start()
    {
        self.zPosition = 1
        self.Reset()
        
        self.dy = CGFloat(Int.random(in: 10..<19))
    }
    
    override func Update()
    {
        self.Move()
        self.CheckBounds()
    }
}

