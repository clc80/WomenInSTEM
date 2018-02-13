//
//  DataServices.swift
//  Women_in_STEM
//
//  Created by Claudia Contreras on 2/5/18.
//  Copyright © 2018 thecoderpilot. All rights reserved.
//

import Foundation

class DataService {
    static let instance = DataService()
    
    var womenInSTEM = [[String: String]]()
    
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
            //tableView.reloadData()
        }
    }
}
