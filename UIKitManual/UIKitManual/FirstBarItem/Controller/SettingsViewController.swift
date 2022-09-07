//
//  SettingsViewController.swift
//  UIKitManual
//
//  Created by Адель Ахметшин on 06.09.2022.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    private var precent = [0, 5, 10, 15, 20, 25]
    private var sum = 0.0
    
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.setTitle("Press me", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.masksToBounds = true
        return button
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 10
        textField.placeholder = "   TEXT"
        textField.addTarget(self, action: #selector(textFieldAction(sender:)), for: .editingChanged)
        return textField
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupView()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        view.addSubview(button)
        view.addSubview(textField)
        view.addSubview(scrollView)
    }
    
    private func setupView() {
        view.backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: precent.map {makeButton(with: $0)})
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 15
        scrollView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    private func makeButton(with percent: Int) -> UIButton {
        let button = UIButton()
        button.setTitle("Discount \(percent)% ", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.tag = percent
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        return button
    }
    
    // MARK: - Constraints
    
    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        // Button
        constraints.append(button.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 250))
        constraints.append(button.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(button.widthAnchor.constraint(equalToConstant: 200))
        
        // Text Field
        constraints.append(textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10))
        constraints.append(textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16))
        constraints.append(textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16))
        constraints.append(textField.heightAnchor.constraint(equalToConstant: 40))
        
        // Scroll View
        constraints.append(scrollView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 30))
        constraints.append(scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16))
        constraints.append(scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16))
        constraints.append(scrollView.heightAnchor.constraint(equalToConstant: 70))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Actions
    
    @objc private func buttonTapped() {
        showAlert()
    }
    
    @objc private func buttonAction(sender: UIButton) {
        let finishSum = sum - sum / 100 * Double(sender.tag)
        print(finishSum)
    }
    
    @objc private func textFieldAction(sender: UITextField) {
        sum = Double(sender.text ?? "") ?? 0.0
    }
}

// MARK: - Extension
extension SettingsViewController {
    private func showAlert() {
        let alertController = UIAlertController(title: "ScrollView", message: "Вы хотите перейти на след. экран?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in // создаем действие для контроллера
            let vc = ScrollViewController()
            vc.title = "ScrollView lesson"
            vc.navigationItem.largeTitleDisplayMode = .never
            self.navigationController?.pushViewController(vc, animated: true)
        }
        alertController.addAction(okAction) // Добавляем действие на алерт контроллер
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        alertController.preferredAction = okAction // Выделяет нужное дейтсвие жирным шрифтом
        present(alertController, animated: true) {
            print("Controller is presented")
        }
    }
}
