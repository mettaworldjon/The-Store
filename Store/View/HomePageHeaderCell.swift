//
//  HomePageHeaderCell.swift
//  Store
//
//  Created by Jonathan on 3/6/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class HomePageHeaderCell: UICollectionViewCell {
    
    private let title:UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Shop"
        title.textColor = .gray99
        title.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        handleUI()
    }
    
    private func handleUI() {
//        self.backgroundColor = .white
//        self.addSubview(title)
//        NSLayoutConstraint.activate([
//            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
//            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 15)
//            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
