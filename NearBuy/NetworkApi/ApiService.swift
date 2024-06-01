//
//  ApiService.swift
//  NearBuy
//
//  Created by Tarun Khurana on 01/06/2024.
//

import Foundation
import Alamofire


typealias Success = (_ jsonValue:[String:Any]?,_ statusCode:Int) -> Void
typealias FailureCase = (_ jsonValue:[String:Any],_ errorValue:Error,_ statusCode:Int) -> Void

class ApiBaseClass: BaseUrl{
    
    
    func requestMethod(_ strURL : String, params : [String:Any]?, method:HTTPMethod, success:@escaping Success, failure:@escaping FailureCase){
      
        DispatchQueue.main.async {
            AF.request(strURL).responseJSON{ response in
           // AF.request(strURL, method: method, parameters:params, headers: theHeader).validate().responseJSON { response in
            switch response.result
            {
                
            case .success:
                guard let data = response.data,
                    let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any], let statusCode = response.response?.statusCode else {
                        success(nil, 0)
                        return
                    }
               
                DispatchQueue.main.async {
                    success(json,  statusCode)
              }
            case .failure:
                guard let data = response.data,
                    let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any], let statusCode = response.response?.statusCode else {
                        guard let error = response.error else { return }
                        if error._code == NSURLErrorTimedOut {
                            failure(["":""],error,1)
                        } else if error._code == NSURLErrorUnknown {
                            failure(["":""],error,0)
                        } else {
                            failure(["":""],error,0)
                         }
                        return
                     }
                guard let error = response.error else { return }
                DispatchQueue.main.async {
                    failure(json,error,statusCode)
                 }
             }
          }
      }
 }
    
    func getPostHTTPMethod() ->HTTPMethod {
        return .post
    }
    
    func getGetHTTPMethod() ->HTTPMethod {
        return .get
    }
}
