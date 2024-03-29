//
//  DetailViewController.swift
//  To-Do List App
//
//  Created by SBAUser on 10/8/19.
//  Copyright © 2019 Kyle Moga. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var toDoField: UITextField!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var toDoNoteView: UITextView!
    
    
    
    var toDoItem: String?
    var toDoNoteItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let toDoItem = toDoItem {
            toDoField.text = toDoItem
            self.navigationItem.title = "Edit To-Do Item"
        } else {
            self.navigationItem.title = "New To-Do Item"
        }
        if let toDoNoteItem = toDoNoteItem {
            toDoNoteView.text = toDoNoteItem
        }
        enableDisableSaveButton()
        toDoField.becomeFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindFromSave" {
            toDoItem = toDoField.text
            toDoNoteItem = toDoNoteView.text
        }
    }
    
    func enableDisableSaveButton() {
        if let toDoFieldCount = toDoField.text?.count, toDoFieldCount > 0 {
            saveBarButton.isEnabled = true
        } else {
            saveBarButton.isEnabled = false
        }
    }
    
    @IBAction func toDoFieldChanged(_ sender: UITextField) {
       enableDisableSaveButton()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let addMode = presentingViewController is UINavigationController
        if addMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    


}
