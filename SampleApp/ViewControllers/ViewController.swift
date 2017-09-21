//
//  ViewController.swift
//  SampleApp
//
//  Created by Shatakshi on 21/09/17.
//  Copyright © 2017 Shatakshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CoreDataControllers.saveLoginData("Shatakshi", email: "shatakshi@gmail.com")
         print(CoreDataControllers.getLoginData())

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

