//
//  BasicEffectLayer.swift
//  VideoPrototype
//
//  Created by Martin Lloyd on 10/10/2016.
//  Copyright © 2016 Martin Lloyd. All rights reserved.
//

import UIKit

class BasicEffectLayer: CALayer {
    
    let effectLayer = CALayer()
    var time: TimeInterval = 0
    
    func setup(time: TimeInterval, duration: TimeInterval) {
        
        self.effectLayer.anchorPoint = CGPoint(x: 0, y: 0)
        
        self.effectLayer.borderColor = UIColor.yellow.cgColor
        self.effectLayer.borderWidth = 1.0
        
        self.time = time
        
        self.effectLayer.frame = k16x9VideoRect
        self.effectLayer.isOpaque = true
        self.effectLayer.backgroundColor = UIColor.clear.cgColor
        self.effectLayer.opacity = 0.0
        self.effectLayer.contentsScale = UIScreen.main.scale
        self.addSublayer(self.effectLayer)
        
        self.buildEffect()
        
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.beginTime = time
        opacityAnimation.duration = duration
        opacityAnimation.keyTimes = [0,0.01,0.99,1]
        opacityAnimation.values = [1,1,1,0]
        opacityAnimation.fillMode  = kCAFillModeForwards
        opacityAnimation.isRemovedOnCompletion = false
        
        self.effectLayer.add(opacityAnimation,  forKey: nil)
    }
    
    func buildEffect() {
        fatalError()
    }
}
