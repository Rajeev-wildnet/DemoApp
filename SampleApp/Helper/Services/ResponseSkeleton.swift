//
//  ResponseSkeleton.swift
//  SuperMom
//
//  Created by Rajeev on 13/09/17.
//  Copyright © 2017 Wildnet. All rights reserved.
//

import Foundation
import SwiftyJSON

open class ResponseSkeleton: NSObject
{
  fileprivate var resource: AnyObject!
  fileprivate var success: Bool!
  fileprivate var errors: AnyObject!
  fileprivate var statusCode:AnyObject!
    fileprivate var message:AnyObject!

  // MARK: Initializer
  
  public init(_ data: AnyObject)
  {
    let json = JSON(data)
    
    self.resource   = json["results"].object as AnyObject!
    self.success    = json["status"].object as? Bool
    self.errors     = json["error"].object as AnyObject!
    self.statusCode = json["status"].object as AnyObject!
    self.message    = json["msg"].object as AnyObject!

  }
  
  open func getResource() -> AnyObject
  {
    return resource
  }
  
    open func getMessage() -> AnyObject
    {
        return message
    }
    
  open func getSuccess() -> Bool
  {
    return success
  }
  
  open func getErrors() -> AnyObject
  {
    return errors
  }
    
    open func getStatusCode() -> Int
    {
        if let statusCode = self.statusCode as? Int
        {
            return statusCode
        }
        
        return -1
    }
}
