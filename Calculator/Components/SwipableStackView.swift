//
//  SwipableStackView.swift
//  Calculator
//
//  Created by 이채운 on 2021/12/07.
//

import UIKit

protocol SwipableStackViewDelegate: AnyObject {
  func stackView(_ stackView: SwipableStackView, didSelectValue value: String)
}

final class SwipableStackView: UIStackView {
  
  public weak var delegate: SwipableStackViewDelegate?
  
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
    delegate?.stackView(self, didSelectValue: calculatorButton.value)
    calculatorButton.dehighlight()
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
