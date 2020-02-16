//
//  basket.swift
//  Egg Catcher
//
//  Created by Simran on 2020-02-12.
//  Copyright © 2020 centennialcollege. All rights reserved.
//

import SpriteKit

class basket:GameObject{
    
    init()
    {
        super.init(imageString: "basket", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func CheckBounds()
    {
        // right boundary
        if(self.position.x >= 320 - 150)
        {
            self.position.x = 320 - 150
        }
        
        // left boundary
        if(self.position.x <= -307 + self.halfWidth!)
        {
            self.position.x = -307 + self.halfWidth!
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
