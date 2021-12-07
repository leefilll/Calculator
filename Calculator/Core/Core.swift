//
//  Core.swift
//  Calculator
//
//  Created by 이채운 on 2021/12/07.
//

import Foundation
import Domain

public class Core {
  
  var tokenStack: [Token] = []
  var tokenFactory: TokenFactory = TokenFactory()
  
  func receiveInput(value: String) {
    let token = tokenFactory.createToken(value: value)
    
    if case TokenType.operand(let number) = token.tokenType {
    }
  }
}

private extension Core {
}
