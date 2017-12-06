//
//  NetworkManager.swift
//  Tour
//
//  Created by una on 2017. 12. 1..
//  Copyright © 2017년 una. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import RxSwift
import RxCocoa


class NetworkManager: Any {

   
    func requestTest()->Observable<Any>{
        
        return Observable<Any>.create({ (obserbable) -> Disposable in
            
            
            let url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode"
            let parameters: Parameters = ["serviceKey": "75xv7sV%2FeAJ90ck6Mupkrv1aUVcquW0FhZKUnZKiyPLlcEK5Z4Tb0KwBc4JtOaYsJ577wErxz1pYPiyAPfWtZw%3D%3D" ,"numOfRows":"10" ,"pageSize":"10" ,"pageNo":"10" ,"startPage":"1" ,"MobileOS":"IOS" ,"MobileApp":"AppTest" ,"areaCode":"1", "_type":"json"]
            let headers: HTTPHeaders = [
                "Accept": "application/json"
            ]
            
            Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers)
                .responseJSON { response in
                    //print(" - API url: \(String(describing: response.request!))")   // original url request
                    var statusCode = response.response?.statusCode
                    
                    switch response.result {
                    case .success:
                        print("status code is: \(String(describing: statusCode))")
                        
                        
                        if let json = response.data {
                            if let data =  try? JSON(data: json)
                            {
                            
                                
                                obserbable.onNext(data)
                                obserbable.onCompleted()
                                
                            }
                            
                        }
                        
                    case .failure(let error):
                        statusCode = error._code // statusCode private
                        
                        obserbable.onError(error)
                    }
                    
            }
            return Disposables.create {
                print("disposable craeted")
            }
        })
        
    }
    
}

