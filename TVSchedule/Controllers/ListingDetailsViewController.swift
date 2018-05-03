//
//  ListingDetailsViewController.swift
//  TVSchedule
//
//  Created by Mark Kelley on 5/3/18.
//  Copyright © 2018 Kelley. All rights reserved.
//

import UIKit

class ListingDetailsViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var airdateLabel: UILabel!
    @IBOutlet weak var airtimeLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    var listing: Listing?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Details"
        
        loadDetails()
    }
    
    private func loadDetails() {
        guard let listing = listing else { return }
        
        nameLabel.text = listing.show.name
        seasonLabel.text = "\(listing.season)"
        numberLabel.text = listing.number != nil
            ? "\(listing.number!)"
            : ""
        runtimeLabel.text = listing.runtime != nil
            ? "\(listing.runtime!)"
            : ""
        airdateLabel.text = listing.airdate
        airtimeLabel.text = listing.airtime
        
        if let summary = listing.summary {
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

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType:  NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
