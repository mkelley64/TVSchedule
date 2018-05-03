//
//  ScheduleTableViewController.swift
//  TVSchedule
//
//  Created by Mark Kelley on 5/2/18.
//  Copyright © 2018 Kelley. All rights reserved.
//

import UIKit

class ScheduleTableViewController: UITableViewController {
    
    var datePicker : UIDatePicker!
    let toolBar = UIToolbar()
    
    var listings = [Listing]()
    
    var timeStamp: Date? {
        didSet {
            if let ts = timeStamp {
                title = ts.titleDateString()
                getListings(for: ts)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeStamp = Date()
    }
    
    private func getListings(for timestamp: Date) {
        let session = URLSession.shared
        let client = TVMazeClient(session: session)
        
        client.fetchListings(for: timestamp) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                //TODO: error window
            case .success(let listings):
                self.listings = listings
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listings.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listingCell", for: indexPath)

        let listing = listings[indexPath.row]
        cell.textLabel?.text = listing.show.name

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = segue.destination as! ListingDetailsViewController
                controller.listing = listings[indexPath.row]
            }
        } else if segue.identifier == "showDatePicker" {
            let controller = segue.destination as! DatePickerViewController
            controller.date = timeStamp
            controller.delegate = self
        }
    }
}

extension ScheduleTableViewController: DatePickerViewControllerDelegate {
    func dateChanged(date: Date) {
        timeStamp = date
    }
}
