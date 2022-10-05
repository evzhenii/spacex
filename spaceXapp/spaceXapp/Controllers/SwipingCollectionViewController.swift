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
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PageCollectionViewCell {
            DispatchQueue.main.async {
                cell.setup(self.rockets[indexPath.item])
                cell.pageControl.numberOfPages = self.rockets.count
                cell.pageControl.currentPage = indexPath.row
            }
            print("cell created")
            return cell
        } else {
            print("cannot cast cell to PageCollectionViewCell")
            return UICollectionViewCell()
        }
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
        print(rockets[0].name)
        //        print(self.rockets)
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

