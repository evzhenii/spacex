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
        scrollView.backgroundColor = .blue
        //TODO: - dynamic scroll view content size based on childs view
        scrollView.contentSize = CGSize(width: frame.width, height: frame.height + 200)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var scrollContentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .brown
//        contentView.frame.size = CGSize(width: frame.width, height: frame.height * 2)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let mainStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let blackBGView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 32
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let infoView = MainInfoView()
    
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
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

        addSubview(bottomCotrolsView)
        addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        scrollContentView.addSubview(backgroundImage)
        scrollContentView.addSubview(blackBGView)
        blackBGView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(infoView)
    }
    
    private func setupLayout() {
        print(scrollView.heightAnchor)

        
        NSLayoutConstraint.activate([
            bottomCotrolsView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomCotrolsView.widthAnchor.constraint(equalTo: widthAnchor),
            bottomCotrolsView.heightAnchor.constraint(equalToConstant: 72),
            
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomCotrolsView.topAnchor),
            
            scrollContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            scrollContentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 2),

            backgroundImage.topAnchor.constraint(equalTo: scrollContentView.topAnchor),
            backgroundImage.widthAnchor.constraint(equalTo: scrollContentView.widthAnchor),
            backgroundImage.heightAnchor.constraint(equalToConstant: 400),
            
            blackBGView.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -32),
            blackBGView.widthAnchor.constraint(equalTo: scrollContentView.widthAnchor),
            blackBGView.heightAnchor.constraint(equalTo: mainStackView.heightAnchor, constant: 100),
            
            mainStackView.topAnchor.constraint(equalTo: blackBGView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: blackBGView.leadingAnchor, constant: 32),
            mainStackView.widthAnchor.constraint(equalTo: blackBGView.widthAnchor, constant: -64),

            infoView.topAnchor.constraint(equalTo: mainStackView.topAnchor),
            infoView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
//            infoView.heightAnchor.constraint(equalToConstant: 1000)
        ])
    }
}


//MARK: - Update UI functions
extension PageCollectionViewCell {
    
    func setup(_ rocket: RocketData) {
        DispatchQueue.main.async { [weak self] in
            self?.backgroundImage.image = rocket.image
        }
        infoView.titleLabel.text = rocket.name
        infoView.basicInfoView.setup(rocket)
        infoView.stageView1.setup(rocket.first_stage)
        infoView.stageView1.stageLabel.text = "FIRST STAGE"
        infoView.stageView2.setup(rocket.second_stage)
        infoView.stageView2.stageLabel.text = "SECOND STAGE"
    }
}
