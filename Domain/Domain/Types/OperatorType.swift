//
//  OperatorType.swift
//  Domain
//
//  Created by 이채운 on 2021/12/07.
//

import Foundation

public enum OperatorType: String, Codable {
  case divide = "÷"
  case multiply = "x"
  case minus = "﹣"
  case plus = "+"
  
  var priority: Int {
    switch self {
    case .minus, .plus: return 0
    case .multiply, .divide: return 1
    }
  }
}
