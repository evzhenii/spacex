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
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    

    let stages = ["FIRST STAGE", "SECOND STAGE"]
    let descriptions = ["Number of engines", "Fuel capacity", "Combustion time"]
    let units = ["", "ton", "sec"]
    let values = [
        ["27", "308.6", "593"],
        ["1", "243.3", "397"]
    ]
    
    private func setupViews() {
        addSubview(stackView)
        for i in 0..<2 {
            let stageTitle = titleSetup(txt: stages[i])
            stackView.addArrangedSubview(stageTitle)
            stageTitle.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
            for j in 0..<3 {
                let view = UIView()
                let description = descriptionSetup(txt: descriptions[j])
                let value = valueSetup(txt: values[i][j])
                let unit = unitSetup(txt: units[j])
                view.addSubview(description)
                view.addSubview(value)
                view.addSubview(unit)
                stackView.addArrangedSubview(view)
                NSLayoutConstraint.activate([
                    view.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
                    view.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
                    description.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    unit.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    unit.widthAnchor.constraint(equalToConstant: 28),
                    value.trailingAnchor.constraint(equalTo: unit.leadingAnchor, constant: -8),
                ])
            }
        }
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - View generators
extension StageView {
    private func descriptionSetup(txt: String) -> UILabel {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.8308513761, green: 0.8308513761, blue: 0.8308513761, alpha: 0.8470588235)
        label.text = txt
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func titleSetup(txt: String) -> UILabel {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.9719485641, green: 0.9719484448, blue: 0.9719484448, alpha: 1)
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
    
    private func unitSetup (txt: String) -> UILabel {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5607843137, alpha: 0.8470588235)
        label.text = txt
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
