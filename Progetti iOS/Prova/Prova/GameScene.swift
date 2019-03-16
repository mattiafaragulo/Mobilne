//
//  GameScene.swift
//  Prova
//
//  Created by Mattia on 26/07/18.
//  Copyright © 2018 Mattia. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let pallaBasket = SKSpriteNode(imageNamed: "ball-159232_960_720")
    
    override func didMove(to view: SKView) {
        pallaBasket.size = CGSize(width: 300, height: 300)
        pallaBasket.position = CGPoint(x: frame.width/24-4, y: frame.height/24)
        self.addChild(pallaBasket)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: pallaBasket)
            let palla = SKSpriteNode(imageNamed: "ball-159232_960_720")
            palla.size = CGSize(width: 150, height: 150)
            palla.position = pallaBasket.position
            palla.physicsBody = SKPhysicsBody(circleOfRadius: palla.size.width/2)
            //palla.physicsBody?.affectedByGravity = true
            self.addChild(palla)
            var dx = CGFloat(location.x - pallaBasket.position.x)
            var dy = CGFloat(location.y - pallaBasket.position.y)
            let modulo = sqrt(dx*dx + dy*dy)
            dx = dx/modulo
            dy /= modulo
            let vector = CGVector(dx: dx*100,dy: dy*100)
            palla.physicsBody?.applyImpulse(vector)
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
