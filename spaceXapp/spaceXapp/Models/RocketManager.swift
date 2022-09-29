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
        
//        var delegate = RocketManagerDelegate?
        if let url = URL(string: stringUrl) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil  {
                    print(error?.localizedDescription ?? "URL session error, no description")
                    return
                }
                
                if let safeData = data {
                    if let rocket = self.parseJSON(rocketData: safeData) {
                        print(rocket[0].mass.kg)
//                        delegate?.didUpdateRocket(rocket: rocket)
                    }
                }
            }
            task.resume()
        }
    }
    
    private func parseJSON(rocketData: Data) -> [RocketModel]? {
        let decoder = JSONDecoder()
        
        do {
            var array: [RocketModel] = []
            let decodedData = try decoder.decode([RocketData].self, from: rocketData)
            for i in 0..<4 {
                array.append(RocketModel(name: decodedData[i].name,
                                         flickr_images: decodedData[i].flickr_images,
                                         cost_per_launch: decodedData[i].cost_per_launch,
                                         first_flight: decodedData[i].first_flight,
                                         country: decodedData[i].country,
                                         height: decodedData[i].height,
                                         diameter: decodedData[i].diameter,
                                         mass: decodedData[i].mass,
                                         payload_weights: decodedData[i].payload_weights[0],
                                         first_stage: decodedData[i].first_stage,
                                         second_stage: decodedData[i].second_stage))
            }
            return array
            
        } catch {
            print("parseJSON")
            print(error)
            return nil
        }
    }
}


//private func parseJSON(rocketData: Data) -> [RocketModel]? {
//    let decoder = JSONDecoder()
//    
//    do {
//        var array: [RocketModel] = []
//        let decodedData = try decoder.decode([RocketData].self, from: rocketData)
//        for i in 0..<4 {
//            array.append(RocketModel(name: decodedData[i].name,
//                                     flickr_images: decodedData[i].flickr_images,
//                                     cost_per_launch: decodedData[i].cost_per_launch,
//                                     first_flight: decodedData[i].first_flight,
//                                     country: decodedData[i].country,
//                                     height: decodedData[i].height,
//                                     diameter: decodedData[i].diameter,
//                                     mass: decodedData[i].mass,
//                                     payload_weights: decodedData[i].payload_weights[0],
//                                     first_stage: decodedData[i].first_stage,
//                                     second_stage: decodedData[i].second_stage))
//        }
//        return array
//        
//    } catch {
//        print("parseJSON")
//        print(error)
//        return nil
//    }
//}
