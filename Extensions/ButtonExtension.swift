//
//  ButtonExtension.swift
//  imageShowUI
//
//  Created by New User on 8/16/23.
//

import Foundation
import UIKit


extension UIButton {
    
    func button(title: String? = nil, titleColor: UIColor = .white, backgroundImage: UIImage? = nil, backgroundColor: UIColor = .clear, titleEdgeInsetsLeft: CGFloat = 0, tag: Int = 0, font: UIFont = UIFont.systemFont(ofSize: 15, weight: .regular), alpha: CGFloat = 1.0, cornerRadius:CGFloat = 0,shadow:CGColor = UIColor.blue.cgColor,shadowOpacity:Float = 0,shadowRadius:Float = 0,borderColor:CGColor = UIColor.yellow.cgColor,borderWidth:CGFloat = 0,resizeFont:Bool = false) -> UIButton{
        let finalFont = font.withSize(UIDevice.current.userInterfaceIdiom == .pad ? font.pointSize * (resizeFont ? 1.5 : 1) : font.pointSize)
        let button = UIButton(type: .system)
        (title != nil ) ?  button.setTitle(title, for: .normal)  : button.setTitle(.none, for: .normal)
        (backgroundImage != nil ) ?  button.setImage(backgroundImage, for: .normal) : button.setImage(.none, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = backgroundColor
        button.titleEdgeInsets.left = titleEdgeInsetsLeft
        button.titleLabel?.font = finalFont
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.tag = tag
        button.alpha = alpha
        button.layer.cornerRadius = cornerRadius
        button.layer.shadowColor = shadow
        button.layer.shadowOpacity = shadowOpacity
        button.layer.shadowRadius = CGFloat(shadowRadius)
        button.layer.borderColor = borderColor
        button.layer.borderWidth = borderWidth
        return button
    }
}
