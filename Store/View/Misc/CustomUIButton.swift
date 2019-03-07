//
//  CustomUIButton.swift
//  Store
//
//  Created by Jonathan on 3/5/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class CustomUIBUtton: UIButton {
    
    let title:UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 18, weight: .bold)
        title.textColor = .white
        return title
    }()
    
    private let image:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    required init(title:String, img:UIImage? = nil) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 48).isActive = true
        self.backgroundColor = UIColor.baseColor
        self.layer.cornerRadius = 6
        self.title.text = title
        configureLayout(img: img)
    }
    
    
    fileprivate func configureLayout(img:UIImage?) {
        self.addSubview(title)
        self.addSubview(image)
        if let img = img {
            image.image = img
            NSLayoutConstraint.activate([
                title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
                title.centerYAnchor.constraint(equalTo: self.centerYAnchor)
                ])
            NSLayoutConstraint.activate([
                image.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
                image.centerYAnchor.constraint(equalTo: self.centerYAnchor)
                ])
        } else {
            NSLayoutConstraint.activate([
                title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                title.centerYAnchor.constraint(equalTo: self.centerYAnchor)
                ])
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        animate(duration: 0.1, value: 0.5)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        animate(duration: 0.1, value: 1)
    }
        
    fileprivate func animate(duration:TimeInterval, value:CGFloat) {
        UIView.animate(withDuration: duration) {
            self.title.alpha = value
            self.image.alpha = value
        }
    }
    
}
