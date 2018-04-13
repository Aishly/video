//
//  IBDesign.swift
//  Video
//
//  Created by Pooja Negi on 12/04/18.
//  Copyright © 2018 PNKBKSH. All rights reserved.
//

import UIKit

//MARK:- VBL
//corner radius and design for objects
@IBDesignable
class DesignableView: UIView {
}

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableLabel: UILabel {
}

@IBDesignable
class DesignableTextfield: UITextField {
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}


//MARK:- ZIG zag Design
@IBDesignable class zigZag: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        zigZagUpdate()
    }
    @IBInspectable var zigzag: Bool = false {
        didSet {
            zigZagUpdate()
        }
    }
    
    @IBInspectable var zigzagWidth: CGFloat = 5.0 {
        didSet { zigZagUpdate() }
    }
    
    @IBInspectable var zigzagHeight: CGFloat = 3.0 {
        didSet { zigZagUpdate() }
    }
    
    
    func zigZagUpdate() {
        let width = self.frame.size.width
        let height = self.frame.size.height
        let zigZagWidth = zigzagWidth
        let zigZagHeight = zigzagHeight
        
        var yInitial = height-zigZagHeight
        let zigZagPath = UIBezierPath()
        zigZagPath.move(to: CGPoint(x:0, y:0))
        zigZagPath.addLine(to: CGPoint(x:0, y:yInitial))
        
        var slope = -1
        var x = CGFloat(0)
        var i = 0
        while x < width {
            x = zigZagWidth * CGFloat(i)
            let p = zigZagHeight * CGFloat(slope)
            let y = yInitial + p
            let point = CGPoint(x: x, y: y)
            zigZagPath.addLine(to: point)
            slope = slope*(-1)
            i += 1
        }
        
        zigZagPath.addLine(to: CGPoint(x:width,y: 0))
        
        // draw the line from top right to Bottom
        zigZagPath.addLine(to: CGPoint(x:width,y:height))
        
        yInitial = 0 + zigZagHeight
        x = CGFloat(width)
        i = 0
        while x > 0 {
            x = width - (zigZagWidth * CGFloat(i))
            let p = zigZagHeight * CGFloat(slope)
            let y = yInitial + p
            let point = CGPoint(x: x, y: y)
            zigZagPath.addLine(to: point)
            slope = slope*(-1)
            i += 1
        }
        
        // Now Close the path
        zigZagPath.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = zigZagPath.cgPath
        self.layer.mask = shapeLayer
    }
    
}


@IBDesignable class ActivityIndicatorCircle: UIView {
    
    var timerInterval: Double   = 0.5
    var timer: Timer?
    var endAngle: CGFloat       = 0.0
    var angleStep               = CGFloat.pi / 20.0
    var angleOffset             = -CGFloat.pi / 2.0
    var shapeLayer              = CAShapeLayer()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func startAnimatingCounter() {
        
        DispatchQueue.main.async(execute: {
            self.superview?.bringSubview(toFront: self)
            self.layer.cornerRadius = self.frame.width / 2
            self.clipsToBounds = true
            
            self.isHidden = false
            self.timer?.invalidate()
            self.self.timer = nil
            self.timer = Timer.scheduledTimer(timeInterval: self.timerInterval,
                                              target: self,
                                              selector: #selector(self.updateCircle),
                                              userInfo: nil,
                                              repeats: true)
        })
    }
    
    func stopAnimatingCounter() {
        isHidden = true
        timer?.invalidate()
        timer = nil
    }
    
    @objc func updateCircle() {
        
        endAngle += angleStep
        if endAngle > CGFloat.pi * 2.0 {
            endAngle -= CGFloat.pi * 2.0
        }
        DispatchQueue.main.async {
            self.shapeLayer.removeFromSuperlayer() // remove the previous version
            let lineWidth: CGFloat = 2.0
            let radius = self.frame.size.width / 2.0 // if the view is square, this gives us center as well
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: radius,y: radius), radius: radius - lineWidth, startAngle: self.angleOffset, endAngle: self.endAngle + self.angleOffset, clockwise: true)
            
            self.shapeLayer.path        = circlePath.cgPath
            self.shapeLayer.position    = CGPoint(x: 0, y: 0)
            self.shapeLayer.fillColor   = UIColor.clear.cgColor
            self.shapeLayer.strokeColor = UIColor.green.cgColor
            self.shapeLayer.lineWidth   = lineWidth
            self.shapeLayer.lineJoin    =  kCALineJoinRound
            self.layer.addSublayer(self.shapeLayer)
        }
    }
}

@IBDesignable class RoundImage: UIImageView{
    override func layoutSubviews() {
        super.layoutSubviews()
        updateImage()
    }
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateImage()
        }
    }
    func updateImage() {
        self.layer.cornerRadius     = self.layer.frame.size.width/2
        self.layer.borderWidth  = 1.5
        self.layer.borderColor = self.tintColor.cgColor
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }
}

