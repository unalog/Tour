//
//  NetworkManager.swift
//  Tour
//
//  Created by una on 2017. 12. 1..
//  Copyright © 2017년 una. All rights reserved.
//

import UIKit
import Alamofire

class NetworkManager: NSObject {

    
    func requestTest(){
    
        let url = "http://api.visitkorea.or.kr/openapi/service"
        let parameters: Parameters = ["serviceKey": "75xv7sV%2FeAJ90ck6Mupkrv1aUVcquW0FhZKUnZKiyPLlcEK5Z4Tb0KwBc4JtOaYsJ577wErxz1pYPiyAPfWtZw%3D%3D" ,"numOfRows":"10" ,"pageSize":"10" ,"pageNo":"10" ,"startPage":"1" ,"MobileOS":"IOS" ,"MobileApp":"AppTest" ,"areaCode":"1"]
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .responseString{ response in
                
                print(" - API url: \(String(describing: response.request!))")   // original url request
                var statusCode = response.response?.statusCode
                
                switch response.result {
                case .success:
                    print("status code is: \(String(describing: statusCode))")
                    if let string = response.result.value {
                        print("XML: \(string)")
                    }
                case .failure(let error):
                    statusCode = error._code // statusCode private
                    print("status code is: \(String(describing: statusCode))")
                    print(error)
                }
                
        }
    
    }
}

