//
//  RocketManager.swift
//  spaceXapp
//
//  Created by boockich mac on 28.09.2022.
//

import Foundation
import UIKit

protocol RocketManagerDelegate {
    func didUpdateRocket(_ rocketManager: RocketManager, rocket: RocketModel)
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
                    if let rocket = self.parseJSON(safeData) {
                        self.delegate?.didUpdateRocket(self, rocket: rocket)
                    }
                }
            }
            task.resume()
        }
    }
    
    private func parseJSON(_ rocketData: Data) -> RocketModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode([RocketData].self, from: rocketData)
            let model = RocketModel(index: decodedData)
            return model
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
}

