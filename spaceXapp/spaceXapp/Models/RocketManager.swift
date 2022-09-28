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
    func load() -> RocketInfo? {
        let stringUrl = "https://api.spacexdata.com/v4/rockets"
        guard let url = URL(string: stringUrl) else { return nil }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print(error?.localizedDescription ?? "URL session error, no description")
                return
            }
            guard let data = data else { return nil }
            
            do {
                let rocketInfo = try JSONDecoder().decode(RocketInfo.self, from: data)
                return rocketInfo
            } catch {
                print("Error, can`t parse RocketInfo")
                return nil
            }
            //            let RocketModel = RocketModel(name: rocketInfo.name,
            //                                          cost_per_launch: rocketInfo.cost_per_launch,
            //                                          first_flight: rocketInfo.first_flight,
            //                                          country: rocketInfo.country,
            //                                          height: rocketInfo.height,
            //                                          diameter: rocketInfo.diameter,
            //                                          mass: rocketInfo.mass,
            //                                          payload_weights: rocketInfo.payload_weights,
            //                                          flickr_images: rocketInfo.flickr_images,
            //                                          first_stage: rocketInfo.first_stage,
            //                                          second_stage: rocketInfo.second_stage)
            
//            print("name is: \(rocketInfo.name) and second stage burt time sec is: \(rocketInfo.second_stage.burn_time_sec)")
        }
        task.resume()
    }
}
