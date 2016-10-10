//
//  PlayerView.swift
//  VideoPrototype
//
//  Created by Martin Lloyd on 10/10/2016.
//  Copyright © 2016 Martin Lloyd. All rights reserved.
//

import UIKit
import AVFoundation

final class PlayerView: UIView {
    
    let syncContainer = UIView(frame: CGRect.zero)
    var syncLayer: AVSynchronizedLayer? {
        didSet {
            syncLayer?.removeFromSuperlayer()
            
            if let syncLayer = syncLayer {
                syncContainer.layer.addSublayer(syncLayer)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(syncContainer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let videoWidth: CGFloat = bounds.width / k16x9VideoRect.size.width
        //        let scale = fmin(bounds.width / videoWidth, bounds.height / k16x9VideoSize.height);
        syncContainer.transform = CGAffineTransform(scaleX: videoWidth, y: videoWidth)
    }
}
