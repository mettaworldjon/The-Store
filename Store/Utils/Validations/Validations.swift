//
//  Validations.swift
//  Store
//
//  Created by Jonathan on 3/5/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class Validate {
    
    private init() {}
    
    static let shared = Validate()
    
    func isValidEmail(string:String?) -> Bool {
        guard let string = string else { return false }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: string)
    }
    
    func isValidPassword(string:String?) -> Bool {
        guard let string = string else { return false }
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^.*(?=.{6,})(?=.*[A-Z])(?=.*[a-zA-Z])(?=.*\\d)|(?=.*[!#$%&?,.;@]).*$")
        return passwordTest.evaluate(with:string)
    }
    
    func isValidName(string:String?) -> Bool {
        guard var string = string else { return false }
        string =  string.trimmingCharacters(in: .whitespaces)
        return string != ""
    }
}
