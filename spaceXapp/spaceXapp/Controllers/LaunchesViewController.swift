//
//  LaunchesViewController.swift
//  spaceXapp
//
//  Created by boockich mac on 02.10.2022.
//

import UIKit

class LaunchesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        setupViews()
        setupLayout()
    }
    
    private let backButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var navigationBar: UINavigationBar = {
        let navbar = UINavigationBar()
        let navItem = UINavigationItem()
        navItem.title = "Sensor Data"
        navItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: LaunchesViewController.self, action: #selector(dismissViewController))
        navbar.items = [navItem]
        return navbar
    }()

//    private func addNavigationBar() {
//        let height: CGFloat = 75
//        let navbar = UINavigationBar(frame: CGRect(x: 0, y: 40, width: UIScreen.main.bounds.width, height: height))
//        navbar.delegate = self as? UINavigationBarDelegate
//
//        let navItem = UINavigationItem()
//        navItem.title = "Sensor Data"
//        navItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissViewController))
//
//        navbar.items = [navItem]
//
//        view.addSubview(navbar)
//
//        self.view?.frame = CGRect(x: 0, y: height, width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height - height))
//    }
    
    @objc func dismissViewController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupViews() {
        view.addSubview(navigationBar)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.topAnchor),
            navigationBar.widthAnchor.constraint(equalTo: view.widthAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 75),
            ])
    }
}
