//
//  ViewController.swift
//  VideoPrototype
//
//  Created by Martin Lloyd on 07/10/2016.
//  Copyright © 2016 Martin Lloyd. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

let k16x9VideoSize = CGSize(width: 640, height: 360)
let k16x9VideoRect = CGRect(x: 0, y: 0, width: 375, height: 211)

fileprivate extension UIView {
    func equalEdges(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

class ViewController: UIViewController {
    
    var streamURL: URL {
        let path = Bundle.main.path(forResource: "SampleVideo_720x480_50mb", ofType: "mp4")!
        return URL(fileURLWithPath: path)
    }
    
    var player                    : AVPlayer!
    let videoPlayerViewController = AVPlayerViewController()
    let syncLayer                 = AVSynchronizedLayer()
    var playerLayer               : AVPlayerLayer!
    let playerView                = PlayerView()
    
    @IBOutlet weak var viewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = AVPlayer(url: streamURL)
        
        viewContainer.addSubview(videoPlayerViewController.view)
        self.addChildViewController(videoPlayerViewController)
        videoPlayerViewController.view.equalEdges(view: viewContainer)
        videoPlayerViewController.player = player
        videoPlayerViewController.videoGravity = AVLayerVideoGravityResizeAspectFill
        videoPlayerViewController.contentOverlayView?.addSubview(playerView)
        playerView.equalEdges(view: videoPlayerViewController.contentOverlayView!)
        
//        playerLayer = AVPlayerLayer(player: player)
//        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
//        viewContainer.layer.addSublayer(playerLayer)
//        viewContainer.addSubview(playerView)
//        playerView.equalEdges(view: viewContainer)
        
        syncLayer.playerItem = player.currentItem
        playerView.syncLayer = syncLayer
        
        for i in 0..<100 {
            let time = i * 10
            let effectLayer = BoxEffect()
            
            effectLayer.color = (i%2)==0 ? .red: .blue
            effectLayer.setup(time: TimeInterval(time), duration: TimeInterval(8))
            syncLayer.addSublayer(effectLayer)
        }
        
        player.play()
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        self.playerLayer.frame = self.viewContainer.layer.bounds
//    }
}
