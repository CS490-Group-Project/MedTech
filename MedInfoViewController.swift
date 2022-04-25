//
//  MedInfoViewController.swift
//  MedTech
//
//  Created by Rachel Sacdalan on 4/17/22.
//

import UIKit
import Parse
class MedInfoViewController: UIViewController {
    
    
    @IBOutlet weak var vc: UIViewController!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var healthHistory1: UITextField!
    @IBOutlet weak var healthHistory2: UITextField!
    @IBOutlet weak var currentMeds1: UITextField!
    @IBOutlet weak var currentMeds2: UITextField!
    @IBOutlet weak var allergies: UITextField!
    @IBOutlet weak var surgeries: UITextField!
    
    var objectID: String = ""
    var medinfo = [PFObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.heightField.text = "six foot"
        self.weightField.text = "210"
        name.text = PFUser.current()?.username
        
        
        let query = PFQuery(className:"medInfo")
        query.whereKey("username", equalTo: PFUser.current()?.username)
               query.findObjectsInBackground(block: { (userprofiles, error) in
                   if userprofiles != nil {
                       print("Gothere")
                       if (userprofiles == Optional([])) {
                           print("Stupid sht")
                       } else {
                           
                           self.medinfo = userprofiles!
                           self.objectID = self.medinfo[0].objectId!
                           self.changeFields()
                       }
                   } else {
                       print("error")
                   }
               })
        print("finished query")
        //changeFields()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        //loadData()
    }
    func changeFields() {
        let userObject = medinfo[0]
        print("Almost done")
        if (userObject["height"] != nil) {
            self.heightField.text = (userObject["height"] as! String)
        }
        if (userObject["weight"] != nil) {
            self.weightField.text = (userObject["weight"] as! String)        }
        if (userObject["healthHistory"] != nil) {
            let healthHistory = (userObject["healthHistory"] as! String)
            let hhcomponents = healthHistory.components(separatedBy: ",")
            self.healthHistory1.text = hhcomponents[0]
            self.healthHistory2.text = hhcomponents[1]        }
        if (userObject["currentMeds"] != nil) {
            let currentMeds = (userObject["currentMeds"] as! String)
            let cmcomponents = currentMeds.components(separatedBy: ",")
            self.currentMeds1.text = cmcomponents[0]
            self.currentMeds2.text = cmcomponents[1]        }
        if (userObject["allergies"] != nil) {
            self.allergies.text = (userObject["allergies"] as! String)
        }
        if (userObject["surgeries"] != nil) {
            self.surgeries.text = (userObject["surgeries"] as! String)
        }
        
        
        
        
        
    }
    
    func loadData() {
        print("Called")
        let query = PFQuery(className:"medInfo")
        
        query.getObjectInBackground(withId: (PFUser.current()?.objectId)!) { (userObject, error) in
            if error == nil {
                print("Loaded1")
                self.name.text = PFUser.current()?.username
                self.heightField.text = (userObject!["height"] as! String)
                self.weightField.text = (userObject!["weight"] as! String)
                let healthHistory = (userObject!["healthHistory"] as! String)
                let hhcomponents = healthHistory.components(separatedBy: ",")
                self.healthHistory1.text = hhcomponents[0]
                self.healthHistory2.text = hhcomponents[1]
                let currentMeds = (userObject!["currentMeds"] as! String)
                let cmcomponents = currentMeds.components(separatedBy: ",")
                self.currentMeds1.text = cmcomponents[0]
                self.currentMeds2.text = cmcomponents[1]
                self.allergies.text = (userObject!["allergies"] as! String)
                self.surgeries.text = (userObject!["surgeries"] as! String)
                print("loaded")
            } else {
                // Fail!
                print("Failed!")
            }
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //loadData()
    }
    @IBAction func updateMedInfoButton(_ sender: Any) {
        // TODO: Add data functionality here (Parse stuff)
        print(objectID)
        if (objectID.count < 3) {
            print("New user!")
            let query = PFQuery(className:"medInfo")
            query.getObjectInBackground(withId: (PFUser.current()?.objectId)!) { [self] (userObject: PFObject?, error: Error?) in
                if let error = error {
                    //no user
                    print("went here")
                    let medInfo = PFObject(className:"medInfo")
                    medInfo["username"] = PFUser.current()?.username
                    medInfo["height"] = heightField.text
                    medInfo["weight"] = weightField.text
                    medInfo["allergies"] = allergies.text
                    medInfo["surgeries"] = surgeries.text
                    
                    let hh1 = healthHistory1.text
                    let hh2 = healthHistory2.text
                    medInfo["healthHistory"] = hh1! + "," + hh2!
                    let cm1 = currentMeds1.text
                    let cm2 = currentMeds2.text
                    medInfo["currentMeds"] = cm1! + "," + cm2!

                    medInfo.saveInBackground { (succeeded, error)  in
                        if (succeeded) {
                            print("Item saved")
                        } else {
                            // There was a problem, check error.description
                            print(error)
                        }
                    }
                } else if let userObject = userObject {
                    userObject["height"] = heightField.text
                    userObject["weight"] = weightField.text
                    userObject["allergies"] = allergies.text
                    userObject["surgeries"] = surgeries.text
                    
                    let hh1 = healthHistory1.text
                    let hh2 = healthHistory2.text
                    userObject["healthHistory"] = hh1! + "," + hh2!
                    let cm1 = currentMeds1.text
                    let cm2 = currentMeds2.text
                    userObject["currentMeds"] = cm1! + "," + cm2!
                    userObject["username"] = PFUser.current()?.username
                    userObject.saveInBackground()
                }
            }
        } else {
            print("old user")
                let query = PFQuery(className:"medInfo")
                query.getObjectInBackground(withId: objectID) { [self] (userObject: PFObject?, error: Error?) in
                    if let error = error {
                        //no user
                        print("went here")
                        let medInfo = PFObject(className:"medInfo")
                        medInfo["username"] = PFUser.current()?.username
                        medInfo["height"] = heightField.text
                        medInfo["weight"] = weightField.text
                        medInfo["allergies"] = allergies.text
                        medInfo["surgeries"] = surgeries.text
                        
                        let hh1 = healthHistory1.text
                        let hh2 = healthHistory2.text
                        medInfo["healthHistory"] = hh1! + "," + hh2!
                        let cm1 = currentMeds1.text
                        let cm2 = currentMeds2.text
                        medInfo["currentMeds"] = cm1! + "," + cm2!

                        medInfo.saveInBackground { (succeeded, error)  in
                            if (succeeded) {
                                print("Item saved")
                            } else {
                                // There was a problem, check error.description
                                print(error)
                            }
                        }
                    } else if let userObject = userObject {
                        userObject["height"] = heightField.text
                        userObject["weight"] = weightField.text
                        userObject["allergies"] = allergies.text
                        userObject["surgeries"] = surgeries.text
                        
                        let hh1 = healthHistory1.text
                        let hh2 = healthHistory2.text
                        userObject["healthHistory"] = hh1! + "," + hh2!
                        let cm1 = currentMeds1.text
                        let cm2 = currentMeds2.text
                        userObject["currentMeds"] = cm1! + "," + cm2!
                        userObject["username"] = PFUser.current()?.username
                        userObject.saveInBackground()
                    }
        }
        
        }
        self.performSegue(withIdentifier: "medInfoToNav", sender: nil)
    }

    @IBAction func backButton(_ sender: Any) {
        self.performSegue(withIdentifier: "medInfoToNav", sender: nil)
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
