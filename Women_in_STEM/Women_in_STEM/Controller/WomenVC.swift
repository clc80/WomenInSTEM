//
//  ViewController.swift
//  Women_in_STEM
//
//  Created by Claudia Contreras on 2/3/18.
//  Copyright © 2018 thecoderpilot. All rights reserved.
//

import UIKit

class WomenVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var categoryTable: UITableView!
    @IBOutlet weak var womenImage: UIImageView!
    @IBOutlet weak var womenTitle: UILabel!
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load images
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix(".jpg") {
                //this is a picture to load
                pictures.append(item)
            }
        }
        //use images
        
        //Load JSON file
        let urlString = "http://thecoderpilot.com/WomenInSTEM/womenInTech.json"
        if let url = URL(string: urlString) {
            if let data = try? String(contentsOf: url) {
                let json = JSON(parseJSON: data)
                DataService.instance.parse(json: json)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.womenInSTEM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let WomenInSTEM = DataService.instance.womenInSTEM[indexPath.row]
        cell.imageView?.image = UIImage(named: "background_button2.png")
        cell.textLabel?.text = WomenInSTEM["title"]
        return cell
        //return WomenCell()
    }
  /*
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = womenInSTEM[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }*/

}

