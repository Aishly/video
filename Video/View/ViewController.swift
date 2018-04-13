//
//  ViewController.swift
//  Video
//
//  Created by Pooja Negi on 12/04/18.
//  Copyright © 2018 PNKBKSH. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController{
    
    @IBOutlet weak var video_view:UIView!
    
    var player : AVPlayer!
    var playerLayer:AVPlayerLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string:"https://www.youtube.com/watch?v=EuQLMXyGQOE")!
        player = AVPlayer(url: url)
        
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspect
        
        video_view.layer.addSublayer(playerLayer)
    }

   
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        DispatchQueue.main.async {
             self.player?.play()
        }
        
    }
   

}

