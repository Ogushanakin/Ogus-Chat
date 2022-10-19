//
//  RegisterViewModel.swift
//  Ogus Chat
//
//  Created by AKIN on 19.10.2022.
//

import Foundation

struct RegisterViewModel {
    var email: String?
    var fullname: String?
    var username: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
            && fullname?.isEmpty == false
            && username?.isEmpty == false
            && password?.isEmpty == false
    }
}
