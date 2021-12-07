//
//  ViewController.swift
//  Calculator
//
//  Created by 이채운 on 2021/12/06.
//

import UIKit
import Domain

final class ViewController: UIViewController {
  
  // MARK: - Views
  
  @IBOutlet weak var calculatorLabel: CalculatorLabel!
  @IBOutlet weak var swipableStackView: SwipableStackView!
  
  // MARK: - ViewModel
  
  var viewModel: ViewModel!
  
  // MARK: - Lifecycles

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    bindViewModel()
  }
  
  private func bindViewModel() {
    assert(viewModel != nil, "ViewModel Not Injected")
    viewModel.text.bind { text in
      DispatchQueue.main.async {
        self.calculatorLabel.text = text
      }
    }
  }
}

// MARK: - Swipable StackView Delegate

extension ViewController: SwipableStackViewDelegate {
  func stackView(_ stackView: SwipableStackView, didSelectValue value: String) {
    viewModel.text.value = value
  }
}

// MARK: - Setups

private extension ViewController {
  func setup() {
    swipableStackView.delegate = self
  }
}

