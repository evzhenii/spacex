//
//  InfoViewCollectionViewCell.swift
//  spaceXapp
//
//  Created by boockich mac on 28.09.2022.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let valueLabel: UILabel = {
        let label = UILabel()
        label.text = "229.6"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Height, ft"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5607843137, alpha: 1)
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupView() {
        backgroundColor = #colorLiteral(red: 0.08947802335, green: 0.08947802335, blue: 0.08947802335, alpha: 1)
        layer.cornerRadius = 32
        addSubview(valueLabel)
        addSubview(descriptionLabel)
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            valueLabel.heightAnchor.constraint(equalToConstant: 24),
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            valueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 28),
//            valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
