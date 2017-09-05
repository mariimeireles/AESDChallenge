//
//  DeviceScale.swift
//  test
//
//  Created by Mariana Meireles on 05/09/17.
//  Copyright © 2017 Mariana Meireles. All rights reserved.
//

import Foundation
import UIKit


public extension UIScreen{
    
    class func changeScale(vector: CGRect) -> CGRect {
        
        //Refence of Iphone6
        let widhtiPhone6: CGFloat = 375
        let heightiPhone6: CGFloat = 667
        
        //Screen Size
        let screenSize = UIScreen.main.bounds
        
        //New Scale
        let xScale = screenSize.width/widhtiPhone6
        let yScale = screenSize.height/heightiPhone6
        
        //Transform Input Vector
        let newVector = CGRect(x: vector.origin.x*xScale, y: vector.origin.y*yScale, width: vector.width*xScale, height: vector.height*yScale)
        
        return newVector
    }
}
