//
//  SwipingCollectionViewController.swift
//  spaceXapp
//
//  Created by boockich mac on 26.09.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class SwipingCollectionViewController: UICollectionViewController {
    
    var rocketManager = RocketManager()
    
    var rockets = [RocketData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.contentInsetAdjustmentBehavior = .never
        self.collectionView!.register(PageCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.isPagingEnabled = true
        rocketManager.delegate = self
        rocketManager.load()
//        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PageCollectionViewCell
        cell.setup(rockets[indexPath.item])
        cell.backgroundImage.image = rockets[indexPath.row].image
//        cell.infoView.showLaunchesButton.tag = indexPath.item
//        cell.infoView.showLaunchesButton.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
//        cell.infoView.settingsButton.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func buttonClicked(_ sender: UIButton) {
        print("button works")
        print("Show launches at: \(sender.tag)")
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension SwipingCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rockets.count
    }
}

//MARK: - RocketManagerDelegate
extension SwipingCollectionViewController: RocketManagerDelegate {
    func didUpdateRockets(_ rocketManager: RocketManager, rockets: [RocketData]) {
        self.rockets = rockets
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }
    
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
    
}

