//
//  EditShowViewController.swift
//  Show Tracker
//
//  Created by Jason Kornfield on 7/6/19.
//  Copyright © 2019 AJ inc. Designs. All rights reserved.
//

import UIKit

class EditShowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func updateShowButton(_ sender: Any) {
    }
    

    @IBAction func cancelButton(_ sender: Any) {
    }
    @IBOutlet weak var doneButton: UISwitch!
    @IBOutlet weak var nameOfShowField: UITextField!
    @IBOutlet weak var seasonNumberField: UITextField!
    
    @IBOutlet weak var episodeNumberfield: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
