//
//  TextField.swift
//  test
//
//  Created by Mariana Meireles on 05/09/17.
//  Copyright © 2017 Mariana Meireles. All rights reserved.
//

import Foundation
import UIKit

public extension UITextField {
    
    //Extension to create the Text Fields
    convenience init(frame: CGRect, placeholder: String, target: Any?, action: Selector) {
        self.init(frame: UIScreen.changeScale(vector: frame))
        self.placeholder = placeholder
        self.borderStyle = .roundedRect
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1.0
        self.addTarget(target, action: action, for: UIControlEvents.editingChanged)
    }
}
