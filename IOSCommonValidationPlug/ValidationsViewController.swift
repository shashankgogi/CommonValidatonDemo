//
//  ValidationsViewController.swift
//  IOSCommonValidationPlug
//
//  Created by Heena on 24/09/21.
//

import UIKit
import Alamofire
import AlamofireImage
import AVFoundation

class ValidationsViewController:  {
    
    @IBOutlet var imgViewForImageUpload: UIImageView!
    @IBOutlet var txtFieldForCommonName: UITextField!
    @IBOutlet var lblForNameValidationError: UILabel!
    @IBOutlet var txtFieldForEmail: UITextField!
    @IBOutlet var lblForEmailValidationError: UILabel!
    @IBOutlet var txtFieldForMobNo: UITextField!
    @IBOutlet var lblForMobileNoValodationError: UILabel!
    @IBOutlet var txtFieldForTelephoneNo: UITextField!
    @IBOutlet var lblForTelephoneNumberValidationError: UILabel!
    @IBOutlet var txtFiledForWebsiteURL: UITextField!
    @IBOutlet var lblForWebsiteURLValidationError: UIView!
    @IBOutlet var btnForImageUploadAndDelete: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadInitialContent()
    }
    
    @IBAction func btnForNext(_ sender: Any) {
        
    }
    
    func initBaseField() {
        self.imgViewForImageUploadBase = imgViewForImageUpload
        self.txtFieldForCommonNameBase = txtFieldForCommonName
        self.lblForNameValidationErrorBase = lblForNameValidationError
        self.txtFieldForEmailBase = txtFieldForEmail
        self.lblForEmailValidationErrorBase = lblForEmailValidationError
        self.txtFieldForMobNoBase = txtFieldForMobNo
        self.lblForMobileNoValodationErrorBase = lblForMobileNoValodationError
        self.txtFieldForTelephoneNoBase = txtFieldForTelephoneNo
        self.lblForTelephoneNumberValidationErrorBase = lblForTelephoneNumberValidationError
        self.txtFiledForWebsiteURLBase = txtFiledForWebsiteURL
        self.lblForWebsiteURLValidationErrorBase = lblForWebsiteURLValidationError
        self.btnForImageUploadAndDeleteBase = btnForImageUploadAndDelete
    }
    
    func loadInitialContent() {
        if imgViewForImageUpload.image != nil{
            self.btnForImageUploadAndDelete.setTitle(" Delete Image", for: .normal)
        } else {
            self.btnForImageUploadAndDelete.setTitle(" Upload Image", for: .normal)
        }
        if imgViewForImageUpload != nil {
            imgViewForImageUpload.layer.cornerRadius = 8
            imgViewForImageUpload.isHidden = true
        }
    }
    
}

