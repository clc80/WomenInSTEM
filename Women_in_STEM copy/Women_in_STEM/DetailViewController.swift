//
//  DetailViewController.swift
//  Women_in_STEM
//
//  Created by Claudia Contreras on 2/3/18.
//  Copyright © 2018 thecoderpilot. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: [String: String]!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard detailItem != nil else { return }
        
        let name = detailItem["name"]
        let image = detailItem["image"]
        
        if let body = detailItem["body"] {
            var html = "<html>"
            html += "<head>"
            html += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
            html += "<style> body { font-size: 150%;} </style>"
            html += "</head>"
            html += "<body>"
            html += "<h1>"
            html += name!
            html += "</h1>"
            html += "<img src =\""
            html += image!
            html += "\" alt=\""
            html += name!
            html += "\" height=\"42\" width=\"42\">"
            html += body
            html += "</body>"
            html += "</html>"
            webView.loadHTMLString(html, baseURL: nil)
        }
    }

    
}
