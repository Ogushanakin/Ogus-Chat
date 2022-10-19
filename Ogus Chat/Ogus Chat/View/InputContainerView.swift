//
//  InputContainerView.swift
//  Ogus Chat
//
//  Created by AKIN on 19.10.2022.
//

import UIKit

final class InputContainerView: UIView {
    
    init(image: UIImage?, textField: UITextField) {
        super.init(frame: .zero)
        
        setHeight(height: 50)
        
        let iv = UIImageView()
        iv.image = image
        iv.tintColor = #colorLiteral(red: 0.9843137255, green: 0.9176470588, blue: 0.9215686275, alpha: 1)
        iv.alpha = 0.87
        
        addSubview(iv)
        iv.centerY(inView: self)
        iv.anchor(left: leftAnchor, paddingLeft: 8)
        iv.setDimensions(height: 24, width: 24)
        
        addSubview(textField)
        textField.centerY(inView: self)
        textField.anchor(left: iv.rightAnchor, bottom: bottomAnchor,
                         right: rightAnchor, paddingLeft: 8, paddingBottom: -8)
        
        let dividerView = UIView()
        dividerView.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9176470588, blue: 0.9215686275, alpha: 1)
        addSubview(dividerView)
        dividerView.anchor(left: leftAnchor, bottom: bottomAnchor,
                           right: rightAnchor, paddingLeft: 8, height: 0.75)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
