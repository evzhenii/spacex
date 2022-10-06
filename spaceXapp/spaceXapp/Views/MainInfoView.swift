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
        setupViews()
        setupLayout()
    }
    
    lazy var infoStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = 40
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.9719485641, green: 0.9719484448, blue: 0.9719484448, alpha: 1)
        label.font = label.font.withSize(24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let topEmptyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let botEmptyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let basicInfoView = BasicInfoView()
    let stageView1 = StageView()
    let stageView2 = StageView()
    
    private func setupViews() {
        addArrangedSubview(infoStackView)
        infoStackView.addArrangedSubview(topEmptyView)
        infoStackView.addArrangedSubview(headerView)
        headerView.addSubview(titleLabel)
        infoStackView.addArrangedSubview(basicInfoView)
        infoStackView.addArrangedSubview(stageView1)
        infoStackView.addArrangedSubview(stageView2)
        infoStackView.addArrangedSubview(botEmptyView)
    }
    
    private func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoStackView.topAnchor.constraint(equalTo: topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 32),
            
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            
            basicInfoView.heightAnchor.constraint(equalToConstant: 104),
            
            stageView1.heightAnchor.constraint(equalToConstant: 134),
            stageView2.heightAnchor.constraint(equalToConstant: 134),
            
            botEmptyView.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
