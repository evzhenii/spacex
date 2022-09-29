//
//  RocketManager.swift
//  spaceXapp
//
//  Created by boockich mac on 28.09.2022.
//

import Foundation
import UIKit

protocol RocketManagerDelegate {
        func didUpdateRocket(rocket: RocketModel)
}

struct RocketManager {
    func load() {
        let stringUrl = "https://api.spacexdata.com/v4/rockets"
        
        var delegate = RocketManagerDelegate?
        if let url = URL(string: stringUrl) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil  {
                    print(error?.localizedDescription ?? "URL session error, no description")
                    return
                }
                
                if let safeData = data {
                    if let rocket = self.parseJSON(rocketData: safeData) {
                        delegate?.didUpdateRocket(rocket: rocket)
                    }
                }
            }
            task.resume()
        }
    }
    
    private func parseJSON(rocketData: Data) -> [RocketModel]? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode([RocketData].self, from: rocketData)
            print(decodedData[0])
            
            let rocket = RocketModel(name: <#T##String#>, cost_per_launch: <#T##Int#>, first_flight: <#T##String#>, country: <#T##String#>, height: <#T##Height#>, diameter: <#T##Diameter#>, mass: <#T##Mass#>, payload_weights: <#T##Payload_weights#>, flickr_images: <#T##[URL]#>, first_stage: <#T##First_stage#>, second_stage: <#T##Second_stage#>)
            return decodedData
            
        } catch {
            print("parseJSON")
            print(error)
            return nil
        }
    }
}
