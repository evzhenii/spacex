//
//  SpinnerViewController.swift
//  spaceXapp
//
//  Created by boockich mac on 06.10.2022.
//

import UIKit

class SpinnerViewController: UIViewController {

    let spinnerView = SpinnerView()
    var rocketManager = RocketManager()
    var rockets: [RocketData] = []
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rocketManager.delegate = self
        setupView()
        
        rocketManager.load()
    }
    
    private func setupView() {
        view.addSubview(spinnerView)
        spinnerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinnerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

}

//MARK: - RocketManagerDelegate
extension SpinnerViewController: RocketManagerDelegate {
    
    func didUpdateRockets(_ rocketManager: RocketManager, rockets: [RocketData]) {
        self.rockets = rockets
        if let images = rocketManager.imagesToArray(rockets) {
            self.images = images
        }
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        DispatchQueue.main.async {
            let swipingViewController = SwipingCollectionViewController(collectionViewLayout: layout)
            swipingViewController.images = self.images
            swipingViewController.rockets = self.rockets
            swipingViewController.modalPresentationStyle = .fullScreen
            self.present(swipingViewController, animated: true, completion: nil)
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}
