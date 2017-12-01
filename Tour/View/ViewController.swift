//
//  ViewController.swift
//  Tour
//
//  Created by una on 2017. 12. 1..
//  Copyright © 2017년 una. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewModel:ListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = ListViewModel();
        viewModel?.loadData();
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

