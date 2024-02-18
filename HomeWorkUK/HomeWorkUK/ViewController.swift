//
//  ViewController.swift
//  HomeWorkUK
//
//  Created by Слава on 07.02.2024.
//


import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func setupUI() {
        view.backgroundColor = .white
        
        let additionButton = UIButton(type: .system)
        additionButton.setTitle("Сложение", for: .normal)
        additionButton.addTarget(self, action: #selector(additionButtonTapped), for: .touchUpInside)
        
        let guessNumberButton = UIButton(type: .system)
        guessNumberButton.setTitle("Угадай число", for: .normal)
        guessNumberButton.addTarget(self, action: #selector(guessNumberButtonTapped), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [additionButton, guessNumberButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func additionButtonTapped() {
        let alert = UIAlertController(title: "Сложение", message: "Введите два числа", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Число 1"
            textField.keyboardType = .numberPad
        }
        
        alert.addTextField { textField in
            textField.placeholder = "Число 2"
            textField.keyboardType = .numberPad
        }
        
        alert.addAction(UIAlertAction(title: "Посчитать", style: .default, handler: { _ in
            if let textFields = alert.textFields, textFields.count == 2,
               let number1 = Double(textFields[0].text ?? ""),
               let number2 = Double(textFields[1].text ?? "") {
                let sum = number1 + number2
                self.showAlert(message: "Результат сложения: \(sum)")
            } else {
                self.showAlert(message: "Введите корректные числа.")
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc func guessNumberButtonTapped() {
        let randomNumber = Int.random(in: 1...100)
        let alert = UIAlertController(title: "Угадай число", message: "Введите число от 1 до 100", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Введите число"
            textField.keyboardType = .numberPad
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            if let enteredText = alert.textFields?.first?.text, let enteredNumber = Int(enteredText) {
                if (1...100).contains(enteredNumber){
                    if enteredNumber == randomNumber {
                        self.showAlert(message: "Поздравляем! Вы угадали число.")
                    } else {
                        self.showAlert(message: "Увы, правильное число было \(randomNumber). Попробуйте еще раз!")
                    }
                } else {
                    self.showAlert(message: "Введите корректное число.")
                }
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Результат", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}



