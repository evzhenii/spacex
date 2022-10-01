//
//  StageDescriptionView.swift
//  spaceXapp
//
//  Created by boockich mac on 01.10.2022.
//

import UIKit

class StageDescriptionView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.8308513761, green: 0.8308513761, blue: 0.8308513761, alpha: 0.8470588235)
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var measurmentLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5607843137, alpha: 0.8470588235)
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupViews() {
        addSubview(nameLabel)
        addSubview(valueLabel)
        addSubview(measurmentLabel)
    }
    
    private func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            measurmentLabel.topAnchor.constraint(equalTo: topAnchor),
            measurmentLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            measurmentLabel.widthAnchor.constraint(equalToConstant: 36),
            valueLabel.topAnchor.constraint(equalTo: topAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: measurmentLabel.leadingAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
