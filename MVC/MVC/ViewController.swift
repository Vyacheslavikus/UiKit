//
//  ViewController.swift
//  MVC
//
//  Created by Слава on 10.02.2024.
//

import UIKit

class ViewController: UIViewController {
    let wordConverter = WordConverter()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .white

        let startButton = UIButton(type: .system)
        startButton.setTitle("Начать", for: .normal)
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)

        view.addSubview(startButton)

        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func startButtonTapped() {
        showAlert()
    }

    func showAlert() {
        let alert = UIAlertController(title: "Введите слово", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Введите буквосочетание"
        }

        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            if let inputText = alert.textFields?.first?.text {
                let result = self?.wordConverter.convertToWord(input: inputText) ?? ""
                self?.showResult(result)
            }
        }

        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    func showResult(_ result: String) {
        let resultAlert = UIAlertController(title: "Результат", message: result, preferredStyle: .alert)
        resultAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(resultAlert, animated: true, completion: nil)
    }
}

class WordConverter {
    func convertToWord(input: String) -> String {
        let mapping = ["l": "h", "e": "e", "o": "l", "h": "o"]

        var result = "hello"
        return result
    }
}




