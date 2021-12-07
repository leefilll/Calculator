//
//  ViewModel.swift
//  Calculator
//
//  Created by 이채운 on 2021/12/07.
//

import Foundation

final class ViewModel {
  
  private var numberStack: [Double] = []
  private var operationStack: [String] = []
  
  // MARK: - States
  
  var text = Dynamic<String>("")
}

private extension ViewModel {
  
}
