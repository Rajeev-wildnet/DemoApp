//
//  ServiceClient.swift
//  SuperMom
//
//  Created by Rajeev on 13/09/17.
//  Copyright © 2017 Wildnet. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

struct ServiceClient {
    
    // MARK: - General API -
    
    static func call(_ router: String,method:HTTPMethod ,param: [String: Any], header: [String: String], callback:@escaping (AnyObject?) ->()) -> (){
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(router, method: method, parameters: param, encoding: JSONEncoding.default, headers: header  as HTTPHeaders).validate().responseJSON
            {response in
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    callback(response.result.value as AnyObject?)
                }
                
        }
    }
    
    
    static func uploadWithAlamofire(_ router: String, parameters: [String: String], imageData: Data, callback:@escaping (AnyObject?)->()) -> () {
        
        // Begin upload
        Alamofire.upload( multipartFormData: { multipartFormData in
            
            multipartFormData.append(imageData, withName: "file", fileName: "myImage.png", mimeType: "image/png")
            
            // import parameters
            for (key, value) in parameters {
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }}
            , to: router, method: .post,
              
              encodingCompletion: { encodingResult in
                
                switch encodingResult {
                    
                case .success(let upload, _, _):
                    
                    upload.responseJSON { response in
                        
                        callback(response.result.value as AnyObject?)
                    }
                case .failure(let encodingError):
                    
                    callback(nil)
                    print("**ERROR")
                    print(encodingError)
                }
        })
    }
}
