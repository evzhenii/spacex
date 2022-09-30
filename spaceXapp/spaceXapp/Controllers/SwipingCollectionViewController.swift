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
    
    var cells = RocketModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(PageCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.isPagingEnabled = true
        rocketManager.delegate = self
        rocketManager.load()
//        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PageCollectionViewCell
        cell.setup(cells, index: indexPath.row)
        cell.backgroundImage.image = cells.rocketArray?[indexPath.row].image
//        collectionView.reloadData()
        return cell
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
        return 4
    }
}

//MARK: - RocketManagerDelegate
extension SwipingCollectionViewController: RocketManagerDelegate {
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
    
    func didUpdateRocket(_ rocketManager: RocketManager, rocket: RocketModel) {
        cells = rocket
//        print("didUpdateRocket from Swiping collection view")
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }
}

