//
//  CgFloatExtension.swift
//  imageShowUI
//
//  Created by New User on 8/16/23.
//

import Foundation
import UIKit

struct UIdeviceSize {
    static let height = UIScreen.main.bounds.size.height
    static let width = UIScreen.main.bounds.size.width
}

// MARK: - Create CGFloat Extension For AutolayOut Responsive

extension CGFloat {
    init(w: CGFloat, for h: CGFloat = 0){
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.init(w)
        }else{
            if h > 0{
                self.init(.init(h: h) * w / h)
            }else{
                self.init(w / 414 * UIScreen.main.bounds.size.width)
            }
        }
    }
    
    init(h: CGFloat, for w: CGFloat = 0){
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.init(h)
        }else{
            if w > 0{
                self.init(.init(w: w) * h / w)
            }else{
                self.init(h / 896 * UIScreen.main.bounds.size.height)
            }
        }
    }
}
