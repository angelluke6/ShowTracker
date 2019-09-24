//
//  EditShowViewController.swift
//  Show Tracker
//
//  Created by Angela Zarrilli on 7/6/19.
//  Copyright © 2019 AJ ink Designs. All rights reserved.
//

import UIKit

class CreateShowViewController: UIViewController {
    var tableVC: ShowTableViewController? = nil
    @IBOutlet weak var nameOfShowField: UITextField!
    @IBOutlet weak var seasonNumberField: UITextField!
    @IBOutlet weak var episodeNumberField: UITextField!
    
    @IBOutlet weak var networkField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addShow(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            print("inside create context")
            let newShow = ShowData(context: context)
            newShow.showTitle = self.nameOfShowField.text
            newShow.episode = self.episodeNumberField.text
            newShow.season = self.seasonNumberField.text
            newShow.done = false
            newShow.network = self.networkField.text
            try? context.save()
            tableVC?.viewWillAppear(true)
        }
        dismiss(animated: true) {
            
        }
    }
   
    
    @IBAction func cancel(_ sender: Any) {
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
