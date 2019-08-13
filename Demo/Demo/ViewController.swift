//
//  ViewController.swift
//  Demo
//
//  Created by roy on 2019/7/24.
//  Copyright © 2019 royite. All rights reserved.
//

import UIKit
import Swifty

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let view = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
            .added(to: self.view)
            .config {
                $0.backgroundColor = .black
        }
    }
}

