//
//  LoginViewController.swift
//  MedTech
//
//  Created by Rachel Sacdalan on 4/2/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var iconClick = false
    let imageIcon = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageIcon.image = UIImage(named: "closed_eye")
        
        let contentView = UIView()
        contentView.addSubview(imageIcon)
        
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(named: "closed_eye")!.size.width, height: UIImage(named: "closed_eye")!.size.height)
        
        imageIcon.frame = CGRect(x: -10, y: 0, width: UIImage(named: "closed_eye")!.size.width, height: UIImage(named: "closed_eye")!.size.height)
        
        passwordTextField.rightView = contentView
        passwordTextField.rightViewMode = .always
        
        let onEyeTapped = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageIcon.isUserInteractionEnabled = true
        imageIcon.addGestureRecognizer(onEyeTapped)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if iconClick {
            iconClick = false
            tappedImage.image = UIImage(named: "open_eye")
            passwordTextField.isSecureTextEntry = false
        } else {
            iconClick = true
            tappedImage.image = UIImage(named: "closed_eye")
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
