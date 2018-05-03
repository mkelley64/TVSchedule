//
//  ShowQueryViewController.swift
//  TVSchedule
//
//  Created by Mark Kelley on 5/3/18.
//  Copyright © 2018 Kelley. All rights reserved.
//

import UIKit

class ShowQueryViewController: UIViewController {
    
    @IBOutlet weak var txtQuery: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var searchResults = [SearchResult]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func goButtonTapped(_ sender: Any) {
        guard let query = txtQuery.text else { return }
        
        let session = URLSession.shared
        let client = TVMazeClient(session: session)
        
        client.fetchQueryResults(for: query) { result in
            switch result {
            case .failure(let error):
                self.showError(error.localizedDescription)
            case .success(let searchResults):
                self.searchResults = searchResults
                self.tableView.reloadData()
            }
        }
    }
    
    private func showError(_ description: String) {
        let alertController = UIAlertController(title: "Error", message: description, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "queryDetails" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = segue.destination as! ShowDetailsViewController
                controller.result = searchResults[indexPath.row]
            }
        }
    }
}

extension ShowQueryViewController: UITableViewDelegate {
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}

extension ShowQueryViewController: UITableViewDataSource {
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchResultCell", for: indexPath)
        
        let result = searchResults[indexPath.row]
        cell.textLabel?.text = result.show.name
        
        return cell
    }
    
}
