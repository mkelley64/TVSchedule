//
//  DatePickerViewController.swift
//  TVSchedule
//
//  Created by Mark Kelley on 5/3/18.
//  Copyright © 2018 Kelley. All rights reserved.
//

import UIKit

protocol DatePickerViewControllerDelegate: class {
    func dateChanged(date: Date)
}

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    var date: Date?
    weak var delegate: DatePickerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.date = date ?? Date()
    }

    @IBAction func okButtonTapped(_ sender: Any) {
        delegate?.dateChanged(date: datePicker.date)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
