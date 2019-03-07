//
//  StackView+Extentions.swift
//  Store
//
//  Created by Jonathan on 3/5/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(views:[UIView]) {
        for item in views {
            self.addArrangedSubview(item)
        }
    }
}
