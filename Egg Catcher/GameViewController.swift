//
//  GameViewController.swift
//  Egg Catcher
//  Project name = Egg Catcher
//  Developed by = Harmandeep Kaur (301092579) and Simranjeet Singh Dhillon (301093914)
//  Description = Score class
//  Date modified = 16-02-2020
//  Copyright © 2020 centennialcollege. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var live: UILabel!
    @IBOutlet weak var gameover: UIButton!
    @IBOutlet weak var yourscore: UILabel!
    @IBOutlet weak var highscore: UILabel!
    @IBOutlet weak var startGame: UILabel!
    
    @IBAction func startgame(_ sender: Any) {
        score.isHidden = false
        live.isHidden = false
        gameover.isHidden = true
        yourscore.isHidden = true
        highscore.isHidden = true
        startGame.isHidden = true
        
        score.text  = "Score  \(Score.Score)"
        live.text  = "Live  \(Score.Lives)"
        
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        score.isHidden = true
        live.isHidden = true
        gameover.isHidden = true
        yourscore.isHidden = true
        highscore.isHidden = true
        
        CollisionManager.gameViewController = self
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "start") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // update score
    func updateScoreLabel() -> Void
    {
        score.text  = "Score  \(Score.Score)"
    }
    
    // update live
    func updateLives() -> Void {
        live.text = "Live  \(Score.Lives)"
        if(Score.Lives <= 0){
            if let view = self.view as! SKView? {
                // Load the SKScene from 'GameScene.sks'
                if let scene = SKScene(fileNamed: "end") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    
                    // Present the scene
                    view.presentScene(scene)
                }
                
            }
            score.isHidden = true
            live.isHidden = true
            gameover.isHidden = false
            yourscore.isHidden = false
            highscore.isHidden = false
            startGame.isHidden = false
            
            
            yourscore.text  = "Your Score  \(Score.Score)"
            if(Score.HighScore < Score.Score){
                Score.HighScore = Score.Score
                highscore.text =  "High Score  \(Score.HighScore)"
            }
            Score.Score = 0
            Score.Lives = 4
            
        }
    }
    
    
    
}
