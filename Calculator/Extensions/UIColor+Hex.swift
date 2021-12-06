//
//  UIColor+Hex.swift
//  Calculator
//
//  Created by 이채운 on 2021/12/07.
//

import UIKit

extension UIColor {
  fileprivate static func fromHex(_ hex: Int, alpha: Float = 1.0) -> UIColor {
    let red = Float((hex >> 16) & 0xFF)
    let green = Float((hex >> 8) & 0xFF)
    let blue = Float(hex & 0xFF)
    
    return UIColor(displayP3Red: CGFloat(red / 255.0),
                   green: CGFloat(green / 255.0),
                   blue: CGFloat(blue / 255.0),
                   alpha: CGFloat(alpha))
  }
  
  static var grey: UIColor { return UIColor.fromHex(0xA5A5A5) }
  static var mediumGrey: UIColor { return UIColor.fromHex(0x333333) }
  static var darkGrey: UIColor { return UIColor.fromHex(0x212121) }
  static var orange: UIColor { return UIColor.fromHex(0xF1A33C) }
  
  static func color(from string: String) -> UIColor {
    switch string {
    case "black": return UIColor.black
    case "white": return UIColor.white
    case "grey": return UIColor.grey
    case "mediumGrey": return UIColor.mediumGrey
    case "darkGrey": return UIColor.darkGrey
    case "orange": return UIColor.orange
    default: return UIColor.tintColor
    }
  }
}


