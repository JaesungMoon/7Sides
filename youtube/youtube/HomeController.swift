//
//  HomeController.swift
//  youtube
//
//  Created by JaesungMoon on 2017/08/02.
//  Copyright © 2017年 JaesungMoon. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        collectionView?.backgroundColor = .white
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

class VideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let separatorView: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupView() {
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        
        
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-16-[v0]-16-|",
            options: NSLayoutFormatOptions(),
            metrics: nil,
            views: ["v0": thumbnailImageView]
            )
        )
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-16-[v0]-16-[v1(1)]|",
            options: NSLayoutFormatOptions(),
            metrics: nil,
            views: ["v0": thumbnailImageView, "v1": separatorView]
            )
        )
        
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|[v0]|",
            options: NSLayoutFormatOptions(),
            metrics: nil,
            views: ["v0": separatorView]
            )
        )

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
}

extension UIView {
    func addConstraintWithFormat(format: String, view: UIView...) {
        
    }
}

