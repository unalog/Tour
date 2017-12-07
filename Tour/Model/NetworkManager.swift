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
            
            
            let url = "https://api.blockchain.info/charts/transactions-per-second"
            let parameters: Parameters = ["timespan": "5weeks" ,"rollingAverage":"8hours" ,"format":"json"]
           
            
            Alamofire.request(url, parameters: parameters)
                .responseJSON { response in
                    print(" - API url: \(String(describing: response.request!))")   // original url request
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

