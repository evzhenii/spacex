//
//  ViewController.swift
//  spaceX
//
//  Created by boockich mac on 24.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let horizontalScrollView = UIScrollView()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 4
        pageControl.backgroundColor = .systemBlue
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        horizontalScrollView.delegate = self
        
        pageControl.addTarget(self, action: #selector(pageControlDidChage(_:)), for: .valueChanged)
        
        horizontalScrollView.backgroundColor = .red
        view.addSubview(pageControl)
        view.addSubview(horizontalScrollView)
        horizontalScrollView.addSubview(verticalScrollView)
        verticalScrollView.addSubview(verticalContentView)
        
        setupViewsContsraints()
    }
    
    @objc private func pageControlDidChage(_ sender: UIPageControl) {
        let current = sender.currentPage
        horizontalScrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect(x: 10, y: view.frame.size.height - 100, width: view.frame.size.width - 20, height: 70)
        
        horizontalScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 100)
        
        if horizontalScrollView.subviews.count == 2 {
            configureScroolView()
        }
    }
    
    private func configureScroolView() {
        horizontalScrollView.contentSize = CGSize(width: view.frame.size.width * 5, height: horizontalScrollView.frame.size.height)
        horizontalScrollView.isPagingEnabled = true
        let colors: [UIColor] = [
            .systemRed,
            .systemGreen,
            .systemMint,
            .systemOrange
        ]
        
        for x in 0..<4 {
            //            let page = UIView(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y: 0,
            //                                            width: view.frame.size.width, height: horizontalScrollView.frame.size.height))
            //            page.backgroundColor = colors[x]
            verticalContentView.backgroundColor = colors[x]
            horizontalScrollView.addSubview(verticalScrollView)
            verticalScrollView.addSubview(verticalContentView)
            verticalContentView.addSubview(stackView)
        }
    }
    
    private lazy var verticalScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        //        scrollView.backgroundColor = .black
        scrollView.frame = view.bounds
        scrollView.contentSize = scrollViewContentSize
        return scrollView
    }()
    
    private lazy var verticalContentView: UIView = {
        let contentView = UIView()
        //        contentView.backgroundColor = .black
        contentView.frame.size = scrollViewContentSize
        return contentView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        return stackView
    }()
    
    private var scrollViewContentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 400)
    }
    
    
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
    }
}

extension ViewController {
    private func setupViewsContsraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: verticalContentView.topAnchor),
            stackView.rightAnchor.constraint(equalTo: verticalContentView.rightAnchor),
            stackView.leftAnchor.constraint(equalTo: verticalContentView.leftAnchor)
        ])
        
        for view in stackView.arrangedSubviews {
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalToConstant: 300),
                view.heightAnchor.constraint(equalToConstant: 100)
            ])
        }
    }
    
    private func setupColors() {
        let colors = [UIColor.red, .blue, .green]
        for index in 0..<10 {
            let view = UIView()
            view.backgroundColor = colors[index % colors.count]
        }
        
        
    }
}
