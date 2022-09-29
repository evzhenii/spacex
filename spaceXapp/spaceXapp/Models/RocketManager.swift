//
//  RocketManager.swift
//  spaceXapp
//
//  Created by boockich mac on 28.09.2022.
//

import Foundation
import UIKit

protocol RocketManagerDelegate {
    //    func didUpdateRocket(rocket: Rocket)
}

struct RocketManager {
    func load() {
        let stringUrl = "https://api.spacexdata.com/v4/rockets"
        if let url = URL(string: stringUrl) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil  {
                    print(error?.localizedDescription ?? "URL session error, no description")
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(rocketData: safeData)
                }
            }
            task.resume()
        }
    }
    
    private func parseJSON(rocketData: Data) {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode([RocketData].self, from: rocketData)
            print(decodedData[0])
            
        } catch {
            print("parseJSON")
            print(error.localizedDescription)
            return
        }
    }
}
