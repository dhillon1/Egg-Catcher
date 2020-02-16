//
//  eggs.swift
//  Egg Catcher
//
//  Created by Simran on 2020-02-12.
//  Copyright © 2020 centennialcollege. All rights reserved.
//

import SpriteKit
import GameplayKit

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
        
        if(self.position.y < -400)
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

