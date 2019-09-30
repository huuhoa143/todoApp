//
//  AddNewItemViewController.swift
//  TodoApp
//
//  Created by Bingxu on 9/30/19.
//  Copyright © 2019 Bingxu. All rights reserved.
//

import UIKit
import os.log

class AddNewItemViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var labelItemTextField: UITextField!
    @IBOutlet weak var dateItemTextField: UITextField!
    @IBOutlet weak var timeItemTextField: UITextField!
    @IBOutlet weak var btnSave: UIBarButtonItem!
    
    private var datePicker: UIDatePicker?
    
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        
        dateItemTextField.inputView = datePicker
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizez:)))
        
        view.addGestureRecognizer(tapGesture)
    }
    
    //MARK: - PREPARE
    // This method lets you configure a view controller before it's presented.
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === btnSave else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let label = labelItemTextField.text
        let date = dateItemTextField.text
        let time = timeItemTextField.text
        
        // Set the Item to be passed to ViewController after the unwind segue.
        item = Item(lable: label ?? "", time: time ?? "", date: date ?? "")
    }
    
    @objc func viewTapped(gestureRecognizez: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        dateItemTextField.text = dateFormatter.string(from: datePicker.date)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        labelItemTextField.text = textField.text
        dateItemTextField.text = textField.text
        timeItemTextField.text = textField.text
    }

}
