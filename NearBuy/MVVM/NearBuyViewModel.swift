//
//  NearBuyViewModel.swift
//  NearBuy
//
//  Created by Tarun Khurana on 01/06/24.
//

import Foundation

class NearBuyViewModel:ApiBaseClass{
    
    var nearBuyModel: NearBuyModel?
    var page = 1
    var perPage = 10
    var lat = 12.971599
    var long = 77.594566
    var response:[String:AnyObject]! {
        didSet {
            guard let data = NearBuyModel(JSON: response) else { return }
            nearBuyModel = data
        }
    }
    
    func getCitiesList(_ searchCityName: String,_ completion: @escaping (_ statusInResponse: StatusInResponse, _ message: String) -> Void) {
        self.requestMethod(self.fetchCityURL(perPage, page, "Mzg0OTc0Njl8MTcwMDgxMTg5NC44MDk2NjY5",searchCityName,lat,long), params: [:], method: self.getPostHTTPMethod(), success: { [weak self]response,statusCode  in
            switch statusCode {
            case 200:
                let status = self?.handleGetCityApiResponse(response: response)
                if status == 1{
                    completion(.proceed,"success")}
                break
            default:
                break
               }
            }, failure: { errorMessage,error, statusCode  in
                completion(.popUp,"")
            })
    }
     
    
    func handleGetCityApiResponse(response:[String:Any]?) -> Int{
        guard let responseValue = response else { return -1}
        self.response = responseValue as [String : AnyObject]
        return 1
    }
    
    
}
