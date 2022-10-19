//
//  CustomTextField.swift
//  Ogus Chat
//
//  Created by AKIN on 19.10.2022.
//

import UIKit

final class CustomTextField: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        borderStyle = .none
        font = UIFont.systemFont(ofSize: 16)
        textColor = #colorLiteral(red: 0.9843137255, green: 0.9176470588, blue: 0.9215686275, alpha: 1)
        keyboardAppearance = .dark
        attributedPlaceholder = NSAttributedString(string: placeholder,
                                                   attributes: [.foregroundColor : #colorLiteral(red: 0.9843137255, green: 0.9176470588, blue: 0.9215686275, alpha: 1)])
    }
                                                                
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
                                                                                
