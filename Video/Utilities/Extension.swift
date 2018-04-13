//
//  Extension.swift
//  Video
//
//  Created by Pooja Negi on 12/04/18.
//  Copyright © 2018 PNKBKSH. All rights reserved.
//

import UIKit

extension UIView{
    
    //Roate view 360 degree
    func rotate360Degrees(duration: CFTimeInterval = 1.5, completionDelegate: AnyObject? = nil) {
        
        let rotateAnimation         = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue   = 0.0
        rotateAnimation.toValue     = CGFloat(Double.pi * 2.0)
        rotateAnimation.duration    = duration
        rotateAnimation.repeatCount = Float.infinity
        
        DispatchQueue.main.async(execute: {
            if let delegate: AnyObject = completionDelegate {
                rotateAnimation.delegate = delegate as? CAAnimationDelegate
            }
            self.layer.add(rotateAnimation, forKey: nil)
        })
    }
}


extension UIViewController{
    // MARK: Alerts view
    func showAlert(title: String?, message: String?, buttonTitle: String?){
        let alertVC     = UIAlertController(title: title != nil ? title! : nil, message: message != nil ? message! : nil, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: buttonTitle != nil ? buttonTitle : "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}
