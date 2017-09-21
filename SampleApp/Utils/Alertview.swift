//
//  Alertview.swift
//  SampleApp
//
//  Created by Shatakshi on 21/09/17.
//  Copyright © 2017 Shatakshi. All rights reserved.
//

import UIKit

extension UIViewController {
    
    public func alert(_ message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    public func alertWithCancel(_ message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction!) in
        }
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    public func alertWithYesNo(_ message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "YES", style: .default, handler: nil)
        alertController.addAction(OKAction)
        let cancelAction = UIAlertAction(title: "NO", style: .cancel) { (action:UIAlertAction!) in
        }
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
