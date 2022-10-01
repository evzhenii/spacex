//
//  infoView.swift
//  spaceXapp
//
//  Created by boockich mac on 27.09.2022.
//

import UIKit

class InfoView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
        setDelegates()
    }
    
    private lazy var mainInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 32
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
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
        button.tintColor = #colorLiteral(red: 0.9719485641, green: 0.9719484448, blue: 0.9719484448, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionViewLayout.scrollDirection = .horizontal
        collectionView.backgroundColor = .black
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var showLaunches: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show launches", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.08947802335, green: 0.08947802335, blue: 0.08947802335, alpha: 1)
        button.layer.cornerRadius = 16
        button.tintColor = .white
        button.titleLabel?.font = titleLabel.font.withSize(24)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let basicInfoView = BasicInfoView()
    let stageView1 = StageView()
    let stageView2 = StageView()
//    var rocket = RocketData(from: <#Decoder#>)
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupViews() {
        addSubview(mainInfoView)
        mainInfoView.addSubview(titleLabel)
        mainInfoView.addSubview(settingsButton)
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "InfoViewCell")
        mainInfoView.addSubview(collectionView)
        mainInfoView.addSubview(basicInfoView)
        mainInfoView.addSubview(stageView1)
        mainInfoView.addSubview(stageView2)
        mainInfoView.addSubview(showLaunches)
    }
    private func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainInfoView.topAnchor.constraint(equalTo: topAnchor),
            mainInfoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainInfoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainInfoView.heightAnchor.constraint(equalToConstant: 900),
            
            titleLabel.topAnchor.constraint(equalTo: mainInfoView.topAnchor, constant: 48),
            titleLabel.leadingAnchor.constraint(equalTo: mainInfoView.leadingAnchor, constant: 32),
            titleLabel.heightAnchor.constraint(equalToConstant: 32),
            
            settingsButton.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            settingsButton.trailingAnchor.constraint(equalTo: mainInfoView.trailingAnchor, constant: -32),
            settingsButton.heightAnchor.constraint(equalToConstant: 32),
            settingsButton.widthAnchor.constraint(equalToConstant: 32),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            collectionView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: mainInfoView.trailingAnchor, constant: 50),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
            
            basicInfoView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 40),
            basicInfoView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            basicInfoView.trailingAnchor.constraint(equalTo: settingsButton.trailingAnchor),
            basicInfoView.heightAnchor.constraint(equalToConstant: 150),
            
            stageView1.topAnchor.constraint(equalTo: basicInfoView.bottomAnchor),
            stageView1.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            stageView1.trailingAnchor.constraint(equalTo: settingsButton.trailingAnchor),
            stageView1.heightAnchor.constraint(equalToConstant: 200),
            
            stageView2.topAnchor.constraint(equalTo: stageView1.bottomAnchor),
            stageView2.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            stageView2.trailingAnchor.constraint(equalTo: settingsButton.trailingAnchor),
            stageView2.heightAnchor.constraint(equalToConstant: 200),

            showLaunches.topAnchor.constraint(equalTo: stageView2.bottomAnchor),
            showLaunches.leadingAnchor.constraint(equalTo: stageView2.leadingAnchor),
            showLaunches.trailingAnchor.constraint(equalTo: stageView2.trailingAnchor),
            showLaunches.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - UICollectionViewDataSource
extension InfoView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfoViewCell", for: indexPath) as? CardCollectionViewCell else {
            return UICollectionViewCell()
        }
//        cell.setup(rocket.indexPath.item)
        return cell
    }
    
}

//MARK: - UICollectionViewDelegate
extension InfoView: UICollectionViewDelegate {
    
}


//MARK: - UICollectionViewDelegateFlowLayout
extension InfoView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 4,
               height: collectionView.frame.width / 4)
    }
}
