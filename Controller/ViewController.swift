//
//  ViewController.swift
//  imageShowUI
//
//  Created by New User on 8/16/23.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {
    
    var imageArray = [UIImage]()
    
    
    let ImageCollectioView: UICollectionView = {
        let thisLayout =  UICollectionViewFlowLayout()
        thisLayout.scrollDirection = .vertical
        var thisCollection = UICollectionView(frame:.zero, collectionViewLayout:thisLayout)
        thisCollection.showsVerticalScrollIndicator = false
        thisLayout.minimumLineSpacing = .init(h:UIDevice.current.userInterfaceIdiom == .pad ? .init(h:10) : .init(h:3))
        thisLayout.minimumInteritemSpacing = .init(w:0)
        thisCollection.register(albumsCustomCell.self, forCellWithReuseIdentifier: "ACCustomCell")
        return thisCollection
    }()
    
    
    
    
    
    
    lazy var addButton:UIButton = {
        let thisButton = UIButton().button(title:"showPremission",titleColor:UIColor.white,backgroundColor:UIColor.blue,cornerRadius:.init(w:16))
        thisButton.addTarget(self, action:#selector(presstoPremission), for:.touchUpInside)
        return thisButton
    }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        
    }
    
    
    func loadUI() {
        
        
        
        view.addSubview(ImageCollectioView)
        ImageCollectioView.delegate = self
        ImageCollectioView.dataSource = self
        ImageCollectioView.anchorView(top:view.topAnchor,left:view.leftAnchor,bottom:view.bottomAnchor,right:view.rightAnchor,paddingTop: .init(h:28))
        
        view.addSubview(addButton)
        addButton.anchorView(bottom:view.bottomAnchor,paddingBottom:.init(h:46),width: .init(w:158), height: .init(h:56))
        addButton.centerX(inView:view)
    }
    
    
    @objc func presstoPremission() {
        var config = PHPickerConfiguration()
        config.filter = PHPickerFilter.images
        config.selectionLimit = 4
        let pickerVC = PHPickerViewController(configuration: config)
        pickerVC.delegate = self
        self.present(pickerVC, animated:true)
    }
}

extension ViewController: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated:true)
        
        for result in results {
            result.itemProvider.loadObject(ofClass:UIImage.self) { object,error in
                if let image = object as? UIImage {
                    self.imageArray.append(image)
                }
                
                DispatchQueue.main.async {
                    self.ImageCollectioView.reloadData()
                }
            }
        }
    }
    
}



extension ViewController:  UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ACCustomCell", for: indexPath) as! albumsCustomCell
        cell.imageView.image = imageArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: .init(w:136), height: .init(h:136,for:136))
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top:.init(h:0), left:.init(w:0), bottom: .init(h:0), right: .init(w:0))
        
    }
    
}
