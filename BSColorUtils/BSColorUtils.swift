//
//  BSColorUtils.swift
//  BSColorUtils
//
//  Created by bslayter on 2/8/17.
//  Copyright © 2017 bslayter. All rights reserved.
//

import UIKit

extension String {
    func getStringRange(withStart start: Int, end: Int) -> Range<String.Index> {
        let startIndex = self.index(self.startIndex, offsetBy: start)
        let endIndex = self.index(self.startIndex, offsetBy: end)
        
        return startIndex..<endIndex
    }
}

extension UIColor {
    /// Get a `UIColor` with whole value RGB values instead of the standard 0 to 1 float values
    ///
    /// - Parameters:
    ///   - red: red component
    ///   - green: green component
    ///   - blue: blue component
    /// - Returns: A `UIColor` object with the given parameters
    public class func withRGB(red: Int, green: Int, blue: Int) -> UIColor {
        return UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1)
    }
    
    /// Get a `UIColor` object represented by a hex string
    ///
    /// - Parameter hexString: The hexstring to convert
    /// - Returns: A `UIColor` object representing the hex string
    public class func withHex(hexString: String) -> UIColor {
        var hexString = hexString
        if hexString.hasPrefix("#") {
            hexString = hexString.substring(from: hexString.index(after: hexString.startIndex))
        }
        
        // determine if we are dealing with single or double digit color strings
        let digitCount = hexString.characters.count / 3
        
        var redPart = hexString.substring(with: hexString.getStringRange(withStart: 0, end: digitCount))
        var greenPart = hexString.substring(with: hexString.getStringRange(withStart: digitCount, end: digitCount * 2))
        var bluePart = hexString.substring(with: hexString.getStringRange(withStart: digitCount * 2, end: digitCount * 3))
        
        if digitCount == 1 {
            // For strings like "F00" we need to duplicate each digit
            redPart += redPart
            greenPart += greenPart
            bluePart += bluePart
        }
        
        let red = Int(redPart, radix: 16) ?? 0
        let green = Int(greenPart, radix: 16) ?? 0
        let blue = Int(bluePart, radix: 16) ?? 0
        
        return UIColor.withRGB(red: red, green: green, blue: blue)
    }
}
