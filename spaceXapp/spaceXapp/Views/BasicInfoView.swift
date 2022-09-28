//
//  BasicInfoView.swift
//  spaceXapp
//
//  Created by boockich mac on 28.09.2022.
//

import UIKit

class BasicInfoView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    let descriptions = ["First launch", "Country", "Launch cost"]
    let values = ["7th of February, 2008", "USA", "$90 mln"]
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private func setupViews() {
        addSubview(stackView)
        for i in 0..<3 {
            let view = UIView()
            let description = descriptionSetup(txt: descriptions[i])
            let value = valueSetup(txt: values[i])
            view.addSubview(description)
            view.addSubview(value)
            stackView.addArrangedSubview(view)
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
                description.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                value.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - View setups
extension BasicInfoView {
    private func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        for view in stackView.arrangedSubviews {
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalTo: stackView.widthAnchor),
                view.heightAnchor.constraint(equalToConstant: 24),
            ])
        }
    }
    
    private func descriptionSetup(txt: String) -> UILabel {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.8308513761, green: 0.8308513761, blue: 0.8308513761, alpha: 0.8470588235)
        label.text = txt
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func valueSetup(txt: String) -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.text = txt
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
