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
        view.backgroundColor = .purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    private lazy var bottomControlsStackView: UIStackView = {
//        let bottomControls = UIStackView()
//        bottomControls.backgroundColor = .black
//        bottomControls.axis = .horizontal
//        bottomControls.distribution = .fillEqually
//
//        bottomControls.translatesAutoresizingMaskIntoConstraints = false
//        return bottomControls
//    }()
    
    let bottomCotrolsView: UIView = {
        let view = UIView()
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 4
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.frame = bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private lazy var scrollContentView: UIView = {
        let contentView = UIView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .orange
        contentView.frame.size = contentSize
        return contentView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 40
        return stackView
    }()
    
    private var contentSize: CGSize {
        CGSize(width: frame.width, height: frame.height + 400)
    }
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "BackgroundPic"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
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
//        bottomControlsStackView.addArrangedSubview(previousButton)
//        bottomControlsStackView.addArrangedSubview(nextButton)
        
    }
    private func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            screenView.topAnchor.constraint(equalTo: topAnchor),
            screenView.leadingAnchor.constraint(equalTo: leadingAnchor),
            screenView.trailingAnchor.constraint(equalTo: trailingAnchor),
            screenView.widthAnchor.constraint(equalTo: widthAnchor),
            screenView.heightAnchor.constraint(equalTo: heightAnchor),
            
            bottomCotrolsView.bottomAnchor.constraint(equalTo: screenView.bottomAnchor),
            bottomCotrolsView.widthAnchor.constraint(equalTo: screenView.widthAnchor),
            bottomCotrolsView.heightAnchor.constraint(equalToConstant: 72),

            
//            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 72)
        ])
    }
    
}

