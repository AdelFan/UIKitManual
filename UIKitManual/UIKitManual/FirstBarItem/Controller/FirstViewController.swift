//
//  FirstController.swift
//  UIKitManual
//
//  Created by Адель Ахметшин on 05.09.2022.
//

import Foundation
import UIKit

class FirstViewController: UIViewController {
    private var images: [UIImage]?
    private var validator = Validator()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 15)
        label.shadowColor = .green
        label.shadowOffset = CGSize(width: 1, height: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let myView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .link
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.clipsToBounds = true
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "circle.grid.cross.fill")
        return imageView
    }()
    
    private let buttonOne: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.setTitle("Press me", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private let buttonTwo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.setTitle("Page Control", for: .normal)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(buttonTappedTwo), for: .touchUpInside)
        return button
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = .systemFont(ofSize: 20, weight: .bold)
        textField.placeholder = "Enter text"
        textField.keyboardType = .phonePad
        textField.keyboardAppearance = .dark // цвет фона клавиатуры
        textField.clearButtonMode = .always
        //        textField.becomeFirstResponder() // при переходе на экран, курсор сразу будет находиться в поле ввода
        return textField
    }()
    
    private let segmentMenu: UISegmentedControl = {
        let segmentMenu = UISegmentedControl(items: ["Pink", "Teal", "Brown"])
        segmentMenu.alpha = 0
        segmentMenu.translatesAutoresizingMaskIntoConstraints = false
        segmentMenu.selectedSegmentIndex = 1
        segmentMenu.backgroundColor = .white
        segmentMenu.tintColor = .black
        segmentMenu.addTarget(self, action: #selector(tapSegmentControl), for: .valueChanged)
        segmentMenu.selectedSegmentTintColor = .systemCyan
        segmentMenu.setWidth(90, forSegmentAt: 1)
        segmentMenu.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Arial", size: 15), NSAttributedString.Key.foregroundColor: UIColor.systemRed], for: .normal)
        segmentMenu.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Arial", size: 19), NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        return segmentMenu
    }()
    
    private let switchObject: UISwitch = {
        let switchObject = UISwitch()
        switchObject.translatesAutoresizingMaskIntoConstraints = false
        switchObject.isOn = false
        switchObject.addTarget(self, action: #selector(moveSwitch(sender:)), for: .valueChanged)
        return switchObject
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupView()
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    // MARK: - Settings
    private func setupHierarchy() {
        title = "Main"
        view.addSubview(myView)
        view.addSubview(buttonOne)
        view.addSubview(textField)
        view.addSubview(buttonTwo)
        view.addSubview(segmentMenu)
        view.addSubview(switchObject)
        myView.addSubview(label)
        myView.addSubview(imageView)
        textField.delegate = self
        self.navigationController?.navigationBar.tintColor = .black // делаем элементы НавБара черным цветом
    }
    
    private func setupView() {
        view.backgroundColor = .systemTeal
        label.text = "I'm do something..."
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettings))
    }
    
    // MARK: - Constraints
    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        // Blue view
        constraints.append(myView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(myView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 250))
        constraints.append(myView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8))
        constraints.append(myView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2))
        
        // Inscription (надпись)
        constraints.append(label.centerXAnchor.constraint(equalTo: myView.centerXAnchor))
        constraints.append(label.centerYAnchor.constraint(equalTo: myView.centerYAnchor, constant: -60))
        constraints.append(label.widthAnchor.constraint(equalTo: myView.widthAnchor, multiplier: 0.5))
        constraints.append(label.heightAnchor.constraint(equalTo: myView.heightAnchor, multiplier: 0.5))
        
        // Image
        constraints.append(imageView.centerXAnchor.constraint(equalTo: myView.centerXAnchor))
        constraints.append(imageView.centerYAnchor.constraint(equalTo: myView.centerYAnchor, constant: -15))
        constraints.append(imageView.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(imageView.widthAnchor.constraint(equalToConstant: 50))
        
        // Button One
        constraints.append(buttonOne.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(buttonOne.centerYAnchor.constraint(equalTo: myView.bottomAnchor, constant: 50))
        constraints.append(buttonOne.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(buttonOne.widthAnchor.constraint(equalToConstant: 200))
        
        //Text Field
        constraints.append(textField.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        //        constraints.append(textField.centerYAnchor.constraint(equalTo: buttonOne.bottomAnchor, constant: 30))
        constraints.append(textField.topAnchor.constraint(equalTo: buttonOne.bottomAnchor, constant: 30))
        constraints.append(textField.heightAnchor.constraint(equalToConstant: 50))
        
        // Segment control
        constraints.append(segmentMenu.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(segmentMenu.topAnchor.constraint(equalTo: buttonOne.bottomAnchor, constant: 90))
        constraints.append(segmentMenu.widthAnchor.constraint(equalToConstant: 300))
        
        // Switch
        constraints.append(switchObject.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(switchObject.topAnchor.constraint(equalTo: segmentMenu.bottomAnchor, constant: 90))
        constraints.append(switchObject.widthAnchor.constraint(equalToConstant: 150))
        
        // Button Two
        constraints.append(buttonTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(buttonTwo.topAnchor.constraint(equalTo: switchObject.bottomAnchor, constant: 30))
        constraints.append(buttonTwo.widthAnchor.constraint(equalToConstant: 200))
        constraints.append(buttonTwo.heightAnchor.constraint(equalToConstant: 50))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Actions
    @objc private func didTapSettings() {
        let vc = SettingsViewController()
        vc.title = "Settings"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func moveSwitch(sender: UISwitch) {
        if sender.isOn {
            UIView.animate(withDuration: 0.5) {
                self.segmentMenu.alpha = 1
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.segmentMenu.alpha = 0
            }
        }
    }
    
    @objc private func buttonTapped() {
        buttonOne.backgroundColor = .orange
        label.text = textField.text
        //        let vc = TableViewController()
        //        present(vc, animated: true) - не надо
        segmentMenu.numberOfSegments != 3 ? print("Enough") : segmentMenu.insertSegment(withTitle: "Green", at: 3, animated: true)
        segmentMenu.setImage(UIImage(systemName: "circle"), forSegmentAt: 1)
    }
    
    @objc private func buttonTappedTwo() {
                let vc = PageControlViewController()
                vc.navigationItem.largeTitleDisplayMode = .never
                navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func tapSegmentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            view.backgroundColor = .systemPink
        case 1:
            view.backgroundColor = .systemTeal
        case 2:
            view.backgroundColor = .systemBrown
        case 3:
            view.backgroundColor = .systemGreen
        default:
            break
        }
    }
}

// MARK: - Extension

extension FirstViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case textField:
            return validator.hasNumbers(text: string)
        default:
            break
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool { // Очистка textField при его редактировании
        if textField.isEditing {
            return true
        }
        return false
    }
}


