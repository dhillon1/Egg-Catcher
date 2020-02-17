//
//  basket.swift
//  Egg Catcher
//  Project name = Egg Catcher
//  Developed by = Harmandeep Kaur (301092579) and Simranjeet Singh Dhillon (301093914)
//  Description = Basket class
//  Date modified = 16-02-2020
//  Copyright © 2020 centennialcollege. All rights reserved.
//

import SpriteKit

//class
class basket:GameObject{
    
    init()
    {
        super.init(imageString: "basket", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //functions
    override func CheckBounds()
    {
        // top  boundary
        if(self.position.y >= 100)
        {
            self.position.y = 100
        }
        // bottom boundary
        if(self.position.y <= -540)
        {
            self.position.y = -540
        }
        
        // right boundary
        if(self.position.x >= 320 - 95)
        {
            self.position.x = 320 - 95
        }
        
        // left boundary
        if(self.position.x <= -320 + 95)
        {
            self.position.x = -320 + 95
        }
    }
    
    override func Reset()
    {
    }
    
    override func Start()
    {
        self.zPosition = 2
    }
    
    override func Update()
    {
        self.CheckBounds()
    }
    
    func TouchMove(newPos: CGPoint)
    {
        self.position = newPos
    }
}
