//
//  Validation.swift
//  LittleLemon
//
//  Created by Mauricio Paternina on 9/10/23.
//

import Foundation

func isValidEmail(_ email: String) -> Bool {
    let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
//    let _emailRegex = /^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/
    let validEmail = email
        .trimmingCharacters(in: .whitespacesAndNewlines)
        .range(of: emailRegex, options: .regularExpression)
    
    return validEmail != nil
}

/// Evaluates whether a passed value represents a valid full name
/// - Parameter name: A string representing a user's full name
/// - Returns: true if name is a valid full name and false otherwise
func isValidFullName(_ name: String) -> Bool {
    name.trimmingCharacters(in: .whitespacesAndNewlines).contains(" ") && name.count > 5
}

func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
    let validPhoneNumberChars = "01234567890"
    
    for character in phoneNumber {
        if !validPhoneNumberChars.contains(character) {
            return false
        }
    }
    
    return true
}
