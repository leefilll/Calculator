//
//  TokenFactory.swift
//  Domain
//
//  Created by 이채운 on 2021/12/07.
//

import Foundation

public class TokenFactory {
  
  public init() {}
  
  public func createToken(value: String) -> Token {
    let tokenType = checkTokenType(from: value)
    switch tokenType {
    case .operand(let value):
      return Operand(value: value)
    case .operator(let operatorType):
      return Operator(operatorType: operatorType)
    case .return:
      return Operand(value: 0)
    }
  }
}

private extension TokenFactory {
  func checkTokenType(from value: String) -> TokenType {
    if isOperand(value: value) { return .operand(Double(value)!) }
    else if isOperator(value: value) { return .operator(OperatorType(rawValue: value)!) }
    else { return .return }
  }
}

// MARK: - Utils

private extension TokenFactory {
  func isOperand(value: String) -> Bool {
    return Double(value) != nil
  }
  
  func isOperator(value: String) -> Bool {
    return OperatorType(rawValue: value) != nil
  }
}


