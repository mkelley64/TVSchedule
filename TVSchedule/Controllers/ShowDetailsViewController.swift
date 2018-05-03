//
//  ShowDetailsViewController.swift
//  TVSchedule
//
//  Created by Mark Kelley on 5/3/18.
//  Copyright © 2018 Kelley. All rights reserved.
//

import UIKit

class ShowDetailsViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    var result: SearchResult?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Details"
        
        loadDetails()
    }
    
    private func loadDetails() {
        guard let result = result else { return }
        
        let show = result.show
        
        nameLabel.text = show.name
        typeLabel.text = show.type ?? ""
        languageLabel.text = show.language
        
        if let summary = show.summary {
            summaryLabel.attributedText = summary.htmlToAttributedString
        } else {
            summaryLabel.text = ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
