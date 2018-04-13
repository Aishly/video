//
//  CustomView.swift
//  Video
//
//  Created by Pooja Negi on 12/04/18.
//  Copyright © 2018 PNKBKSH. All rights reserved.
//

import Foundation
import UIKit

class CustomAlert: UIView , Modal{
    
    var backgroundView  = UIView()
    var dialogView      = UIView()
    var imageView       = UIImageView()
    
    convenience init(title:String,image:UIImage) {
        self.init(frame: UIScreen.main.bounds)
        initialize(title: title, image: image)
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize(title:String, image:UIImage){
        
        dialogView.clipsToBounds                = true
        backgroundView.frame                    = frame
        backgroundView.backgroundColor          = UIColor.black
        backgroundView.alpha                    = 0.6
        addSubview(backgroundView)
       
        let dialogViewWidth                     = frame.width-200
        let titleLabel                          = UILabel(frame: CGRect(x: 0, y: 0, width: dialogViewWidth, height: 30))
        let separatorLineView                   = UIView()
     
        titleLabel.text                         = title
        titleLabel.textAlignment                = .center
        dialogView.addSubview(titleLabel)
        
        separatorLineView.frame.origin          = CGPoint(x: 0, y: titleLabel.frame.height + 8)
        separatorLineView.frame.size            = CGSize(width: dialogViewWidth, height: 1)
        separatorLineView.backgroundColor       = UIColor.clear
        dialogView.addSubview(separatorLineView)
        
        imageView.frame.origin                  = CGPoint(x: (dialogViewWidth-50)/2, y: separatorLineView.frame.height + separatorLineView.frame.origin.y + 8)
        imageView.frame.size                    = CGSize(width: 35 , height: 35)
        imageView.image                         = image
        imageView.layer.cornerRadius            = 4
        imageView.clipsToBounds                 = true
        imageView.tintColor                     = UIColor.purple
        imageView.rotate360Degrees()
        dialogView.addSubview(imageView)
       
        let dialogViewHeight                    = titleLabel.frame.height + 8 + separatorLineView.frame.height + 8 + imageView.frame.height + 15
        dialogView.frame.origin                 = CGPoint(x: 32, y: frame.height)
        dialogView.frame.size                   = CGSize(width: dialogViewWidth, height: dialogViewHeight)
        dialogView.backgroundColor              = UIColor.clear
        dialogView.alpha                        = 0.5
        dialogView.layer.cornerRadius           = 6
        addSubview(dialogView)
    }
    
    @objc func didTappedOnBackgroundView(){
        dismiss(animated: true)
    }
    
}

