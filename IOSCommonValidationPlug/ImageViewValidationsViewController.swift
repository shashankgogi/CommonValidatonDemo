//
//  ValidationsBaseViewController.swift
//  IOSCommonValidationPlug
//
//  Created by Heena on 27/09/21.
//

import UIKit

class ImageViewValidationsViewController: UIViewController {
    
    var imgViewForImageUploadBase: UIImageView!
    var txtFieldForCommonNameBase: UITextField!
    var lblForNameValidationErrorBase: UILabel!
    var txtFieldForEmailBase: UITextField!
    var lblForEmailValidationErrorBase: UILabel!
    var txtFieldForMobNoBase: UITextField!
    var lblForMobileNoValodationErrorBase: UILabel!
    var txtFieldForTelephoneNoBase: UITextField!
    var lblForTelephoneNumberValidationErrorBase: UILabel!
    var txtFiledForWebsiteURLBase: UITextField!
    var lblForWebsiteURLValidationErrorBase: UIView!
    var btnForImageUploadAndDeleteBase: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    ///Image Picker camera and gallary
    func showImageCaptureOptions() {
        if(imgViewForImageUpload.image == nil)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            
            let actionSheet = UIAlertController(title: "Select Image", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
            
            actionSheet.addAction(UIAlertAction(title: "Capture Image", style: UIAlertAction.Style.default, handler: { (alert:UIAlertAction!) -> Void in
                self.checkCamera()
            }))
            actionSheet.addAction(UIAlertAction(title: "Photo Library", style: UIAlertAction.Style.default, handler: { (alert:UIAlertAction!) -> Void in
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            }))
            
            /// Annuler for cancel
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
            self.present(actionSheet, animated: true, completion: nil)
        }
        else
        {
            imgViewForImageUploadBase.setImage( UIImage.init(named: UPLOAD_IMG), for: .normal)
            
            imgViewForImageUploadBase.setTitle(" Upload Image", for: .normal)
            
            imgViewForImageUploadBase.setTitleColor(Utilities.colorFromHex(UPLOAD_IMAGE_BTN_COLOR), for: UIControl.State.normal)
            imgViewForImageUploadimgViewForImageUploadBase.image = nil
            imgViewForImageUploadBase.isHidden = true
        }
    }
    /// To check user has allowed or notallowed to access camera.
    func checkCamera() {
        let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        switch authStatus {
        case .authorized: callCamera() // Do your stuff here i.e. callCameraMethod()
        case .denied: alertPromptToAllowCameraAccessViaSetting()
        case .notDetermined: callCamera()
        case .restricted: alertPromptToAllowCameraAccessViaSetting()
        default: callCamera()
        }
    }
    /// Function to show alert for to use camera
    func alertPromptToAllowCameraAccessViaSetting() {
        let alert = UIAlertController(
            title: "Allow “Night Picker” to access your camera?",
            message: "To capture your profile photos or restaurant profile photos or videos related to restaurant’s deals & stories.",
            preferredStyle: UIAlertController.Style.alert
        )
        alert.addAction(UIAlertAction(title: "Allow Camera", style: .cancel) { alert in
            UIApplication.shared.open((URL(string: UIApplication.openSettingsURLString)!), options: [:], completionHandler: nil)
        }
        )
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive) { alert in
        }
        )
        present(alert, animated: true, completion: nil)
    }
    /// Function to show camera
    func callCamera(){
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerController.SourceType.camera
        self.present(myPickerController, animated: true, completion: nil)
        NSLog("Camera");
    }
    }


/// MARK: - UIImagePicker
extension ImageViewValidationsViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {

        if (info[.originalImage] as? UIImage) != nil
        {
            let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            
            let imgData = NSData(data: (info[UIImagePickerController.InfoKey.originalImage] as! UIImage).jpegData(compressionQuality: 0.01)!)
            
            var imageSize = imgData.count
            
            imageSize = imageSize/1024/1024
            
            if(imageSize <= 5)
            {
                imgViewForImageUploadBase.isHidden = false
                
                if(imgViewForImageUploadBase.image == nil)
                {
                    imgViewForImageUploadBase.setImage( UIImage.init(named: DELETE_IMG), for: .normal)
                    
                    self.imgViewForImageUploadBase.setTitle(" Delete Image".localized(), for: .normal)
                    
                }
                imgViewForImageUploadBase.setTitleColor(UIColor.black, for: UIControl.State.normal)
            }
            if #available(iOS 11.0, *)
            {
                selectedFileUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL
            }
            else
            {
                selectedFileUrl = info[UIImagePickerController.InfoKey.referenceURL] as? URL
            }
            imgViewForImageUpload.tag = 1
            imgViewForImageUpload.image = image
            dismiss(animated: true, completion: nil)
        }
        else
        {
            dismiss(animated: true, completion: nil)
            
            NightPickerAPI.showAlert(alertMsg: UPLOAD_IMG_MORETHAN_5MB.localized(), controller: self)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imgViewForImageUpload.tag = 0
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
    }
}
