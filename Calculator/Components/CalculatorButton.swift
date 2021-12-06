//
//  CalculatorButton.swift.swift
//  Calculator
//
//  Created by 이채운 on 2021/12/07.
//

import UIKit

@IBDesignable final class CalculatorButton: UIView {
  
  @IBInspectable private var value: String = "" { didSet { configureText() }}
  @IBInspectable private var textColor: String = "" { didSet { configureTextColor() }}
  @IBInspectable private var color: String = "" { didSet { configureBackgroundColor() }}
  @IBInspectable private var isZero: Bool = false { didSet { configureLayout() }}
  
  private var animator: UIViewPropertyAnimator?
  
  // MARK: - Views
  
  private let textLabel = UILabel()
  
  // MARK: - Initializations
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  // MARK: - Lifecycles
  
  override func layoutSubviews() {
    super.layoutSubviews()
    configureLayer()
  }
}

// MARK: - Configurations

private extension CalculatorButton {
  func configureText() {
    textLabel.text = value
  }
  
  func configureTextColor() {
    textLabel.textColor = UIColor.color(from: textColor)
  }
  
  func configureBackgroundColor() {
    backgroundColor = UIColor.color(from: color)
  }
  
  func configureLayout() {
    if isZero {
      NSLayoutConstraint.activate([
        textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
        textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      ])
    } else {
      NSLayoutConstraint.activate([
        textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      ])
    }
  }
  
  func configureLayer() {
    layer.cornerRadius = frame.height / 2.0
  }
}

// MARK: - Setups

private extension CalculatorButton {
  func setup() {
    textLabel.textAlignment = .left
    textLabel.font = UIFont.systemFont(ofSize: 35, weight: .regular)
    textLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(textLabel)
  }
}
