//
//  ViewController.swift
//  spaceXapp
//
//  Created by boockich mac on 26.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "spaceXimage"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        view.addSubview(backgroundImage)
        
        setupLayout()
    }
    
    
    

    private func setupLayout() {
        
    }
}

