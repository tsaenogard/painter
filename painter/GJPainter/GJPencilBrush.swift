//
//  GJPencilBrush.swift
//  painter
//
//  Created by Xcode on 2017/6/12.
//  Copyright © 2017年 wtfcompany. All rights reserved.
//

import UIKit

class GJPencilBrush: GJBaseBrush {
    override func supportedContinuousDrawing() -> Bool {
        return true
    }
    
    override func drawInContext(context: CGContext) {
        if let lastPoint = self.lastPoint {
            context.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
            context.addLine(to: CGPoint(x: self.endPoint.x, y: self.endPoint.y))
        }else {
            context.move(to: CGPoint(x: self.beginPoint.x, y: self.beginPoint.y))
            context.addLine(to: CGPoint(x: self.endPoint.x, y: self.endPoint.y))
        }
    }
}
