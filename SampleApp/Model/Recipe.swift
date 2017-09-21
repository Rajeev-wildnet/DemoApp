//
//  Recipe.swift
//  SampleApp
//
//  Created by Rajeev on 21/09/17.
//  Copyright © 2017 Shatakshi. All rights reserved.
//

import UIKit

class Recipe: NSObject {
    var title:String
    var thumbnail:String
    var ingredients:String
    var href:String
    
    init(title:String ,thumbnail:String , ingredients:String , href:String ) {
       self.title = title
       self.thumbnail = thumbnail
        self.ingredients = ingredients
        self.href = href
    }

}
