//
//  CollectionViewCell.swift
//  spaceXapp
//
//  Created by boockich mac on 26.09.2022.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    private lazy var screenView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bottomCotrolsView: UIView = {
        let view = UIView()
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 4
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view.backgroundColor = #colorLiteral(red: 0.08947802335, green: 0.08947802335, blue: 0.08947802335, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.frame = self.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private lazy var scrollContentView: UIView = {
        let contentView = UIView()
        contentView.frame.size = contentSize
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let infoView = InfoView()
    
    private var contentSize: CGSize {
        CGSize(width: frame.width, height: frame.height + 400)
    }
    
    let backgroundImage: UIImageView = {
        let image = UIImageView()
//        image.contentMode = .scaleAspectFill
        // MARK: TODO: Play with content mode of background image in order to fit figma design
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - setupViews, setupLayout
extension PageCollectionViewCell {
    
    private func setupViews() {
        addSubview(screenView)
        screenView.addSubview(bottomCotrolsView)
        screenView.addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        scrollContentView.addSubview(stackView)
        stackView.addSubview(backgroundImage)
        stackView.addSubview(infoView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            screenView.topAnchor.constraint(equalTo: topAnchor),
            screenView.leadingAnchor.constraint(equalTo: leadingAnchor),
            screenView.trailingAnchor.constraint(equalTo: trailingAnchor),
            screenView.widthAnchor.constraint(equalTo: widthAnchor),
            screenView.heightAnchor.constraint(equalTo: heightAnchor),
            
            bottomCotrolsView.bottomAnchor.constraint(equalTo: screenView.bottomAnchor),
            bottomCotrolsView.widthAnchor.constraint(equalTo: screenView.widthAnchor),
            bottomCotrolsView.heightAnchor.constraint(equalToConstant: 72),
            
            scrollView.topAnchor.constraint(equalTo: screenView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: screenView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: screenView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomCotrolsView.topAnchor),
            
            scrollContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollContentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor),
            
            backgroundImage.topAnchor.constraint(equalTo: stackView.topAnchor, constant: -100),
            backgroundImage.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            
            infoView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 350),
            infoView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ])
    }
}


//MARK: - Update UI functions
extension PageCollectionViewCell {
    
    func setup(_ rocket: RocketData) {
        DispatchQueue.main.async { [weak self] in
            self?.backgroundImage.image = rocket.image
//            self?.backgroundImage.setNeedsDisplay()
        }
        infoView.titleLabel.text = rocket.name
        
//        infoView.basicInfoView.values[0] = rocket.first_flight
        infoView.basicInfoView.setup(rocket)
        
//        infoView.cells = rocket
        
//        if let country = rocket.index?[index].country {
//            infoView.basicInfoView.values.append(country)
//        }
//        if let cost = rocket.index?[index].cost_per_launch {
//            infoView.basicInfoView.values.append(String(format: "$%.2 mil", cost))
//        }
//        reloadData()
    }
}
