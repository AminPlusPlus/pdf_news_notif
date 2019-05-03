//
//  NewsTabViewController.swift
//  NewsNotifPDFKit
//
//  Created by Aminjoni Abdullozoda on 5/3/19.
//  Copyright © 2019 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit
import PDFKit

class NewsTabViewController: UITableViewController {
    
    let pdfModel = [NewsModel(Title: "All new Alif.Mobi app is coming soon", SubTitle: "Information", UrlPDF: "attachment"),
                    NewsModel(Title: "All new Alif.Mobi app is coming soon", SubTitle: "Information", UrlPDF: "attachment"),
                    NewsModel(Title: "All new Alif.Mobi app is coming soon", SubTitle: "Information", UrlPDF: "attachment")
                    ]
    
    
    let segueId = "viewpdf"
   

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pdfModel.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // Configure the cell...
        
        cell.textLabel?.text = pdfModel[indexPath.row].Title
        cell.detailTextLabel?.text = pdfModel[indexPath.row].SubTitle

        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: segueId, sender: pdfModel[indexPath.row])
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueId {
            let destintation = segue.destination as! PDFViewController
            destintation.NewsModel = sender as! NewsModel
        }
  
    }
    

}
