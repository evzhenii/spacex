//
//  infoView.swift
//  spaceXapp
//
//  Created by boockich mac on 27.09.2022.
//

import UIKit

class MainInfoView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        setupViews()
        setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Falcon Heavy"
        label.textColor = #colorLiteral(red: 0.9719485641, green: 0.9719484448, blue: 0.9719484448, alpha: 1)
        label.font = label.font.withSize(24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var settingsButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "gearshape")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(showLaunchesButtonTapped(sender:)), for: .touchUpInside)
        button.tintColor = #colorLiteral(red: 0.9719485641, green: 0.9719484448, blue: 0.9719484448, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var showLaunchesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show launches", for: .normal)
        button.addTarget(self, action: #selector(showLaunchesButtonTapped), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.08947802335, green: 0.08947802335, blue: 0.08947802335, alpha: 1)
        button.layer.cornerRadius = 16
        button.tintColor = .white
        button.titleLabel?.font = titleLabel.font.withSize(24)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let emptyView = UIView()
    
    @objc func showLaunchesButtonTapped(sender: UIButton!) {
      print("Button tapped")
    }
    
    let basicInfoView = BasicInfoView()
    let stageView1 = StageView()
    let stageView2 = StageView()
    
    private func setupStackView() {
        self.backgroundColor = .black
        self.layer.cornerRadius = 32
        self.axis = .vertical
        self.alignment = .fill
        self.spacing = 40
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupViews() {
        addArrangedSubview(headerView)
        headerView.addSubview(titleLabel)
        headerView.addSubview(settingsButton)
        addArrangedSubview(basicInfoView)
        addArrangedSubview(stageView1)
        addArrangedSubview(stageView2)
        addArrangedSubview(showLaunchesButton)
        addArrangedSubview(emptyView)
    }

    private func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.heightAnchor.constraint(equalToConstant: 32),
            headerView.topAnchor.constraint(equalTo: topAnchor, constant: 48),
            headerView.widthAnchor.constraint(equalTo: widthAnchor),
//            headerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
//            headerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            settingsButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            settingsButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -32),
            
            basicInfoView.heightAnchor.constraint(equalToConstant: 104),
            basicInfoView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            
            stageView1.heightAnchor.constraint(equalToConstant: 134),
            stageView2.heightAnchor.constraint(equalToConstant: 134),
            
            showLaunchesButton.heightAnchor.constraint(equalToConstant: 56),
            
            emptyView.heightAnchor.constraint(equalToConstant: 72),

        ])
    }
}
