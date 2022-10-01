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
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var firstLaunchView = InfoDescriptionView()
    var countryView = InfoDescriptionView()
    var costView = InfoDescriptionView()
    
    private func setupViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(firstLaunchView)
        stackView.addArrangedSubview(countryView)
        stackView.addArrangedSubview(costView)
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
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        for view in stackView.arrangedSubviews {
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            ])
        }
    }

    func setup(_ rocket: RocketData) {
        firstLaunchView.valueLabel.text = rocket.first_flight
        firstLaunchView.nameLabel.text = "First launch"
        countryView.valueLabel.text = rocket.country
        countryView.nameLabel.text = "Country"
        costView.valueLabel.text = String(rocket.cost_per_launch)
        costView.nameLabel.text =  "Launch cost"
    }
}
