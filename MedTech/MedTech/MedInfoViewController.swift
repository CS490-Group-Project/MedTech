//
//  MedInfoViewController.swift
//  MedTech
//
//  Created by Rachel Sacdalan on 4/17/22.
//

import UIKit

class MedInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func updateMedInfoButton(_ sender: Any) {
        // TODO: Add data functionality here (Parse stuff)
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
