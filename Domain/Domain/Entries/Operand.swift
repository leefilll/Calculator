//
//  Operand.swift
//  Domain
//
//  Created by 이채운 on 2021/12/08.
//

import Foundation

public struct Operand: Token, Codable {
  
  private var value: Double
  public var tokenType: TokenType { return .operand(value) }
  
  init(value: Double) {
    self.value = value
  }
}
