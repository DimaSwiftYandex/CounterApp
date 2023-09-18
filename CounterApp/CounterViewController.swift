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
                let message = "[\(currentDateAndTime())]: попытка уменьшить значение счётчика ниже 0"
                changeHistory.text = changeHistory.text + "\n" + message
                counterValue = 0
                counterValueLabel.text = "Значение счётчика: \(counterValue)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        counterValueLabel.text = "Значение счётчика: \(counterValue)"
        changeHistory.text = "История изменений:"
        
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var buttonTapped: ButtonTapped?
        
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
            showHistoryOfChanges(buttonTapped: buttonTapped)
        }
    }
    
    private func setupView() {
        
        changeHistory.textColor = .white
        changeHistory.isEditable = false
        
        counterValueLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        counterValueLabel.numberOfLines = 0
        counterValueLabel.textAlignment = .center
        
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20, weight: .bold),
            .foregroundColor: UIColor.white
        ]
        
        let buttonDetails: [(
            button: UIButton,
            title: String,
            color: UIColor
        )] = [
            (increaseButton, "+", .red),
            (decreaseButton, "-", .blue),
            (resetButton, "reset", .gray)
        ]
        
        for detail in buttonDetails {
            detail.button.backgroundColor = detail.color
            detail.button.setTitleColor(.white, for: .normal)
            detail.button.setAttributedTitle(
                NSAttributedString(
                    string: detail.title,
                    attributes: attributes
                ),
                for: .normal
            )
            detail.button.layer.cornerRadius = 10
        }
        
//        increaseButton.titleLabel?.font = UIFont.systemFont(ofSize: 40, weight: .bold)
//        decreaseButton.titleLabel?.font = UIFont.systemFont(ofSize: 40, weight: .bold)
//        resetButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
       
    }
    
    private func currentDateAndTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return dateFormatter.string(from: Date())
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
    
    private func showHistoryOfChanges(buttonTapped: ButtonTapped) {
        var newEntry: String = ""
        
        switch buttonTapped {
            
        case .increasedButton:
            newEntry = "[\(currentDateAndTime())]: значение изменено на +1"
        case .decreasedButton:
            newEntry = "[\(currentDateAndTime())]: значение изменено на -1"
        case .resetButton:
            newEntry = "[\(currentDateAndTime())]: значение сброшено"
        }
        
        changeHistory.text = changeHistory.text + "\n" + newEntry
    }
    
}
