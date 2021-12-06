//
//  UseCaseProvider.swift
//  Domain
//
//  Created by 이채운 on 2021/12/06.
//

import Foundation

public protocol UseCaseProvider {
  func createHistoryUseCase() -> Int
}
