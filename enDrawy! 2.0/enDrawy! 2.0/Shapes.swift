//
//  Shapes.swift
//  enDrawy! 2.0
//
//  Created by WENNAN SHI on 4/26/18.
//  Copyright © 2018 WENNAN SHI. All rights reserved.
//

import UIKit

enum ShapeSelect: Int
{
    case oval = 0
    case rectangle
    case roundedRect
    case triangle
    case line
    case freeStyle
    case eraser
}

class ShapePath: UIBezierPath
{
    func oval(startPoint: CGPoint, translationPoint: CGPoint) -> UIBezierPath
    {
        return UIBezierPath(ovalIn: CGRect(x: startPoint.x, y: startPoint.y, width: translationPoint.x, height: translationPoint.y))
    }
    
    func rectangle(startPoint: CGPoint, translationPoint: CGPoint) -> UIBezierPath
    {
        return UIBezierPath(rect: CGRect(x: startPoint.x, y: startPoint.y, width: translationPoint.x, height: translationPoint.y))
    }
    
    func roundedRect(startPoint: CGPoint, translationPoint: CGPoint) -> UIBezierPath
    {
        return UIBezierPath(roundedRect: CGRect(x: startPoint.x, y: startPoint.y, width: translationPoint.x, height: translationPoint.y), cornerRadius: 12)
    }
    
    func triangle(startPoint: CGPoint, endPoint: CGPoint) -> UIBezierPath
    {
        let edgePath = UIBezierPath()
        edgePath.move(to: CGPoint(x: startPoint.x, y: startPoint.y))
        edgePath.addLine(to: CGPoint(x: endPoint.x, y: endPoint.y))
        edgePath.addLine(to: CGPoint(x: startPoint.x, y: endPoint.y))
        edgePath.close()
        return edgePath
    }
    
    func line(startPoint: CGPoint, endPoint: CGPoint) -> UIBezierPath
    {
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: startPoint.x, y: startPoint.y))
        linePath.addLine(to: CGPoint(x: endPoint.x, y: endPoint.y))
        return linePath
    }
}
