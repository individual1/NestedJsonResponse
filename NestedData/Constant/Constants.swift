//
//  Constants.swift
//  ACTA
//
//  Created by Bhawna on 18/05/17.
//  Copyright © 2017 Bhawna. All rights reserved.
//

import UIKit


struct NAVTITTLES {
    static let NAV_HOME = "Home"
    static let NAV_RESPONSE = "Response Data"
    
}


struct ERROR_MESSAGE {
    static let Error = "Error"
    static let EMPTY_URL_MSG = "Please enter url"
    static let VALID_URL_MSG = "Please enter a valid url"
     static let NO_DATA = "No Data"
}

func ColorCode(red:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
}


