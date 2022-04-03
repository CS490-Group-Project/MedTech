//
//  LoginViewController.swift
//  MedTech
//
//  Created by Rachel Sacdalan on 4/2/22.
//

import UIKit
import Parse

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
    
    @IBAction func onSignIn(_ sender: Any) {
        let user = PFUser()
        user.username = usernameTextField.text
        user.password = passwordTextField.text
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription ?? "Unknown Error")")
                
                // create the alert
                let alert = UIAlertController(title: "Error", message: "An error occurred with signing up. Please try again.", preferredStyle: UIAlertController.Style.alert)

                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func onLogIn(_ sender: Any) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription ?? "Unknown Error")")
                
                // create the alert
                let alert = UIAlertController(title: "Error", message: "Invalid username or password. Please try again.", preferredStyle: UIAlertController.Style.alert)

                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
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
