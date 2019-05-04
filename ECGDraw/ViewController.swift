//
//  ViewController.swift
//  ECGDraw
//
//  Created by Yassir RAMDANI on 5/3/19.
//  Copyright © 2019 Yassir RAMDANI. All rights reserved.
//

import UIKit

extension CGPoint {
    static func + (p1: CGPoint, p2: CGPoint) -> CGPoint {
        let p = CGPoint(x: p1.x + p2.x, y: p1.y + p2.y)
        return p
    }
}

class ViewController: UIViewController {

    let ECGShape = CAShapeLayer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.addSublayer(ECGShape)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let tap = UITapGestureRecognizer(target: self, action: #selector(ECGDraw))
        view.addGestureRecognizer(tap)
        ECGDraw()
    }
    
    func addSingleECG(path: UIBezierPath, checkPoint:inout CGPoint) {
        let epsilon = CGFloat.random(in: -12...12)
        path.addLine(to: checkPoint)
        checkPoint = checkPoint + CGPoint(x: 40, y: 0)
        path.addQuadCurve(to: checkPoint, controlPoint: checkPoint + CGPoint(x: -20, y: -38 + epsilon/2))
        checkPoint = checkPoint + CGPoint(x: 10, y: 0)
        path.addLine(to: checkPoint)
        checkPoint = checkPoint + CGPoint(x: 10, y: 22)
        path.addLine(to: checkPoint)
        checkPoint = checkPoint + CGPoint(x: 10, y: -22 - 140 - 6 * epsilon)
        path.addLine(to: checkPoint)
        checkPoint = checkPoint + CGPoint(x: 10, y: +22 + 140 + 50 + 10 * epsilon)
        path.addLine(to: checkPoint)
        checkPoint = checkPoint + CGPoint(x: 10, y: -22 - 50 - 4 * epsilon)
        path.addLine(to: checkPoint)
        checkPoint = checkPoint + CGPoint(x: 30, y: 0)
        path.addLine(to: checkPoint)
        checkPoint = checkPoint + CGPoint(x: 60, y: 0)
        path.addQuadCurve(to: checkPoint, controlPoint: checkPoint + CGPoint(x: -30, y: -50 - 2 * epsilon))
        checkPoint = checkPoint + CGPoint(x: 30, y: 0)
        path.addLine(to: checkPoint)
    }
    
    @objc func ECGDraw() {
        let x = CGFloat(0)
        let y = view.center.y
        let startingPoint = CGPoint(x: x, y: y)
        let endPoint = CGPoint(x: x + view.bounds.width, y: y)
        
        let path = UIBezierPath()
        path.move(to: startingPoint)
        
        // Logic of Drawing
        var checkPoint = startingPoint+CGPoint(x: 20, y: 0)

        addSingleECG(path: path, checkPoint: &checkPoint)
        addSingleECG(path: path, checkPoint: &checkPoint)
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

