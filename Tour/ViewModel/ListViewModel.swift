//
//  ListViewModel.swift
//  Tour
//
//  Created by una on 2017. 12. 1..
//  Copyright © 2017년 una. All rights reserved.
//

import UIKit
import RxSwift
import SwiftyJSON

class ListViewModel: NSObject {

    
    
    func test(){
        
        let disbposeBag = DisposeBag()
        
        
        _ = Observable.just("1").subscribe(onNext: { (data) in
             print("onNext")
        }, onError: { (error) in
            print("onError")
        }, onCompleted: {
            print("completed")
        }, onDisposed: {
            print("onDisposeable")
        })
        .disposed(by: disbposeBag)
       
       
        
    }
    func loadData(){

        let networking = NetworkManager();
        
        _ = networking.requestTest()
            .subscribe(
                onNext: { (data) in
                    print("onNext")
                    print(data)
            },
                onError: { (error) in
                    print("onError")
                     print(error)
            },
                onCompleted: {
                    print("onCompleted")
            }) {
                print("onDisposeable")
        }
    }
}
