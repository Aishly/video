//
//  ViewController.swift
//  Video
//
//  Created by Pooja Negi on 12/04/18.
//  Copyright © 2018 PNKBKSH. All rights reserved.
//
import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController{
    
    @IBOutlet weak var playVideo: UIView!
    
    
    var playerController = AVPlayerViewController()
    var timer = Timer()
    var radomNumTimer = Timer()
    var videoNumber:String?

    override func viewDidLoad() {
       super.viewDidLoad()
        
        self.timer = Timer.scheduledTimer(
            timeInterval: 10.0, //in seconds
            target: self,
            selector: #selector(self.randomVideo),
            userInfo: nil,
            repeats: true)
    
    }
  
    //video name is 1, 2,3 so using random num.
    @objc func randomVideo(){

        videoNumber = String(randomNumber())
        let path = Bundle.main.path(forResource:videoNumber, ofType: "mp4")
        let url = NSURL(fileURLWithPath: path!)
        let player = AVPlayer(url:url as URL)
        
        playerController = AVPlayerViewController()
    
        NotificationCenter.default.addObserver(self, selector: #selector(self.stopPlaying(note:)),name:NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
    
        playerController.player = player
        playerController.allowsPictureInPicturePlayback = true
        playerController.delegate = self
        playerController.player?.play()
        self.present(playerController,animated:true,completion:nil)
    }
   
    @objc func stopPlaying(note : NSNotification) {
        playerController.dismiss(animated: true,completion: nil)
        let alertview = UIAlertController(title:"finished",message:"video finished",preferredStyle: .alert)
        alertview.addAction(UIAlertAction(title:"Ok",style: .default, handler: nil))
        self.present(alertview,animated:true,completion: nil)
    }
    
}


extension ViewController:AVPlayerViewControllerDelegate{
    
    func playerViewController(_ playerViewController: AVPlayerViewController, restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: @escaping (Bool) -> Void) {
        let currentviewController =  navigationController?.visibleViewController
        if currentviewController != playerViewController{
            currentviewController?.present(playerViewController,animated: true,completion:nil)
        }
    }
}

extension ViewController{
     func randomNumber(range: ClosedRange<Int> = 1...4) -> Int {
        let min = range.lowerBound
        let max = range.upperBound
        videoNumber = String(Int(arc4random_uniform(UInt32(1 + max - min))) + min)
        return Int(arc4random_uniform(UInt32(1 + max - min))) + min
    }
}
