//
//  RocketManager.swift
//  spaceXapp
//
//  Created by boockich mac on 28.09.2022.
//

import Foundation
import UIKit

protocol RocketManagerDelegate {
    func didUpdateRockets(_ rocketManager: RocketManager, rockets: [RocketData])
    func didFailWithError(_ error: Error)
}

struct RocketManager {
    var delegate: RocketManagerDelegate?
    let stringUrl = "https://api.spacexdata.com/v4/rockets"
    
    func load() {
        if let url = URL(string: stringUrl) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil  {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                
                if let safeData = data {
                    if let rockets = parseJSON(safeData) {
                        let updated = updateImagelinks(rockets)
                        self.delegate?.didUpdateRockets(self, rockets: updated)
                    }
                }
            }
            task.resume()
        }
    }
    
    func imagesToArray(_ rockets: [RocketData]) -> [UIImage]? {
        var array: [UIImage] = []
        
        for i in 0..<rockets.count {
            let currentImageURLArray = rockets[i].flickr_images
            let randIndex = (Int.random(in: 0..<currentImageURLArray.count))
            guard let url = URL(string: currentImageURLArray[randIndex]) else { return nil }
            if let data = try? Data(contentsOf: url) {
                if let parsed = UIImage(data: data) {
                    array.append(parsed)
                }
            }
        }
        return array
    }
    
    private func parseJSON(_ rocketData: Data) -> [RocketData]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([RocketData].self, from: rocketData)
            return decodedData
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
    
    private func updateImagelinks(_ rockets: [RocketData]) -> [RocketData] {
        var newRockets = rockets
        var images: [String] = newRockets[0].flickr_images
        for i in 0..<images.count {
            let index = images[i].index(images[i].startIndex, offsetBy: 8)
            images[i].insert(contentsOf: "i.", at: index)
        }
        newRockets[0].flickr_images = images
        return newRockets
    }
}
