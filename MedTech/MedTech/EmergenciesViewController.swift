//
//  EmergenciesViewController.swift
//  MedTech
//
//  Created by Rachel Sacdalan on 4/18/22.
//

import UIKit

class EmergenciesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func overdoseButton(_ sender: Any) {
        // create the alert
        let alert = UIAlertController(title: "Coming Soon!", message: "We will be adding more emergencies in the next update. Stay tuned!", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func breathingProblemsButton(_ sender: Any) {
        let alert = UIAlertController(title: "Coming Soon!", message: "We will be adding more emergencies in the next update. Stay tuned!", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func severeInjuriesButton(_ sender: Any) {
        let alert = UIAlertController(title: "Coming Soon!", message: "We will be adding more emergencies in the next update. Stay tuned!", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.performSegue(withIdentifier: "emergenciesToNav", sender: nil)
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
