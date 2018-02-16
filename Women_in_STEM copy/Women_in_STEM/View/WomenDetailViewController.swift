//
//  WomenDetailViewController.swift
//  Women_in_STEM
//
//  Created by Claudia Contreras on 2/15/18.
//  Copyright © 2018 thecoderpilot. All rights reserved.
//

import UIKit
import WebKit

class WomenDetailViewController: UIViewController {
    @IBOutlet var ladyLabel: UILabel!
    @IBOutlet var ladyImage: UIImageView!
    @IBOutlet var ladyText: WKWebView!
    
    var webView: WKWebView!
    var detailItem: [String: String]!
    
    override func loadView() {
        webView = WKWebView()
        //view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //share information with others
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        guard detailItem != nil else {return}
        
        let name = detailItem["name"]
        ladyLabel.text = name
        
        let image:UIImage = UIImage(named: detailItem["image"]!)!
        let imageView = UIImageView(image: image)
        ladyImage = imageView
        
        if let body = detailItem["body"] {
            var html = "<html>"
            html += "<head>"
            html += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
            html += "<style> body { font-size: 150%; font-family: \"Palatino Linotype\", \"Book Antiqua\", Palatino, serif;} </style>"
            html += "</head>"
            html += "<body bgcolor=\"#eeebda\">"
            html += "<h2><font color = \"#001547\">"
            html += name!
            html += "</font> </h2>"
            html += "<font color = \"#140911\">"
            html += body
            html += "</font>"
            html += "</body>"
            html += "</html>"
            
            webView.loadHTMLString(html, baseURL: nil)
        }
    }
    @objc func shareTapped() {
        let vc = UIActivityViewController(activityItems: [detailItem["name"]!,detailItem["body"]!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }


}
