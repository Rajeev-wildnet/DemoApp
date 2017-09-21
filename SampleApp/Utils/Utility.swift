//
//  Utility.swift
//  SampleApp
//
//  Created by Shatakshi on 21/09/17.
//  Copyright © 2017 Shatakshi. All rights reserved.
//

import UIKit
import CoreLocation

class Utility: UIViewController {
    
    static var currentLocation:CLLocationCoordinate2D!
    static var currentAddress:String?

    class func setUserCurrentLocation(_ curLoc:CLLocationCoordinate2D!) -> Void {
        currentLocation = curLoc
    }
    
    class func getUserCurrentLocation() -> CLLocationCoordinate2D!
    {
        return currentLocation
    }
    
    class func setUserCurrentAddress(_ curAdd:String) -> Void {
        currentAddress = curAdd
    }
    
    class func getUserCurrentAddress() -> String
    {
        return currentAddress!
    }
    
    class func textFieldBorderColor(_ view:Any, color:UIColor) -> Void {
        (view as AnyObject).layer.cornerRadius = 4.0
        (view as AnyObject).layer.masksToBounds = true
        (view as AnyObject).layer.borderColor = color.cgColor
        (view as AnyObject).layer.borderWidth = 1.0
    }
    
    
    class func addPaddingToTextField (textfield:UITextField) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height:textfield.frame.height))
        textfield.leftView = paddingView
        textfield.leftViewMode = UITextFieldViewMode.always
        textfield.tintColor = textfieldLineWhiteColor
    }
    
    class func buttonRound(_ view:Any, cornerRadius:CGFloat) -> Void {
        (view as AnyObject).layer.cornerRadius = cornerRadius
        (view as AnyObject).layer.masksToBounds = true
    }

    
   class func attributedString(string: NSString, term: NSString) -> NSAttributedString {
        let output = NSMutableAttributedString(string: string as String)
        //let underlineRange = string.range(of: term as String)
        output.addAttribute(NSFontAttributeName, value:UIFont(name: "Lato-Light", size: 21)!, range: NSMakeRange(0, term.length))
        
        return output
    }
    
    class func underlineString(string: NSString, term: NSString) -> NSAttributedString {
        let output = NSMutableAttributedString(string: string as String)
        let underlineRange = string.range(of: term as String)
        output.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: underlineRange)
        
        return output
    }

    class func validateName( _ name : String ) -> Bool
    {
        let nameRegex = "[A-Za-z]+[[\\s][A-Za-z]+]*"
        let nameTest =  NSPredicate(format:"SELF MATCHES %@", nameRegex)
        return nameTest.evaluate( with: name )
    }
    
    class func validateLengthEmail( _ email : String ) -> Bool
    {
        let range: Range<String.Index> = (String(email.characters.reversed())).range(of: "@")!
        let range1: Range<String.Index> = (String(email.characters.reversed())).range(of: ".")!
        print((String(email.characters.reversed())))

        let index: Int = email.distance(from: range1.lowerBound, to: range.lowerBound)
        if index > 2
        {
            return true
        }
        else{
            return false
        }
    }
    
    class func validateEmail( _ email : String ) -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate( with: email )
    }
    
    class func validateFirstCharacterAsAlphabet( _ email : String ) -> Bool
    {
        let first = email.rangeOfComposedCharacterSequence(at: email.startIndex)
        let match = email.rangeOfCharacter(from: NSCharacterSet.letters, options: String.CompareOptions(rawValue: 0), range: first)
        if (match  != nil) {
            // codeString starts with a letter
            return true
        }
        return false
    }

    class func validateMobile( _ mobile : String ) -> Bool
    {
        let mobRegEx = "[0-9]{6,16}$";
        let mobTest = NSPredicate(format:"SELF MATCHES %@", mobRegEx)
        return mobTest.evaluate( with: mobile )
    }

    class func validateDigits( _ name : String ) -> Bool
    {
        let nameRegex = "[-+]?[0-9]+"
        let nameTest =  NSPredicate(format:"SELF MATCHES %@", nameRegex)
        return nameTest.evaluate( with: name )
    }

    class func validateAlphanumeric( _ name : String ) -> Bool
    {
        let nameRegex = "[^a-zA-Z0-9._-\\s]"
        let nameTest =  NSPredicate(format:"SELF MATCHES %@", nameRegex)
        return nameTest.evaluate( with: name )
    }

    class func validatePassword( _ password : String ) -> Bool
    {
        return password.characters.count >= 5 && password.characters.count <= 18
    }
    
    class func isEmpty( _ string : String ) -> Bool
    {
        return string.characters.count == 0
    }

    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func generateRandomColor() -> UIColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
}
