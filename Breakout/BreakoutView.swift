//
//  BreakoutView.swift
//  Breakout
//
//  Created by Florian Bienefelt on 7/12/16.
//  Copyright © 2016 Florian Bienefelt. All rights reserved.
//

import UIKit

@IBDesignable
class BreakoutView: NamedBezierPathsView, UIDynamicAnimatorDelegate {
    
    
    // Model
    var animating: Bool = false {
        didSet {
            if animating {
                animator.addBehavior(brickBehavior)
            } else {
                animator.removeBehavior(brickBehavior)
            }
        }
    }
    
    // Private Properties
    private var paddle: UIView?
    private let brickBehavior = BrickBehavior()
    private var brickSize: CGSize {
        let width = (bounds.size.width / Constants.Columns) * (1 - Constants.HorizontalSpacing)
        let height = ((bounds.size.height * Constants.BrickSpace) / Constants.Rows) * (1 - Constants.VerticalSpacing)
        
        return CGSize(width: width, height: height)
    }
    private lazy var animator: UIDynamicAnimator = {
        let animator = UIDynamicAnimator(referenceView: self)
        animator.delegate = self
        return animator
    }()
    
    
    // Setup Functions
    func addBricks() {
        for i in 0...Int(Constants.Rows - 1) {
            for j in 0...Int(Constants.Columns - 1) {
                var frame = CGRect(origin: CGPointZero, size: brickSize)
                frame.origin.x = (bounds.width / Constants.Columns) * (CGFloat(j) + Constants.HorizontalSpacing / 2)
                frame.origin.y = CGFloat(i) * (bounds.height / Constants.Rows) * Constants.BrickSpace + Constants.TopPadding // proportion of the screen with bricks
                let brick = UIView(frame: frame)
                brick.backgroundColor = UIColor.blueColor()
                
                addSubview(brick)
                brickBehavior.addBrick(brick)
            }
        }
    }
    
    func addPaddle() {
        let paddleSize = CGSize(width: bounds.width * Constants.PaddleWidth, height: bounds.height * Constants.PaddleHeight)
        var frame = CGRect(origin: CGPointZero, size: paddleSize)
        frame.origin.x = (bounds.width / 2) * (1 - Constants.PaddleWidth)
        frame.origin.y = bounds.height * Constants.PaddleLocation
        
        
        paddle = UIView(frame: frame)
        paddle!.backgroundColor = UIColor.redColor()
        
        addSubview(paddle!)
        itemBehavior.addPaddle(paddle!)
    }
    
    func addBall() {
//        let ballPath = UIBezierPath(ovalInRect: CGRect(origin: CGPoint(x: bounds.midX, y : bounds.midY), size: CGSize(width: Constants.BallSize, height: Constants.BallSize)))
//        bezierPaths[PathNames.Ball] = ballPath
//        itemBehavior.addBall(ballPath, name: PathNames.Ball)
        
        var frame = CGRect(origin: CGPointZero, size: CGSize(width: Constants.BallSize, height: Constants.BallSize))
        frame.origin.x = bounds.midX
        frame.origin.y = bounds.midY
        
        let ball = UIView(frame: frame)
        ball.backgroundColor = UIColor.redColor()
        
        addSubview(ball)
        itemBehavior.addBall(ball)
        
    }

    // General Functions
    func setPaddlePosition(xTranslation: CGFloat) {
        if (paddle!.frame.origin.x + xTranslation + Constants.PaddleWidth * bounds.width) > bounds.width {
            paddle!.frame.origin.x = bounds.width - Constants.PaddleWidth * bounds.width
        } else if (paddle!.frame.origin.x + xTranslation) < 0 {
            paddle!.frame.origin.x = 0
        } else {
            paddle!.frame.origin.x += xTranslation
        }
    }
    
    
    private struct PathNames {
        static let Ball = "Ball"
    }

}
