//
//  EditShowViewController.swift
//  Show Tracker
//
//  Created by Jason Kornfield on 7/6/19.
//  Copyright © 2019 AJ inc. Designs. All rights reserved.
//

import UIKit

class EditShowViewController: UIViewController {
    var tableVC: ShowTableViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addShow(_ sender: Any) {
        tableVC?.shows.append(ShowData(showTitle: "sa", season: "as", episode: "bc", done: false))
        print(tableVC?.shows)
        dismiss(animated: true) {
            // Nothing!
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
