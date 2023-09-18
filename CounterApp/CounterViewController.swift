//
//  ViewController.swift
//  CounterApp
//
//  Created by Dmitry Dmitry on 18.09.2023.
//

import UIKit

class CounterViewController: UIViewController {
    
    enum ButtonTapped {
        case increasedButton
        case decreasedButton
        case resetButton
    }
    
    
    @IBOutlet weak var counterValueLabel: UILabel!
    
    @IBOutlet weak var changeHistory: UITextView!
    
    @IBOutlet weak var increaseButton: UIButton!
    
    @IBOutlet weak var decreaseButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    private var counterValue: Int = 0 {
        didSet {
            if counterValue >= 0 {
                counterValueLabel.text = "Значение счётчика: \(counterValue)"
            } else {
                counterValue = 0
                counterValueLabel.text = "Значение счётчика: \(counterValue)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterValueLabel.text = "Значение счётчика: \(counterValue)"
        setupView()
        
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var buttonTapped: ButtonTapped?
        
        //        switch sender {
        //        case increaseButton:
        //            setLabelValue(buttonTapped: .increasedButton)
        //        case decreaseButton:
        //            setLabelValue(buttonTapped: .decreasedButton)
        //        case resetButton:
        //            setLabelValue(buttonTapped: .resetButton)
        //        default:
        //            break
        //        }
        
        switch sender {
        case increaseButton:
            buttonTapped = .increasedButton
        case decreaseButton:
            buttonTapped = .decreasedButton
        case resetButton:
            buttonTapped = .resetButton
        default:
            break
        }
        
        if let buttonTapped = buttonTapped {
            setLabelValue(buttonTapped: buttonTapped)
        }
    }
    
    private func setupView() {
        increaseButton.backgroundColor = .red
        increaseButton.setTitle("+", for: .normal)
        increaseButton.tintColor = .white
        increaseButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        increaseButton.layer.cornerRadius = 10
        
        decreaseButton.backgroundColor = .blue
        decreaseButton.setTitle("-", for: .normal)
        decreaseButton.tintColor = .white
        decreaseButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        decreaseButton.layer.cornerRadius = 10
        
        resetButton.backgroundColor = .gray
        resetButton.setTitle("reset", for: .normal)
        resetButton.tintColor = .white
        resetButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        resetButton.layer.cornerRadius = 10
    }
    
    private func setLabelValue(buttonTapped: ButtonTapped) {
        switch buttonTapped {
            
        case .increasedButton:
            counterValue += 1
        case .decreasedButton:
            counterValue -= 1
        case .resetButton:
            counterValue = 0
        }
    }

    
}
