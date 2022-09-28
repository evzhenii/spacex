//
//  RocketManager.swift
//  spaceXapp
//
//  Created by boockich mac on 28.09.2022.
//

import Foundation
import UIKit

struct RocketManager {
    func load() {
        let stringUrl = "https://api.spacexdata.com/v4/rockets"
        guard let url = URL(string: stringUrl) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print(error?.localizedDescription ?? "URL session error, no description")
                return
            }
            guard let data = data else { return }
            guard let rocketInfo = try? JSONDecoder().decode(RocketInfo.self, from: data) else {
                print("Error, can`t parse RocketInfo")
                return
            }
            if let name = rocketInfo.name, let time = rocketInfo.second_stage?.burn_time_sec {
                print("name is: \(name) and second stage burt time sec is: \(time)")
            }
        }
        task.resume()
    }
}
