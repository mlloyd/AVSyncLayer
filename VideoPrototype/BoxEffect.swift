//
//  BoxEffect.swift
//  VideoPrototype
//
//  Created by Martin Lloyd on 10/10/2016.
//  Copyright © 2016 Martin Lloyd. All rights reserved.
//

import UIKit

final class BoxEffect: BasicEffectLayer {
    
    let redLayer = CALayer()
    let text = CATextLayer()
    var color: UIColor!
    
    override func buildEffect() {
        redLayer.frame = CGRect(x: 0, y: 50, width: k16x9VideoRect.width, height: 5)
        redLayer.backgroundColor = color.cgColor
        redLayer.anchorPoint = CGPoint(x: 0.5, y: 0)
        redLayer.contentsScale = UIScreen.main.scale
        self.effectLayer.addSublayer(redLayer)
        
        text.string = "Hello world \(time)"
        text.foregroundColor = UIColor.white.cgColor
        text.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        text.contentsScale = UIScreen.main.scale
        text.fontSize = 10.0
        self.redLayer.addSublayer(text)
        
        let heightAnimation = CABasicAnimation(keyPath: "bounds.size.height")
        heightAnimation.beginTime = time
        heightAnimation.fromValue = 0
        heightAnimation.toValue   = 80
        heightAnimation.duration  = 2
        heightAnimation.fillMode  = kCAFillModeForwards
        heightAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.2, 0.4, 0.1, 1.0)
        heightAnimation.isRemovedOnCompletion = false
        
        let heightAnimation1 = CABasicAnimation(keyPath: "bounds.size.height")
        heightAnimation1.beginTime = time + 3
        heightAnimation1.fromValue = 80
        heightAnimation1.toValue   = 10
        heightAnimation1.duration  = 2
        heightAnimation1.fillMode  = kCAFillModeForwards
        heightAnimation1.timingFunction = CAMediaTimingFunction(controlPoints:0.9, 0.0, 0.8, 0.6)
        heightAnimation1.isRemovedOnCompletion = false
        
        redLayer.add(heightAnimation, forKey: nil)
        redLayer.add(heightAnimation1, forKey: nil)
    }
}
