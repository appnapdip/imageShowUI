//
//  ImageCell.swift
//  imageShowUI
//
//  Created by New User on 8/16/23.
//

import Foundation
import UIKit


class albumsCustomCell: UICollectionViewCell{
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        contentView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.anchorView(top:topAnchor,left:leftAnchor,bottom:bottomAnchor,right:rightAnchor,paddingLeft: .init(w:22), paddingRight: .init(w:22))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
}
