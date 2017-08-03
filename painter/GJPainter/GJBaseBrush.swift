//
//  GJBaseBrush.swift
//  painter
//
//  Created by Xcode on 2017/6/12.
//  Copyright © 2017年 wtfcompany. All rights reserved.
//

import CoreGraphics

protocol GJPaintBrush {
    func supportedContinuousDrawing() -> Bool
    
    func drawInContext(context: CGContext)
}

class GJBaseBrush: NSObject, GJPaintBrush {
    
    var beginPoint: CGPoint!
    var endPoint: CGPoint!
    var lastPoint: CGPoint! //筆這一類的筆刷才會用到，工具類筆刷用不到
    var strokeWidth: CGFloat!
    
    func supportedContinuousDrawing() -> Bool {
        return false
    }

    func drawInContext(context: CGContext) {
        assert(false, "must implement in subclass")
        
    }
}
