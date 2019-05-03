//
//  ViewController.swift
//  ECGDraw
//
//  Created by Yassir RAMDANI on 5/3/19.
//  Copyright © 2019 Yassir RAMDANI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let ECGShape = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.addSublayer(ECGShape)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ECGDraw()
        
    }

    func ECGDraw() {
        let x = CGFloat(0)
        let y = view.center.y
        let startingPoint = CGPoint(x: x, y: y)
        let endPoint = CGPoint(x: x + view.bounds.width, y: y)
        
        let path = UIBezierPath()
        
        path.move(to: startingPoint)
        path.addLine(to: endPoint)
        
        ECGShape.strokeColor = UIColor.red.cgColor
        ECGShape.path = path.cgPath


        

        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        ECGShape.add(animation, forKey: "line")
    }

}

