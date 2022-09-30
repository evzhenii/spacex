//
//  RocketInfo.swift
//  spaceXapp
//
//  Created by boockich mac on 28.09.2022.
//

import Foundation
import UIKit

//struct RocketData: Codable {
//    var rocketArray: [Rocket]
//}

struct RocketData: Codable {
    let name: String
    let cost_per_launch: Int
    let first_flight: String
    var image: UIImage? {
        let randIndex = (Int.random(in: 0..<flickr_images.count))
        let url = URL(string: flickr_images[randIndex])
        var image: UIImage?
        DispatchQueue.global().async {
            guard let url = url else {
                return
            }
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    let parsed = UIImage(data: data)
                    image = parsed
                }
            } catch {
                print(error)
            }
        }
        return image
    }
    let country: String
    let height: Height
    let diameter: Diameter
    let mass: Mass
    let payload_weights: [Payload_weights]
    let flickr_images: [String]
    let first_stage: First_stage
    let second_stage: Second_stage
}

struct Height: Codable {
    let meters: Double
    let feet: Double
}

struct Diameter: Codable {
    let meters: Double
    let feet: Double
}

struct Mass: Codable {
    let kg: Double
    let lb: Double
}

struct Payload_weights: Codable {
    let kg: Double
    let lb: Double
}

struct First_stage: Codable {
    let engines: Int
    let fuel_amount_tons: Double
//    let burn_time_sec: Int
}

struct Second_stage: Codable {
    let engines: Int
    let fuel_amount_tons: Double
//    let burn_time_sec: Int
}
