//
//  SwipableStackView.swift
//  Calculator
//
//  Created by 이채운 on 2021/12/07.
//

import UIKit

final class SwipableStackView: UIStackView {
  
  private var latestHighligtedButton: CalculatorButton?
  private var latestSelectedButton: CalculatorButton?
  
  // MARK: - Initializations
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  // MARK: - Touch Events
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let calculatorButton = calculatorButton(in: touches, with: event) else { return }
    latestHighligtedButton = calculatorButton
    calculatorButton.highlight()
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let calculatorButton = calculatorButton(in: touches, with: event) else {
      latestHighligtedButton?.dehighlight()
      return
    }
    guard latestHighligtedButton != calculatorButton else { return }
    latestHighligtedButton?.dehighlight()
    calculatorButton.highlight()
    latestHighligtedButton = calculatorButton
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let calculatorButton = calculatorButton(in: touches, with: event) else { return }
    calculatorButton.dehighlight()
    
    if calculatorButton.isUtil == false {
      latestSelectedButton?.dehighlight()
    }
    
    latestSelectedButton = calculatorButton
    guard latestSelectedButton?.isSelectable == true else { return }
    latestSelectedButton?.select()
  }
}

// MARK: - Utils

private extension SwipableStackView {
  func calculatorButton(in touches: Set<UITouch>, with event: UIEvent?) -> CalculatorButton? {
    if let location = touches.first?.location(in: self),
       let calculatorButton = hitTest(location, with: event) as? CalculatorButton {
      return calculatorButton
    }
    return nil
  }
}
