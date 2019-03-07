//
//  Animation+UIView.swift
//  Store
//
//  Created by Jonathan on 3/5/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

extension UIView {
    
    static func animationControl(_ time:TimeInterval, _ yAxis:CGFloat, _ xAxis:CGFloat, targets:[UIView]) {
        UIView.animate(withDuration: time) {
            for item in targets {
                item.transform = CGAffineTransform(translationX: xAxis, y: yAxis)
            }
        }
    }
    
    static func animationControl(_ time:TimeInterval, tranform:CGAffineTransform, targets:[UIView]) {
        UIView.animate(withDuration: time) {
            for item in targets {
                item.transform = tranform
            }
        }
    }
    
}
