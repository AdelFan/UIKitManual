//
//  MainTableViewController.swift
//  UIKitManual
//
//  Created by Адель Ахметшин on 08.09.2022.
//

import Foundation
import UIKit

class MainTableViewController: UIViewController {
    private var contacts = ModelTable.makeContactsWithGroup()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped) // Стиль таблицы
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "SOME TEXT"
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupView()
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupView() {
        title = "Custom Cell"
        tableView.register(ContactCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundView = label
        tableView.separatorColor = .red // Цвет разделительной линии
        tableView.separatorInset = .init(top: 0, left: 10, bottom: 0, right: 10) // Размеры разделительной линии
        self.navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "text.justify"), style: .done, target: self, action: #selector(editTable))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "goforward"), style: .done, target: self, action: #selector(reloadTable))
    }
    
    // MARK: - Constraints
    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        // Table View
        constraints.append(tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(tableView.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Actions
    @objc private func editTable(sender: UIButton) {
        tableView.isEditing.toggle() // Редактирование таблицы
    }
    
    @objc private func reloadTable(sender: UIButton) {
        contacts = ModelTable.makeContactsWithGroup() // Обновление таблицы
        tableView.reloadData()
    }
}

// MARK: - Extension
extension MainTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: contacts[indexPath.section][indexPath.row].name, message: contacts[indexPath.section][indexPath.row].description, preferredStyle: .alert)
        alertController.addAction(.init(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true)
    }
}

extension MainTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Group 1"
        case 1: return "Group 2"
        default: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ContactCell else { fatalError() }
        cell.configure(contact: contacts[indexPath.section][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        contacts[indexPath.section].remove(at: indexPath.row) // Удаление ячеек
        tableView.deleteRows(at: [indexPath], with: .left)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let contact = contacts[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        contacts[destinationIndexPath.section].insert(contact, at: destinationIndexPath.row)
    }
}
