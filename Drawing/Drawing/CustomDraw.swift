//
//  CustomDraw.swift
//  Drawing
//
//  Created by viky on 2/11/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class CustomDraw: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let p = UIBezierPath(ovalIn: CGRect(x: 100, y: 100, width: 100, height: 100))
        UIColor.blue.setFill()
        p.fill()
        
        let con = UIGraphicsGetCurrentContext()!
        con.addEllipse(in:CGRect(x: 100, y: 220, width: 100, height: 100))
        con.setFillColor(UIColor.blue.cgColor)
        con.fillPath()
    }
    
    override func draw(_ layer: CALayer, in ctx: CGContext) {
        super.draw(layer, in: ctx)
        UIGraphicsPushContext(ctx)
        let p = UIBezierPath(ovalIn: CGRect(x: 100, y: 340, width: 100, height: 100))
        UIColor.blue.setFill()
        p.fill()
        UIGraphicsPopContext()
        
        ctx.addEllipse(in:CGRect(x: 100, y: 450, width: 100, height: 100))
        ctx.setFillColor(UIColor.blue.cgColor)
        ctx.fillPath()
    }
}
