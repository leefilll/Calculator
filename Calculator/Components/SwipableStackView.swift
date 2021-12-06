//
//  SwipableStackView.swift
//  Calculator
//
//  Created by 이채운 on 2021/12/07.
//

import UIKit

final class SwipableStackView: UIStackView {
  
  private var latestHighligtedButton: CalculatorButton?
  
  // MARK: - Initializations
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    let view = super.hitTest(point, with: event)
    
    if view != nil {
      return view
    }
    
    return nil
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
    latestHighligtedButton?.select()
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
