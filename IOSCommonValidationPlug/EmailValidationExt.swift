//
//  EmailValidation.swift
//  IOSCommonValidationPlug
//
//  Created by Heena on 27/09/21.
//

import UIKit

extension UITextField {
    ///Email Validation
     func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
