//
//  BreakoutViewController.swift
//  Breakout
//
//  Created by Florian Bienefelt on 7/12/16.
//  Copyright © 2016 Florian Bienefelt. All rights reserved.
//

import UIKit

class BreakoutViewController: UIViewController {

    @IBOutlet weak var GameView: BreakoutView! {
        didSet {
            GameView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(movePaddle(_:))))
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)


    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        GameView.addBricks()
        GameView.addPaddle()
        GameView.addBall()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        GameView.animating = true
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        GameView.animating = false
    }


    func movePaddle(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .Changed, .Ended:
            GameView.setPaddlePosition(recognizer.translationInView(GameView).x)
            recognizer.setTranslation(CGPointZero, inView: GameView)
        default: break
        }
    }

}
