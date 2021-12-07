//
//  TokenType.swift
//  Domain
//
//  Created by 이채운 on 2021/12/07.
//

import Foundation

public enum TokenType {
  case operand(Double)
  case `operator`(OperatorType)
  case `return`
  
  public static func getTokenType(from value: String) -> TokenType {
    if let operandValue = Double(value) {
      return .operand(operandValue)
    } else if let operatorType = OperatorType(rawValue: value) {
      return .operator(operatorType)
    } else {
      return .return
    }
  }
}
