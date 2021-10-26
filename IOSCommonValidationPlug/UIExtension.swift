//
//  Utilities.swift
//  IOSCommonValidationPlug
//
//  Created by Heena on 24/09/21.
//

import UIKit


/// This UIView extension is used to provide corner radius,border width and border color from storyboard
extension UIView {
    /// function for drop shadow for View
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 5
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowRadius = 2.0
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
  
}

///Email Validation
extension UITextField {
     func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}

/// Alert View
extension UIViewController {
    /// function show alert view with ok button
    func showAlertViewWithOKBtn(title : String , message : String, okBtnTitle: String = OK,  competitionHandler:((UIAlertAction) -> Void)? = nil ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: okBtnTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion:nil)
    }
}
