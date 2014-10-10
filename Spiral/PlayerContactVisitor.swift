//
//  PlayerContactVisitor.swift
//  Spiral
//
//  Created by 杨萧玉 on 14-7-14.
//  Copyright (c) 2014年 杨萧玉. All rights reserved.
//

import Foundation
import SpriteKit
class PlayerContactVisitor:ContactVisitor{
    func visitPlayer(body:SKPhysicsBody){
        let thisNode = self.body.node
        let otherNode = body.node
//        println(thisNode.name+"->"+otherNode.name)
    }
    func visitKiller(body:SKPhysicsBody){
        let thisNode = self.body.node as Player
        let otherNode = body.node!
//        println(thisNode.name+"->"+otherNode.name)
        if thisNode.shield {
            otherNode.removeFromParent()
            thisNode.shield = false
            (thisNode.parent as GameScene).soundManager.playKiller()
        }
        else {
            Data.gameOver = true
        }
    }
    func visitScore(body:SKPhysicsBody){
        let thisNode = self.body.node as Player
        let otherNode = body.node
//        println(thisNode.name+"->"+otherNode.name)
        otherNode!.removeFromParent()
        Data.score += 2
        (thisNode.parent as GameScene).soundManager.playScore()
    }
    func visitShield(body:SKPhysicsBody){
        let thisNode = self.body.node as Player
        let otherNode = body.node
        otherNode!.removeFromParent()
        thisNode.shield = true
        Data.score++
        (thisNode.parent as GameScene).soundManager.playShield()
    }
}