//
//  ViewController.swift
//  NewsNotifPDFKit
//
//  Created by Aminjoni Abdullozoda on 5/3/19.
//  Copyright © 2019 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {
    
    
    //MARK:- Ui ELement
    @IBOutlet weak var pdfView : PDFView!
    
    var NewsModel : NewsModel?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       self.navigationItem.title = NewsModel!.Title
        
        if let path = Bundle.main.path(forResource: NewsModel!.UrlPDF, ofType: "pdf") {
            if let pdfDocument = PDFDocument(url: URL(fileURLWithPath: path)) {
                pdfView.displayMode = .singlePageContinuous
                pdfView.autoScales = true
                pdfView.displayDirection = .vertical
                pdfView.document = pdfDocument
            }
        }
        
        
    }
    @IBAction func share(_ sender: Any) {
        
        let data = pdfView.document!.dataRepresentation()
        var fileToshare = [Any]()
        
        fileToshare.append(data!)
        
        let shareAcivity = UIActivityViewController(activityItems: fileToshare, applicationActivities: nil)
        
        self.present(shareAcivity, animated: true, completion: nil)
    }
    

}

