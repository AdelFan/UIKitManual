//
//  Validator.swift
//  UIKitManual
//
//  Created by Адель Ахметшин on 06.09.2022.
//

import Foundation

struct Validator {
    let numbers = "1234567890"
    
    /// Метод проверки символов в вводимом тексте
    /// - Parameter text: string - вводимые символы
    /// - Returns: true or false
    func hasNumbers(text: String) -> Bool {
        for number in numbers {
            if text.contains(number) { return true }
        }
        return false
    }
}
