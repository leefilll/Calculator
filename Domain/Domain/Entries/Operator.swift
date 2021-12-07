//
//  Operator.swift
//  Domain
//
//  Created by 이채운 on 2021/12/07.
//

import Foundation

public struct Operator: Token, Codable {
  
  private var operatorType: OperatorType
  public var tokenType: TokenType { return .operator(operatorType) }
  
  init(operatorType: OperatorType) {
    self.operatorType = operatorType
  }
}
