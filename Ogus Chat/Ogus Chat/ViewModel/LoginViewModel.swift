//
//  LoginViewModel.swift
//  Ogus Chat
//
//  Created by AKIN on 19.10.2022.
//

import Foundation

struct LoginViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
            && password?.isEmpty == false
    }
}
