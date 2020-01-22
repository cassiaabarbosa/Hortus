//
//  CardView.swift
//  MiniChallenge2_Hortus
//
//  Created by Edgar Sgroi on 24/05/19.
//  Copyright © 2019 Hortus. All rights reserved.
//

//import UIKit
//
////@IBDesignable
//class CardView: UICollectionViewCell {
//
//
//    // Only override draw() if you perform custom drawing.
//    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        // Size of rounded rectangle
//        let rectWidth = rect.width
//        let rectHeight = rect.height
//
//        // Find center of actual frame to set rectangle in middle
//        let xf:CGFloat = (self.frame.width  - rectWidth)  / 2
//        let yf:CGFloat = (self.frame.height - rectHeight) / 2
//
//        let ctx: CGContext = UIGraphicsGetCurrentContext()!
//        ctx.saveGState()
//
//        let rect = CGRect(x: xf, y: yf, width: rectWidth, height: rectHeight)
//        let clipPath: CGPath = UIBezierPath(roundedRect: rect, cornerRadius: 25).cgPath
//
//        ctx.addPath(clipPath)
//        ctx.setFillColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
//
//        ctx.closePath()
//        ctx.fillPath()
//
//
//    }
//
//}
