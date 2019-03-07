//
//  HomePageController.swift
//  Store
//
//  Created by Jonathan on 3/6/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class HomePageController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // Header Section ID
    let headerID = "headerID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        setupNavBar()
    }
    
    private func setupCollection() {
        // UI
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        // Cell Register
        collectionView.register(HomePageHeaderCell.self, forCellWithReuseIdentifier: headerID)
    }
    
    private func setupNavBar() {
        self.title = "Shop"
        
    }
    
    // Cell Count
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    // Cell Sizing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 311)
    }
    
    // Item Rendering
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: headerID, for: indexPath)
        return item
    }
}
