//
//  ViewController.swift
//  Women_in_STEM
//
//  Created by Claudia Contreras on 2/3/18.
//  Copyright © 2018 thecoderpilot. All rights reserved.
//

import UIKit

class WomenVC: UITableViewController {
    
    var pictures = [String]()
    var womenInSTEM = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //adding the ability to share with others
        
        
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
        //print(pictures)
                
        let urlString = "http://thecoderpilot.com/WomenInSTEM/womenInTech.json"
        if let url = URL(string: urlString) {
            if let data = try? String(contentsOf: url) {
                let json = JSON(parseJSON: data)
                parse(json: json)
            }
        }

    }
    
    func parse(json: JSON) {
        for result in json["results"].arrayValue {
            let name = result["name"].stringValue
            let image = result["image"].stringValue
            let headline = result["headline"].stringValue
            let body = result["body"].stringValue
            //let field
            //let moreInfo
            let obj = ["name": name, "image": image, "headline": headline, "body": body]
            womenInSTEM.append(obj)
            //print(womenInSTEM)
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(womenInSTEM.count)
        return womenInSTEM.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let WomenInSTEM = womenInSTEM[indexPath.row]
        //adds the image to the cell
        cell.backgroundView = UIImageView(image: UIImage(named: "background_button2"))
        
        cell.textLabel?.text = WomenInSTEM["name"]
        //changes the color of the background behind the text
        cell.textLabel?.backgroundColor = #colorLiteral(red: 0, green: 0.08235294118, blue: 0.2784313725, alpha: 0)
        cell.detailTextLabel?.text = WomenInSTEM["headline"]
        cell.detailTextLabel?.backgroundColor = #colorLiteral(red: 0, green: 0.08235294118, blue: 0.2784313725, alpha: 0)
        cell.imageView?.image = UIImage(named: WomenInSTEM["image"]!)
        return cell
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view:UIView, forSection: Int) {
        if let headerTitle = view as? UITableViewHeaderFooterView {
            headerTitle.textLabel?.textColor = UIColor.red
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = LadyDetailViewController()
        vc.detailItem = womenInSTEM[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}

