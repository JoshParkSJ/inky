//
//  CircleButton.swift
//  Inky
//
//  Created by Ronin Cunningham on 2019-11-30.
//  Copyright © 2019 JEAR. All rights reserved.
//

import UIKit

@IBDesignable
class CircleButton: UIButton {


    @IBInspectable var cornerRadius: CGFloat = 30.0 {
        didSet{
            setupView()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    func setupView() {
        layer.cornerRadius = cornerRadius
    }

}
