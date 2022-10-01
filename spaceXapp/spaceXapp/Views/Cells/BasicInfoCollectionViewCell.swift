////
////  BasicInfoCollectionViewCell.swift
////  spaceXapp
////
////  Created by boockich mac on 28.09.2022.
////
//
//import UIKit
//
//class BasicInfoCollectionViewCell: UICollectionViewCell {
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupView()
//        setupLayout()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    let valueLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.textColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5607843137, alpha: 1)
//        label.font = label.font.withSize(16)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    let descriptionLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.textColor = .white
//        label.font = label.font.withSize(16)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    private func setupView() {
//        addSubview(valueLabel)
//        addSubview(descriptionLabel)
//    }
//    
//    private func setupLayout() {
//        
//        NSLayoutConstraint.activate([
//            valueLabel.heightAnchor.constraint(equalToConstant: 24),
//            valueLabel.widthAnchor.constraint(equalToConstant: 176),
//            valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
//            valueLabel.topAnchor.constraint(equalTo: topAnchor),
//            
//            descriptionLabel.heightAnchor.constraint(equalToConstant: 24),
//            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
//            descriptionLabel.topAnchor.constraint(equalTo: topAnchor),
//        ])
//    }
//}
