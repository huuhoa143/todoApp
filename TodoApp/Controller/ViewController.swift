//
//  ViewController.swift
//  TodoApp
//
//  Created by Bingxu on 9/28/19.
//  Copyright © 2019 Bingxu. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var listItem = [Item]()
    var index: Int = 0
    
    @IBOutlet weak var tblList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        // Load the sample data.
        loadSampleItems()
        
        tblList.register(UINib.init(nibName: "CheckMarkCell", bundle: nil), forCellReuseIdentifier: "CheckListCellIdentifier")
        
        tblList.dataSource = self
        tblList.delegate = self
    }
    
    //MARK: - Actions
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddNewItemViewController, let item = sourceViewController.item {
            
            // Add a new item.
            let newIndexPath = IndexPath(row: listItem.count, section: 0)
            
            listItem.append(item)
            self.tblList.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    
    //MARK: - Actions
    
    @IBAction func addMoreItem() {
        
        // Add a new item.
        let newIndexPath = IndexPath(row: listItem.count, section: 0)
        
        
        let label = "Hello"
        let time = "11h"
        let date = "Today"

        guard let item3 = Item(lable: label, time: time, date: date) else {
            fatalError("Unable to instantiate item")
        }
        listItem.append(item3)
        
        self.tblList.insertRows(at: [newIndexPath], with: .automatic)
        
    }
    
    //MARK: - Init Data Test
    
    private func loadSampleItems() {
        guard let item1 = Item(lable: "Demo Item", time: "9h", date: "Today") else {
            fatalError("Unable to instantiate meal1")
        }
        
        listItem += [item1]
    }
    
    //MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListCellIdentifier") as! CheckMarkCell
        
        let item = listItem[indexPath.row]
        cell.labelItem.text = item.lable
        cell.dateItem.text = item.date
        cell.timeItem.text = item.time
        cell.btnCheckMark.tag = indexPath.row
        
        cell.selectionStyle = .none
        
        cell.btnCheckMark.addTarget(self, action: #selector(checkMarkButtonClicked(sender:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "addNewItemViewController") as? AddNewItemViewController
        let item = listItem[indexPath.row]
        print(item.lable)
        
        
//        vc?.labelItemTextField.text = item.lable ?? ""
        
//        print("VC: ", vc?.labelItemTextField.text)

//        vc?.labelItemTextField.text = item.lable
//        vc?.dateItemTextField.text = item.date
//        vc?.timeItemTextField.text = item.time
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle
        , forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            listItem.remove(at: indexPath.row)
            self.tblList.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    @objc func checkMarkButtonClicked(sender: UIButton) {
        print("Select: ", sender.isSelected)
        if sender.isSelected {
            sender.isSelected = false
        } else {
            // Delete row of table
            let section = 0
            let row = sender.tag
            let indexPath = IndexPath(row: row, section: section)
            listItem.remove(at: indexPath.row)
            self.tblList.deleteRows(at: [indexPath], with: .fade)
            sender.isSelected = true
        }
        
        tblList.reloadData()
    }
    
}

