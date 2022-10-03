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
                    if let rocket = self.parseJSON(safeData) {
                        self.delegate?.didUpdateRockets(self, rockets: rocket)
                    }
                }
            }
            task.resume()
        }
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
}

