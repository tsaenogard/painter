//
//  GJPainter.swift
//  painter
//
//  Created by Xcode on 2017/6/12.
//  Copyright © 2017年 wtfcompany. All rights reserved.
//

import UIKit

enum DrawingState {
    case began, moved, ended
}

class GJPainter: UIImageView {
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var brush: GJBaseBrush?
    
    private var strokeWidth: CGFloat!
    private var strokeColor: UIColor!
    private var realImage: UIImage!
    private var drawingState: DrawingState!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initPainter()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initPainter()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let brush = self.brush, let touch = touches.first {
            brush.lastPoint = nil
            brush.beginPoint = touch.location(in: self)
            brush.endPoint = brush.beginPoint
            self.drawingState = .began
            self.drawingImage()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let brush = self.brush, let touch = touches.first {
            brush.endPoint = touch.location(in: self)
            self.drawingState = .moved
            self.drawingImage()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let brush = self.brush, let touch = touches.first {
            brush.endPoint = touch.location(in: self)
            self.drawingState = .ended
            self.drawingImage()
        }
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let brush = self.brush {
            brush.endPoint = nil
        }
    }
    
    //MARK: - function
    private func initPainter() {
        self.strokeColor = UIColor.white
        self.strokeWidth = 2.0
        self.isUserInteractionEnabled = true
    }
    
    private func drawingImage() {
        if let brush = self.brush {
            UIGraphicsBeginImageContext(self.bounds.size)
            let context = UIGraphicsGetCurrentContext()
            UIColor.clear.setFill()
            UIRectFill(self.bounds)
            //填滿畫紙
            
            context?.setLineCap(CGLineCap.round)
            context?.setLineWidth(self.strokeWidth)
            context?.setStrokeColor(self.strokeColor.cgColor)
            //畫紙屬性
            if let realImage = self.realImage {
                realImage.draw(in: self.bounds)
            }
            
            brush.strokeWidth = self.strokeWidth
            brush.drawInContext(context: context!)
            //畫筆屬性
            context?.strokePath() //畫直線
            
            let previewImage = UIGraphicsGetImageFromCurrentImageContext()
            //將image存起來
            if self.drawingState == .ended || brush.supportedContinuousDrawing() {
                self.realImage = previewImage
            }
            UIGraphicsEndImageContext()
            self.image = previewImage
            brush.lastPoint = brush.endPoint
            
            UIGraphicsEndPDFContext()
        }
    }

}
