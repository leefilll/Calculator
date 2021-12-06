//
//  UIColor+Lighter.swift
//  Calculator
//
//  Created by 이채운 on 2021/12/07.
//

import UIKit

extension UIColor {
  fileprivate func adjust(by percentage: CGFloat) -> UIColor? {
    var hue: CGFloat = 0
    var saturation: CGFloat = 0
    var brightness: CGFloat = 0
    var alpha: CGFloat = 0
    
    if getHue(&hue,
              saturation: &saturation,
              brightness: &brightness,
              alpha: &alpha) {
      return UIColor(hue: hue,
                     saturation: saturation * (percentage / 100),
                     brightness: min(brightness + (percentage / 100), 1.0),
                     alpha: alpha)
    } else {
      return nil
    }
  }
  
  func lighter(by percentage: CGFloat = 20.0) -> UIColor? {
    return adjust(by: percentage)
  }
}
