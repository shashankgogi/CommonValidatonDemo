//
//  ValidationNextPageViewController.swift
//  IOSCommonValidationPlug
//
//  Created by Heena on 24/09/21.
//

import UIKit

class ValidationNextPageViewController: UIViewController {
    
    @IBOutlet var txtFieldForPostalCode: UITextField!
    @IBOutlet var lblForPostalCodeValidationError: UILabel!
    @IBOutlet var txtFieldForDescription: UITextField!
    @IBOutlet var lblForDescriptionValidationError: UILabel!
    @IBOutlet var txtFieldForPriceInInt: UITextField!
    @IBOutlet var lblForPricrInIntValidationError: UILabel!
    @IBOutlet var txtFieldForPricInFloat: UITextField!
    @IBOutlet var lblForPriceInFloatValidationError: UILabel!
    @IBOutlet var txtFieldForOTP1: UITextField!
    @IBOutlet var lblForOTP1: UILabel!
    @IBOutlet var txtFieldForOTP2: UITextField!
    @IBOutlet var lblForOTP2: UILabel!
    @IBOutlet var txtFieldForOTP3: UITextField!
    @IBOutlet var lblForOTP3: UILabel!
    @IBOutlet var txtfieldForOTP4: UITextField!
    @IBOutlet var lblForOTP4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnForDone(_ sender: Any) {
    }
    
}
