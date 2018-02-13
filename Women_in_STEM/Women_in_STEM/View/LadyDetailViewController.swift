//
//  LadyDetailViewController.swift
//  Women_in_STEM
//
//  Created by Claudia Contreras on 2/8/18.
//  Copyright © 2018 thecoderpilot. All rights reserved.
//

import UIKit
import WebKit

class LadyDetailViewController: UIViewController {

    var webView: WKWebView!
    var detailItem: [String: String]!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //share information with others
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        //add image
        let image:UIImage = UIImage(named: detailItem["image"]!)!
        
        let imageView = UIImageView(image: image)
        self.view.addSubview(imageView)
        
        //image constraints
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 10).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.topAnchor,constant: 110).isActive = true

        webView.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        
        guard detailItem != nil else {return}
        
        let name = detailItem["name"]
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
