//
//  PageControlViewController.swift
//  UIKitManual
//
//  Created by Адель Ахметшин on 07.09.2022.
//

import Foundation
import UIKit

class PageControlViewController: UIViewController {
    
    let strings = ["one", "two", "three"]
    
    private let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemGray
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    private let pageControl: UIPageControl = {
       let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = .black
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.hidesForSinglePage = true // Скрывать блок если всего один элемент
        pageControl.backgroundStyle = .prominent
        pageControl.allowsContinuousInteraction = false
        return pageControl
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupView()
        setupConstraints()
    }
    
    // MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(scrollView)
        view.addSubview(pageControl)
    }
    
    private func setupView() {
        title = "Page Control"
        view.backgroundColor = .gray
        scrollView.contentSize = CGSize(width: Int(UIScreen.main.bounds.width) * strings.count, height: 200) // В скобках указана ширина всего экрана
        scrollView.delegate = self
        pageControl.numberOfPages = strings.count
        pageControl.setIndicatorImage(UIImage(systemName: "paperplane"), forPage: 1)
        pageControl.addTarget(self, action: #selector(pageDidChange(sender:)), for: .valueChanged)
        
        addLabel(title: strings[0], position: 0)
        addLabel(title: strings[1], position: 1)
        addLabel(title: strings[2], position: 2)
    }
    
    private func addLabel(title: String, position: CGFloat) {
        let label = UILabel()
        label.text = title
        label.textAlignment = .center
        scrollView.addSubview(label)
        let screenWidth = UIScreen.main.bounds.width
        label.frame = CGRect(x: screenWidth * position, y: 0, width: screenWidth, height: 200)
    }
    
    // MARK: - Actions
    @objc private func pageDidChange(sender: UIPageControl) {
        let offsetX = UIScreen.main.bounds.width * CGFloat(pageControl.currentPage)
        scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
    
    // MARK: - Constraints
    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        // Scroll View
        constraints.append(scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(scrollView.heightAnchor.constraint(equalToConstant: 200))
        
        // Page Control
        constraints.append(pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 16))
        constraints.append(pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
}

// MARK: - Extension
extension PageControlViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}
