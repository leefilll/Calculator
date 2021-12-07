//
//  CalculatorLabel.swift
//  Calculator
//
//  Created by 이채운 on 2021/12/07.
//

import UIKit

@IBDesignable final class CalculatorLabel: UILabel {
  
  @IBInspectable var value: String = "0"
  
  // MARK: - Initializations
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
}

// MARK: - Configurations

private extension CalculatorLabel {
  func configure() {
    text = value
  }
}

// MARK: - Setups

private extension CalculatorLabel {
  func setup() {
    font = UIFont.systemFont(ofSize: 95, weight: .thin)
    textColor = UIColor.white
    textAlignment = .right
  }
}
