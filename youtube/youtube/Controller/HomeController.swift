//
//  HomeController.swift
//  youtube
//
//  Created by JaesungMoon on 2017/08/02.
//  Copyright © 2017年 JaesungMoon. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var videos: [Video] = {
       var blankSpaceVideo = Video()
        blankSpaceVideo.title = "Taylor Swift - FIVE"
        blankSpaceVideo.thumbnailImageName = "hayeonsu"
        return [blankSpaceVideo]
    }()
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = true
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        collectionView?.backgroundColor = .white
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: cellId)
        print(view.frame)
        print(UIScreen.main.bounds)
        
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        setupMenuBar()
        
        setupNavBarButtons()
        
    }
    
    func setupNavBarButtons() {
        let searchImage = UIImage(named: "icon_menu")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        
        let moreImage = UIImage(named: "icon_menu")?.withRenderingMode(.alwaysOriginal)
        let moreButton = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleMore))
        
        navigationItem.rightBarButtonItems = [searchBarButtonItem, moreButton]
        
    }
    let blackView = UIView()
    
    func handleMore() {
        //show more
        
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, animations: {
                self.blackView.alpha = 1
            })
        }
        
        
    }
    func handleDismiss() {
        UIView.animate(withDuration: 0.5, animations: {
            self.blackView.alpha = 0
        })
    }
    func handleSearch() {
        
    }
    
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar() {
        navigationController?.hidesBarsOnSwipe = true
        
        view.addSubview(menuBar)
        let height = ViewManager.navigationBarHeight(callFrom: self)
        print(height)
        let height2 = ViewManager.statusBarHeight
        print(height2)
        
        view.addConstraintWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintWithFormat(format: "V:|-64-[v0(50)]", views: menuBar)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 + 68)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}



