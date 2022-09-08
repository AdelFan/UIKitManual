//
//  TableViewController.swift
//  UIKitManual
//
//  Created by Адель Ахметшин on 08.09.2022.
//

import Foundation
import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private var models = ["1", "2", "3", "4", "5"]
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(UITableView.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    private let cellHeaderLabel: UILabel = {
       let label = UILabel()
        label.text = "Header"
        label.font = .systemFont(ofSize: 25, weight: .regular)
        label.textColor = .systemBlue
        label.frame = CGRect(x: 20, y: 0, width: 100, height: 20)
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Table"
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // MARK: - Settings
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.addSubview(cellHeaderLabel)
        return view
    }
}
