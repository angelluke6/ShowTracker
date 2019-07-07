//
//  ShowTableViewController.swift
//  Show Tracker
//
//  Created by Jason Kornfield on 7/5/19.
//  Copyright © 2019 AJ inc. Designs. All rights reserved.
//

import UIKit

class ShowTableViewController: UITableViewController {
    var shows : [ShowData] = []

    override func viewWillAppear(_ animated: Bool) {
        getShowData()
        
    }
    
    func getShowData() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let showsInCoreData = try? context.fetch(ShowData.fetchRequest()){
                if let shows = showsInCoreData as? [ShowData]{
                    self.shows = shows
                    tableView.reloadData()
                }
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return shows.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let show = shows[indexPath.row]
        if show.done {
            cell.textLabel?.textColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
            cell.textLabel?.text = show.showTitle ?? ""
        } else {
            cell.textLabel?.text = "\(show.showTitle ?? ""), Season \(show.season ?? ""), Episode \(show.episode ?? "")"
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "EditShow", sender: indexPath.row)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let createViewController = segue.destination as? CreateShowViewController {
            createViewController.tableVC = self
        } else if let createViewController = segue.destination as? EditShowViewController {
            if let index = sender as? Int {
                createViewController.showData = shows[index]
            }
          
        }
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title:  "Delete", handler: {
            (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                let show = self.shows[indexPath.row]
                context.delete(show)
                self.shows.remove(at: indexPath.row)
                try? context.save()
                self.tableView.reloadData()
            }
            success(true)
        })
        deleteAction.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

}
