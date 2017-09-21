//
//  Extension.swift
//  SampleApp
//
//  Created by Rajeev on 21/09/17.
//  Copyright © 2017 Shatakshi. All rights reserved.
//

import UIKit

extension UIImageView {
    func setCornerRadious(value:CGFloat){
       self.layer.cornerRadius = value
       self.layer.masksToBounds = true
    }
}
