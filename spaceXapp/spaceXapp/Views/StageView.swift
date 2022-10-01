//
//  StageView.swift
//  spaceXapp
//
//  Created by boockich mac on 28.09.2022.
//

import UIKit

class StageView: UIView {
    
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
    
    var stageLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.9719485641, green: 0.9719484448, blue: 0.9719484448, alpha: 1)
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var engineNumberView = StageDescriptionView()
    var fuelCapacityView = StageDescriptionView()
    var combustionTimeView = StageDescriptionView()
    
    private func setupViews() {
        addSubview(stageLabel)
        addSubview(stackView)
        stackView.addArrangedSubview(engineNumberView)
        stackView.addArrangedSubview(fuelCapacityView)
        stackView.addArrangedSubview(combustionTimeView)
    }
    
    private func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stageLabel.topAnchor.constraint(equalTo: topAnchor),
            stageLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            stageLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: stageLabel.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        for view in stackView.arrangedSubviews {
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            ])
        }
    }
    
    func combustionViewActivate() -> UIView? {
        return InfoDescriptionView()
    }
    
    func setup(_ rocket: Stage) {
        engineNumberView.nameLabel.text = "Number of engines"
        fuelCapacityView.nameLabel.text = "Fuel capacity"
        fuelCapacityView.measurmentLabel.text = "ton"
        engineNumberView.valueLabel.text = String(rocket.engines)
        fuelCapacityView.valueLabel.text = String(rocket.fuel_amount_tons)
        if let time = rocket.burn_time_sec {
            combustionTimeView.valueLabel.text = String(time)
            combustionTimeView.nameLabel.text = "Combustion time"
            combustionTimeView.measurmentLabel.text = "sec"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
