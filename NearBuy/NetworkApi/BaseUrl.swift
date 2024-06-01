//
//  BaseUrl.swift
//  NearBuy
//
//  Created by Tarun Khurana on 01/06/2024.
//

import Foundation
import UIKit

enum StatusInResponse : Int{
    case proceed = 1
    case popUp
    case cancel
    case noData 
}

enum HttpContentType: String {
    case urlecncoded = "application/x-www-form-urlencoded"
    case json = "application/json"
    case multipart = "multipart/form-data; boundary="
}


class BaseUrl{
    
    func fetchCityURL(_ perPage:Int, _ page:Int,_ clientid: String,_ searchCityName: String,_ lat: Double, _ long: Double)-> String{
        return "https://api.seatgeek.com/2/venues?per_page=\(perPage)&page=\(page)&client_id=\(clientid)&lat=\(lat)&lon=\(long)&range=12mi&q=\(searchCityName)"

    }
  
}

