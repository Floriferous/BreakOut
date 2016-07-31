//
//  ObjectBehavior.swift
//  Breakout
//
//  Created by Florian Bienefelt on 7/27/16.
//  Copyright © 2016 Florian Bienefelt. All rights reserved.
//

import UIKit

class BrickBehavior: UIDynamicBehavior {
    
    private let collider: UICollisionBehavior = {
        let collider = UICollisionBehavior()
        collider.translatesReferenceBoundsIntoBoundary = true
        return collider
    }()
    
    private let itemBehavior: UIDynamicItemBehavior = {
        let dib = UIDynamicItemBehavior()
        dib.allowsRotation = false
        dib.elasticity = 1.0
        dib.friction = 0.0
        dib.resistance = 0.0
        return dib
    }()
    
    override init() {
        super.init()
        addChildBehavior(collider)
        addChildBehavior(itemBehavior)
    }
    
    
    func addPaddle(item: UIDynamicItem) {
        collider.addItem(item)
    }
    
//    func addBall(path: UIBezierPath, name: String) {
//        collider.removeBoundaryWithIdentifier(name)
//        collider.addBoundaryWithIdentifier(name, forPath: path)
//        
//        itemBehavior.addLinearVelocity(CGPoint(x: 10.0, y: 10.0), forItem: path)
//    }

    func addBall(item: UIDynamicItem) {
        collider.addItem(item)
        itemBehavior.addItem(item)
        itemBehavior.addLinearVelocity(CGPoint(x: 200.0, y: 200.0), forItem: item)
    }
    
    func addBrick(item: UIDynamicItem) {
        collider.addItem(item)
    }
    
}
