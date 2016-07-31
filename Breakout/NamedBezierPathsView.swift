//
//  NamedBezierPathsView.swift
//  Breakout
//
//  Created by Florian Bienefelt on 7/12/16.
//  Copyright © 2016 Florian Bienefelt. All rights reserved.
//

import UIKit

class NamedBezierPathsView: UIView {

    var bezierPaths = [String: UIBezierPath]() { didSet { setNeedsDisplay() } }
    
    override func drawRect(rect: CGRect) {
        for (_, path) in bezierPaths {
            UIColor.blackColor().set()
            path.fill()
            path.stroke()
        }
    }
    
}
