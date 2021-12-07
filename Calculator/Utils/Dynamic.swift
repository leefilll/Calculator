//
//  Dynamic.swift
//  Calculator
//
//  Created by 이채운 on 2021/12/07.
//

import Foundation

class Dynamic<T> {
  typealias Listener = (T) -> Void
  
  var listener: Listener?
  
  var value: T { didSet { listener?(value) }}
  
  init(_ value: T) {
    self.value = value
  }
  
  func bind(_ listner: Listener?) {
    self.listener = listner
  }
}
