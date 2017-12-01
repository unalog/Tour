//
//  ListViewModel.swift
//  Tour
//
//  Created by una on 2017. 12. 1..
//  Copyright © 2017년 una. All rights reserved.
//

import UIKit

class ListViewModel: NSObject {

    
    func loadData(){

        let networking = NetworkManager();
        networking.requestTest();
    }
}
