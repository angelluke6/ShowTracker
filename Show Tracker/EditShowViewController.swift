//
//  EditShowViewController.swift
//  Show Tracker
//
//  Created by Jason Kornfield on 7/6/19.
//  Copyright © 2019 AJ inc. Designs. All rights reserved.
//

import UIKit

class EditShowViewController: UIViewController {
    var showData: ShowData? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.isOn = showData!.done
        nameOfShowField.text = showData?.showTitle
        seasonNumberField.text = showData?.season
        episodeNumberfield.text = showData?.episode
        networkField.text = showData?.network
    }
    @IBAction func updateShowButton(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            print("inside context")
            if let showDataPresent = self.showData {
               showDataPresent.showTitle = self.nameOfShowField.text
               showDataPresent.episode = self.episodeNumberfield.text
               showDataPresent.season = self.seasonNumberField.text
               showDataPresent.done = self.doneButton.isOn
               showDataPresent.network = self.networkField.text
                try? context.save()
            }
           
        }
        dismiss(animated: true) {
            
        }
    }
    

    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true) {
            
        }
    }
    @IBOutlet weak var doneButton: UISwitch!
    @IBOutlet weak var nameOfShowField: UITextField!
    @IBOutlet weak var seasonNumberField: UITextField!
    
    @IBOutlet weak var episodeNumberfield: UITextField!
    
    @IBOutlet weak var networkField: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
