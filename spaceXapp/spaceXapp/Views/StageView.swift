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
    
    var engineNumberView = InfoDescriptionView()
    var fuelCapacityView = InfoDescriptionView()
    var combustionTimeView = InfoDescriptionView()
    
    private func setupViews() {
        addSubview(stackView)
    }
    
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
    
    func setup(_ rocket: Stage) {
        engineNumberView.nameLabel.text = "Number of engines"
        fuelCapacityView.nameLabel.text = "Fuel capacity"
        combustionTimeView.nameLabel.text = "Combustion time"
        engineNumberView.valueLabel.text = String(rocket.engines)
        fuelCapacityView.valueLabel.text = String(rocket.fuel_amount_tons)
//        combustionTimeView.valueLabel.text = String(rocket.burn_time_sec)
    }
    
    
//    let stages = ["FIRST STAGE", "SECOND STAGE"]
//    let descriptions = ["Number of engines", "Fuel capacity", "Combustion time"]
//    let units = ["", "ton", "sec"]
//    let values = [
//        ["27", "308.6", "593"],
//        ["1", "243.3", "397"]
//    ]
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - View generators
extension StageView {
    
    private func titleSetup(txt: String) -> UILabel {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.9719485641, green: 0.9719484448, blue: 0.9719484448, alpha: 1)
        label.text = txt
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func unitSetup (txt: String) -> UILabel {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5607843137, alpha: 0.8470588235)
        label.text = txt
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
