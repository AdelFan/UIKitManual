//
//  ScrollViewController.swift
//  UIKitManual
//
//  Created by Адель Ахметшин on 07.09.2022.
//

import Foundation
import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate {
    
    private let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.layer.borderWidth = 1
        scrollView.layer.borderColor = UIColor.black.cgColor
        scrollView.contentSize = CGSize(width: 600, height: 600)
        scrollView.contentOffset = CGPoint(x: 100, y: 50)
        scrollView.isDirectionalLockEnabled = true // Запрет скроллинга сразу в двух направлениях
        scrollView.showsVerticalScrollIndicator = false // скрытие вертикального индикатора скроллинга
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.maximumZoomScale = 0.5
        scrollView.maximumZoomScale = 2
        return scrollView
    }()
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "pencil.circle.fill")
        return imageView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupView()
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrollView.setContentOffset(CGPoint(x: 150, y: 150), animated: true)
    }
    
    // MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }
    
    private func setupView() {
        view.backgroundColor = .white
        scrollView.delegate = self
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scrollView.widthAnchor.constraint(equalToConstant: 300),
            scrollView.heightAnchor.constraint(equalToConstant: 300),
            imageView.widthAnchor.constraint(equalToConstant: 600),
            imageView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
    
     func viewForZooming(in scrollView: UIScrollView) -> UIView? { // Увеличение элемента
        return imageView
    }
}

